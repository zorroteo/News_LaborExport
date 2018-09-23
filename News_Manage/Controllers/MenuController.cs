using System.Web.Mvc;

namespace News_Manage.Controllers
{
    public class MenuController : BaseController
    {
        // GET: Menu
        public ActionResult AdminMenu()
        {
            if (IsLogin())
            {
                return View();
            }
            else return RedirectToAction("Login", "User");
        }

        public ActionResult NewsFooterWidget()
        {
            return View();
        }

        public ActionResult NewsFooter()
        {
            return View();
        }
        /// <summary>
        /// Menu common
        /// </summary>
        /// <returns></returns>
        public ActionResult NewsNavbar()
        {
            //if (IsLogin())
            //{
            //    return View();
            //}
            //else return RedirectToAction("Login", "User");

            return View();
        }
    }
}