using System.Web.Mvc;

namespace News_Manage.Controllers
{
    public class ErrorController : Controller
    {
        // GET: Error
        public ActionResult NotFound()
        {
            return View("NotFound");
        }
    }
}