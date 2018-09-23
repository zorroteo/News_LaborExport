using System.Web.Mvc;
using System;
using System.Collections.Generic;
using NewsProject.Entitys;

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
            // var groups = NewsProject.ExecuteNews.Group.GetByPaging(1, (short)Common.PageSize.Small);
            //if (groups == null)
            //{
            //    return null;
            //}
            //foreach (var item in groups)
            //{
            //    item.Childrens = NewsProject.ExecuteNews.Group.GetByParent(item.Id);
            //}

            return View("NewsNavbar", "hello");
        }
    }
}