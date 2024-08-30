using ILCS.Services;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace ILCS.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DataEntitasController : Controller
    {
        private readonly DataEntitasService _apiService;

        public DataEntitasController(DataEntitasService apiService)
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
