
using System;
using System.Linq;
using System.Net.Http;
using System.Security.Cryptography;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Azure.WebJobs.Host;

namespace VivaldiVersionChecker
{
    public static class ComputeSha
    {
        private static readonly HttpClient _client = new HttpClient();

        [FunctionName("ComputeSha")]
        public static async System.Threading.Tasks.Task<IActionResult> RunAsync([HttpTrigger(AuthorizationLevel.Function, "get", Route = null)]HttpRequest req, TraceWriter log)
        {
            string targetUrl = null;
            if (req.GetQueryParameterDictionary()?.TryGetValue(@"targetUrl", out targetUrl) == false)
            {
                return new BadRequestResult();
            }

            // We make use of using(), streams, and GC.Collect() here to make sure our Function keeps its memory footprint low so as not to incur unnecessary usage charges on the consumption plan
            string hashString;
            using (var sha = SHA256.Create())
            {
                using (var versionByteStream = await _client.GetStreamAsync(targetUrl))
                {
                    hashString = string.Join(string.Empty, sha.ComputeHash(versionByteStream).Select(b => b.ToString("X2")));
                    log.Info($@"hash: {hashString}");
                }
                GC.Collect();
            }
            GC.Collect();

            return new OkObjectResult(hashString);
        }
    }
}
