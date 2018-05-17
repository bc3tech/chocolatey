using System;
using System.Linq;
using System.Net.Http;
using System.Xml.Linq;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Azure.WebJobs.Host;

namespace LatestVersionFunction
{
    public static class GetLatestVersion
    {
        private static readonly HttpClient _client = new HttpClient();

        [FunctionName("GetLatestVersion")]
        public static IActionResult Run([HttpTrigger(AuthorizationLevel.Function, "get", Route = null)]HttpRequest req, TraceWriter log)
        {
            //using (var changelogStream = await _client.GetStreamAsync(Environment.GetEnvironmentVariable(@"ChangeLogUrl")))
            {
                // eg: https://www.phraseexpress.com/update13.php
                var doc = XDocument.Load(Environment.GetEnvironmentVariable(@"VersionCheckUrl"));

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
                var versions = doc
                    .Element(@"xml")
                    .Element(@"client")
                    .Element(@"versions")
                    .Elements()
                    .Select(i => new Version(i.Value))
                    .OrderByDescending(i => i);

                return new OkObjectResult(versions.First().ToString());
            }
        }
    }
}
