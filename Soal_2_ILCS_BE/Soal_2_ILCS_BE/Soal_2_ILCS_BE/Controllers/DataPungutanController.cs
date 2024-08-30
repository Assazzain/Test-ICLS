using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Soal_2_ILCS_BE.Services;
using System.Text.Json;
using System.Threading.Tasks;


namespace Soal_2_ILCS_BE.Controllers
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
            var jsonData = await _apiService.GetDataFromApi();

            var data = JsonSerializer.Deserialize<dynamic>(jsonData);

            if (data != null)
            {
                data.fob = data.nilai_incoterm + data.biaya_tambahan - data.biaya_pengurang + data.tarif_vd;

                data.cif = data.fob + data.nilai_asuransi + data.freight;

                data.cif_rp = data.CIF * data.nilai_kurs;
            }

            if (string.IsNullOrWhiteSpace(jsonData))
            {
                return NotFound(new { message = "Data tidak ditemukan." });
            }
            else
            {
                return Ok(data);
            }
        }


    }
}
