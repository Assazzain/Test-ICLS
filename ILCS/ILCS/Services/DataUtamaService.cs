using System.Net.Http;
using System.Threading.Tasks;

namespace ILCS.Services
{
    public class DataUtamaService
    {
        private readonly HttpClient _httpClient;

        public DataUtamaService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task<string> GetDataFromApi()
        {
            var response = await _httpClient.GetStringAsync("https://api-hub.ilcs.co.id/test/v2/dataUtama?nomor_pengajuan=20120B388FAE20240402000001");
            return response;
        }
    }
}
