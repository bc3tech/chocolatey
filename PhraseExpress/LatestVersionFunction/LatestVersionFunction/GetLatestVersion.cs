using System;
using System.Linq;
using System.Net.Http;
using System.Security.Cryptography;
using System.Xml.Linq;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Extensions.Logging;

namespace LatestVersionFunction
{
    public static class GetLatestVersion
    {
        private static readonly HttpClient _client = new HttpClient();

        [FunctionName("GetLatestVersion")]
        public static async System.Threading.Tasks.Task<IActionResult> RunAsync([HttpTrigger(AuthorizationLevel.Function, "get", Route = null)] HttpRequest req, ILogger log)
        {
            //using (var changelogStream = await _client.GetStreamAsync(Environment.GetEnvironmentVariable(@"ChangeLogUrl")))
            {
                // eg: https://www.phraseexpress.com/update13.php
                var doc = XDocument.Load($@"{Environment.GetEnvironmentVariable(@"VersionCheckUrl")}?{Environment.GetEnvironmentVariable(@"VersionCheckQueryParams")}");

                /* sample doc
<xml>
    <debug></debug>
    <product>PhraseExpress</product>
    <interval>3</interval>
    <webpage></webpage>
    <info>1</info>
    <client>
        <versions>
            <newversion>13.0.0</newversion>
            <majorupdate>13.6.7</majorupdate>
            <minorupdate>13.0.0</minorupdate>
            <experimentalupdate>13.0.0</experimentalupdate>
            <betaversion>13.0.0</betaversion>
        </versions>
        <installationtype>
        * */
                var clientElement = doc
                    .Element(@"xml")
                    .Element(@"client");
                var versions = clientElement
                    .Element(@"versions")
                    .Elements();

                var downloadBaseUrl = Environment.GetEnvironmentVariable(@"DownloadBaseUrl");

                string zipHashString,
                    zipDownloadUrl = $@"{downloadBaseUrl}PhraseExpress_USB.zip",
                    msiHashString,
                    msiDownloadUrl = $@"{downloadBaseUrl}PhraseExpressSetup.msi";

                string targetVersion;
                if (req.GetQueryParameterDictionary().TryGetValue(@"beta", out var betaValue)
                    && bool.TryParse(betaValue, out var isBeta)
                    && isBeta)
                {
                    targetVersion = versions.Single(i => i.Name.LocalName.Equals(@"betaversion", StringComparison.OrdinalIgnoreCase)).Value;
                    zipDownloadUrl = $@"{downloadBaseUrl}PhraseExpressBeta_USB.zip";
                    msiDownloadUrl = $@"{downloadBaseUrl}PhraseExpressBetaSetup.exe";
                }
                else
                {   // assuming the default download URL is always a minor version
                    targetVersion = versions.Single(i => i.Name.LocalName.Equals(@"minorupdate", StringComparison.OrdinalIgnoreCase)).Value;
                }

                using (var sha = SHA256.Create())
                {
                    try
                    {
                        using (var versionDownload = await _client.GetStreamAsync(zipDownloadUrl))
                        {
                            var hashBytes = sha.ComputeHash(versionDownload);
                            zipHashString = string.Join(string.Empty, hashBytes.Select(b => b.ToString("X2")));
                            log.LogInformation($@"ZIP computed hash: {zipHashString}");
                        }
                        GC.Collect();

                        using (var versionDownload = await _client.GetStreamAsync(msiDownloadUrl))
                        {
                            var hashBytes = sha.ComputeHash(versionDownload);
                            msiHashString = string.Join(string.Empty, hashBytes.Select(b => b.ToString("X2")));
                            log.LogInformation($@"MSI computed hash: {msiHashString}");
                        }
                        GC.Collect();
                    }
                    catch (HttpRequestException ex)
                    {
                        return new NotFoundObjectResult(new { zipDownloadUrl, msiDownloadUrl, exception = ex.ToString() });
                    }
                }
                GC.Collect();

                return new OkObjectResult(new { version = targetVersion, zip = new { download = zipDownloadUrl, hash = zipHashString }, msi = new { download = msiDownloadUrl, hash = msiHashString } });
            }
        }
    }
}
