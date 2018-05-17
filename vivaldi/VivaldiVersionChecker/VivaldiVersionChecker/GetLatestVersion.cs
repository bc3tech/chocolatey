
using System;
using System.Linq;
using System.Net.Http;
using System.Xml.Linq;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Azure.WebJobs.Host;

namespace VivaldiVersionChecker
{
    public static class GetLatestVersion
    {
        private static readonly HttpClient _client = new HttpClient();

        [FunctionName("GetLatestVersion")]
        public static async System.Threading.Tasks.Task<IActionResult> RunAsync([HttpTrigger(AuthorizationLevel.Function, "get", Route = null)]HttpRequest req, TraceWriter log)
        {
            bool isSnapshot = false;
            string parmValue = null;
            if (req.GetQueryParameterDictionary()?.TryGetValue(@"snapshot", out parmValue) == true)
            {
                if (!bool.TryParse(parmValue, out isSnapshot))
                {
                    isSnapshot = false;
                }
            }

            string targetUrl = isSnapshot ? Environment.GetEnvironmentVariable(@"SnapshotVersionCheckUrl") : Environment.GetEnvironmentVariable(@"ReleaseVersionCheckUrl");

            var xdocResult = XDocument.Load(await _client.GetStreamAsync(targetUrl));

            /* eg:
<?xml version="1.0" encoding="utf-8"?>
<rss version="2.0" xmlns:sparkle="http://www.andymatuschak.org/xml-namespaces/sparkle">
    <channel>
        <item>
            <sparkle:releaseNotesLink>https://update.vivaldi.com/update/1.0/relnotes/snapshot/1.16.1183.3.html</sparkle:releaseNotesLink>
            <sparkle:deltas>
                <enclosure url="https://downloads.vivaldi.com/snapshot-auto/Vivaldi.1.16.1177.5-1.16.1183.3.x64.delta.7z.cab" sparkle:deltaFrom="1.16.1177.5" sparkle:version="1.16.1183.3"/>
            </sparkle:deltas>
            <enclosure url="https://downloads.vivaldi.com/snapshot-auto/Vivaldi.1.16.1183.3.x64.exe" sparkle:version="1.16.1183.3"/>
            <sparkle:minimumSystemVersion>6.0.9999</sparkle:minimumSystemVersion>
        </item>
    </channel>
</rss>
            */
            var version = xdocResult
                .Element(@"rss")
                .Element(@"channel")
                .Element(@"item")
                .Element(@"enclosure")
                .Attributes()
                    .Single(a => a.Name.LocalName.Equals(@"version", StringComparison.OrdinalIgnoreCase));

            return new OkObjectResult(version.Value);
        }
    }
}
