using NewsProject;
using NewsProject.Entitys;
using System;
using System.Net;
using System.Web.Mvc;

namespace News_Manage.Controllers
{
    public class SupportController : BaseController
    {
        public ActionResult Index(int page = 1)
        {
            if (IsLogin())
            {
                //return View(db.tblSupports.OrderByDescending(p => p.Id).ToPagedList(page, (short)Common.PageNumber.Normal));
                return View(ExecuteNews.Support.GetByPageList(page, (short)Common.PageSize.Normal));
            }
            else return RedirectToAction("Login", "User");
        }

        public ActionResult New(int page = 1)
        {
            if (IsLogin())
            {
                return View(ExecuteNews.Support.GetByStatusPageList((short)NewsProject.Commons.Status.New, page, (short)Common.PageSize.Normal));
                //return View(db.tblSupports.Where(p => p.Status == (short)NewsProject.Commons.Status.New).OrderByDescending(p => p.Id).ToPagedList(page, (short)Common.PageNumber.Normal));
            }
            else return RedirectToAction("Login", "User");
        }

        public ActionResult NotHandling(int page = 1)
        {
            if (IsLogin())
            {
                return View(ExecuteNews.Support.GetByStatusPageList((short)NewsProject.Commons.Status.NotHandling, page, (short)Common.PageSize.Normal));
                //return View(db.tblSupports.Where(p => p.Status == (short)NewsProject.Commons.Status.NotHandling).OrderByDescending(p => p.Id).ToPagedList(page, (short)Common.PageNumber.Normal));
            }
            else return RedirectToAction("Login", "User");
        }

        public ActionResult Handling(int page = 1)
        {
            if (IsLogin())
            {
                return View(ExecuteNews.Support.GetByStatusPageList((short)NewsProject.Commons.Status.Handling, page, (short)Common.PageSize.Normal));
                //return View(db.tblSupports.Where(p => p.Status == (short)NewsProject.Commons.Status.Handling).OrderByDescending(p => p.Id).ToPagedList(page, (short)Common.PageNumber.Normal));
            }
            else return RedirectToAction("Login", "User");
        }

        public ActionResult Deleted(int page = 1)
        {
            if (IsLogin())
            {
                return View(ExecuteNews.Support.GetByStatusPageList((short)NewsProject.Commons.Status.Deleted, page, (short)Common.PageSize.Normal));
                // return View(db.tblSupports.Where(p => p.Status == (short)NewsProject.Commons.Status.Deleted).OrderByDescending(p => p.Id).ToPagedList(page, (short)Common.PageNumber.Normal));
            }
            else return RedirectToAction("Login", "User");
        }

        public ActionResult UpdateStatus(int id, short status)
        {
            Common.MessageSupport message = new Common.MessageSupport() { Status = false, Message = string.Empty };
            if (IsLogin())
            {
                if (ModelState.IsValid)
                {
                    //var tblSupport = db.tblSupports.Find(id);
                    //tblSupport.Status = status ?? 0;
                    //db.Entry(tblSupport).State = EntityState.Modified;
                    //message.Status = db.SaveChanges() > 0;
                    message.Status = ExecuteNews.Support.UpdateStatus(id, status);
                    message.Message = message.Status == true ? "Hành động thành công!" : "Hành động thất bại!";
                }
                message.Message = "Hành động thất bại!";
            }
            else
            {
                message.Message = "Bạn không có quền thực hiện hành động này!";
                RedirectToAction("Login", "User");
            }
            return Json(message, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Details(int id)
        {
            if (IsLogin())
            {
                if (id == 0)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                tblSupport tblSupport = ExecuteNews.Support.GetById(id);
                if (tblSupport == null)
                {
                    return HttpNotFound();
                }
                return View(tblSupport);
            }
            else return RedirectToAction("Login", "User");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,FullName,Email,Phone,Country,City,GradeLevel,Major,TimeExpected,Question")] tblSupport tblSupport)
        {
            if (ModelState.IsValid)
            {
                tblSupport.CreateDate = DateTime.Now;
                tblSupport.Status = (short)NewsProject.Commons.Status.New;
                //db.tblSupports.Add(tblSupport);
                //db.SaveChanges();
                ExecuteNews.Support.InsertAndUpdate(tblSupport);
                return RedirectToAction("HomeNews", "Home");
            }
            return RedirectToAction("HomeNews", "Home");
        }

        public ActionResult Delete(int id = 0)
        {
            if (IsLogin())
            {
                if (id == 0)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                tblSupport tblSupport = ExecuteNews.Support.GetById(id);
                if (tblSupport == null)
                {
                    return HttpNotFound();
                }
                return View(tblSupport);
            }
            else return RedirectToAction("Login", "User");
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            if (IsLogin())
            {
                //tblSupport tblSupport = db.tblSupports.Find(id);
                //db.tblSupports.Remove(tblSupport);
                //db.SaveChanges();
                ExecuteNews.Support.UpdateStatus(id, (short)NewsProject.Commons.Status.Deleted);
                return RedirectToAction("Index");
            }
            else return RedirectToAction("Login", "User");
        }
    }
}