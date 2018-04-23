using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Example.Models;

namespace Example.Controllers {
    [HandleError]
    public class HomeController : Controller {
        public ActionResult Index() {
            ViewData["Message"] = "Welcome to DevExpress Extensions for ASP.NET MVC!";

            return View();
        }

        public ActionResult GridViewPartial() {
            return PartialView("GridViewPartial");
        }

        public JsonResult GetRowData(Int32 keyValue) {
            JsonResult result = new JsonResult();

            // get data by key value from you data source and put it to result.Data
            DataClassesDataContext context = new DataClassesDataContext();
            var product = context.Products
                .Select(p => p)
                .Where(p => p.ProductID == keyValue)
                .First();

            result.Data = new { Discontinued = product.Discontinued };

            return result;
        }
    }
}
