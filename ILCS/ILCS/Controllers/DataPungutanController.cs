using ILCS.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace ILCS.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DataPungutanController : ControllerBase
    {
        private readonly DataPungutanService _apiService;

        public DataPungutanController(DataPungutanService apiService)
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
