using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Entity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using WBL;

namespace WebApplication.Pages.Vehiculo
{
    public class GridModel : PageModel
    {
        private readonly IVehiculoService vehiculoService;

        public GridModel(IVehiculoService vehiculoService)
        {
            this.vehiculoService = vehiculoService;
        }


        public IEnumerable<VehiculoEntity> GridList { get; set; } = new List<VehiculoEntity>();

        // public string Mensaje { get; set; } = "";
        public async Task<IActionResult> OnGet()
        {
            try
            {
                GridList = await vehiculoService.Get();


                return Page();


            }
            catch (Exception ex)
            {

                return Content(ex.Message);
            }
        }

        public async Task<JsonResult> OnDeleteEliminar(int id)
        {
            try
            {
                var result = await vehiculoService.Delete(new()
                {
                   VehiculoId = id
                });



                return new JsonResult(result);
            }
            catch (Exception ex)
            {

                return new JsonResult(new DBEntity { CodeError = ex.HResult, MsgError = ex.Message });
            }

        }
    }
}
