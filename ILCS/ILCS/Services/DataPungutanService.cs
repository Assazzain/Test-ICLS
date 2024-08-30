using System.Net.Http;
using System.Threading.Tasks;

namespace ILCS.Services
{
    public class DataPungutanService
    {
        private readonly HttpClient _httpClient;

        public DataPungutanService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task<string> GetDataFromApi()
        {
            var response = await _httpClient.GetStringAsync("https://api-hub.ilcs.co.id/test/v2/dataPungutan?id_aju=04eb6a72-bb63-5aed-5e92-f58a3bfd5da2");
            return response;
        }
    }
}
