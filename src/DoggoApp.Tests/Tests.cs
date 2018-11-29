using System;
using System.Net.Http;
using System.Threading.Tasks;
using NUnit.Framework;

namespace DoggoApp.Tests
{
    [TestFixture]
    public class Tests
    {
        [Test]
        public async Task Test()
        {
            using (var client = new HttpClient())
            {
                var response = await client.GetAsync("http://localhost:5000");
            }
        }
    }
}