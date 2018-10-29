using System;
using System.Net.Http;
using System.Threading.Tasks;
using Xunit;

namespace integration
{
    public class EmailTest
    {
        public const string GeneratorApiRoot = "http://generator";
        [Fact]
        public async Task Test1()
        {
            var client = new HttpClient();
            var request = new HttpRequestMessage
            {
                Method = HttpMethod.Get,
                RequestUri = new Uri($"{GeneratorApiRoot}/EmailRandomNames")
            }; 


            using (var response= await client.SendAsync(request))
            {
                response.EnsureSuccessStatusCode();
            }
        }
    }
}
