using ILCS.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace ILCS.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DataUtamaController : ControllerBase
    {
        private readonly DataUtamaService _apiService;

        public DataUtamaController(DataUtamaService apiService)
        {
            _apiService = apiService;
        }

        [HttpGet("getdata")]
        public async Task<IActionResult> GetData()
        {
            var data = await _apiService.GetDataFromApi();
            return Ok(data);
        }
    }
}
