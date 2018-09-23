using NewsProject;
using NewsProject.Entitys;
using System;
using System.Net;
using System.Web.Mvc;

namespace News_Manage.Controllers
{
    public class NewsController : BaseController
    {
        public ActionResult Index(int page = 1)
        {
            if (IsLogin())
            {
                return View(ExecuteNews.News.GetAllPageList(SessionDecentralize(), page, (short)Common.PageNumber.Normal).PagedList);
                //return View(db.tblNews.Include(t => t.tblGroup).OrderByDescending(p => p.Id).ToPagedList(page, (short)Common.PageNumber.Normal));
            }
            else return RedirectToAction("Login", "User");
        }

        public ActionResult New(int page = 1)
        {
            if (IsLogin())
            {
                return View(ExecuteNews.News.GetByStatusPageList(SessionDecentralize(), (short)NewsProject.Commons.Status.New, page, (short)Common.PageNumber.Normal).PagedList);
                //return View(db.tblNews.Where(p => p.Status == (short)NewsProject.Commons.Status.New).Include(t => t.tblGroup).OrderByDescending(p => p.Id).ToPagedList(page, (short)Common.PageNumber.Normal));
            }
            else return RedirectToAction("Login", "User");
        }

        public ActionResult NotHandling(int page = 1)
        {
            if (IsLogin())
            {
                return View(ExecuteNews.News.GetByStatusPageList(SessionDecentralize(), (short)NewsProject.Commons.Status.NotHandling, page, (short)Common.PageNumber.Normal).PagedList);
                // return View(db.tblNews.Where(p => p.Status == (short)NewsProject.Commons.Status.NotHandling).Include(t => t.tblGroup).OrderByDescending(p => p.Id).ToPagedList(page, (short)Common.PageNumber.Normal));
            }
            else return RedirectToAction("Login", "User");
        }

        public ActionResult Handling(int page = 1)
        {
            if (IsLogin())
            {
                return View(ExecuteNews.News.GetByStatusPageList(SessionDecentralize(), (short)NewsProject.Commons.Status.Handling, page, (short)Common.PageNumber.Normal).PagedList);
                //return View(db.tblNews.Where(p => p.Status == (short)NewsProject.Commons.Status.Handling).Include(t => t.tblGroup).OrderByDescending(p => p.Id).ToPagedList(page, (short)Common.PageNumber.Normal));
            }
            else return RedirectToAction("Login", "User");
        }

        public ActionResult Deleted(int page = 1)
        {
            if (IsLogin())
            {
                return View(ExecuteNews.News.GetByStatusPageList(SessionDecentralize(), (short)NewsProject.Commons.Status.Deleted, page, (short)Common.PageNumber.Normal).PagedList);
                //return View(db.tblNews.Where(p => p.Status == (short)NewsProject.Commons.Status.Deleted).Include(t => t.tblGroup).OrderByDescending(p => p.Id).ToPagedList(page, (short)Common.PageNumber.Normal));
            }
            else return RedirectToAction("Login", "User");
        }

        public ActionResult UpdateStatus(int id, short? status)
        {
            Common.MessageNews message = new Common.MessageNews() { Status = false, Message = string.Empty };
            if (IsLogin())
            {
                if (ModelState.IsValid)
                {
                    //var tblNews = db.tblNews.Find(id);
                    //tblNews.Status = status ?? 0;
                    //db.Entry(tblNews).State = EntityState.Modified;
                    //message.Status = db.SaveChanges() > 0;
                    message.Status = ExecuteNews.News.UpdateStatus(SessionDecentralize(), id, status ?? 0).Status;
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

        public ActionResult UpdateView(int id)
        {
            Common.MessageNews message = new Common.MessageNews() { Status = false, Message = string.Empty };
            if (IsLogin())
            {
                if (ModelState.IsValid)
                {
                    //var tblNews = db.tblNews.Find(id);
                    //tblNews.View = tblNews.View + 1;
                    //db.Entry(tblNews).State = EntityState.Modified;
                    //message.Status = db.SaveChanges() > 0;
                    message.Status = ExecuteNews.News.UpdateView(SessionDecentralize(), id).Status;
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
                tblNew tblNew = ExecuteNews.News.GetById(SessionDecentralize(), id).Data;
                if (tblNew == null)
                {
                    return HttpNotFound();
                }
                return View(tblNew);
            }
            else return RedirectToAction("Login", "User");
        }

        public ActionResult Create()
        {
            if (IsLogin())
            {
                ViewBag.Group = new SelectList(ExecuteNews.Group.GetAll(), "Id", "Title");
                return View();
            }
            else return RedirectToAction("Login", "User");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Group,Titles,Describe,Content,Img,Order,View")] tblNew tblNew)
        {
            if (IsLogin())
            {
                if (ModelState.IsValid)
                {
                    tblNew.ImgResizer = tblNew.Img.Replace("/Uploads", "/Uploads/_thumbs");
                    tblNew.Creators = 1;
                    tblNew.Position = 1;
                    tblNew.Status = 1;
                    tblNew.CreateDate = DateTime.Now;
                    tblNew.ModifyDate = DateTime.Now;
                    //db.tblNews.Add(tblNew);
                    //db.SaveChanges();
                    var a = ExecuteNews.News.InsertAndUpdate(SessionDecentralize(), tblNew).Status;
                    return RedirectToAction("Index");
                }

                ViewBag.Group = new SelectList(ExecuteNews.Group.GetAll(), "Id", "Title", tblNew.Group);
                return View(tblNew);
            }
            else return RedirectToAction("Login", "User");
        }

        public ActionResult Edit(int id)
        {
            if (IsLogin())
            {
                if (id == 0)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                var tblNew = ExecuteNews.News.GetById(SessionDecentralize(), id).Data;
                if (tblNew == null)
                {
                    return HttpNotFound();
                }
                ViewBag.Group = new SelectList(ExecuteNews.Group.GetAll(), "Id", "Title", tblNew.Group);
                return View(tblNew);
            }
            else return RedirectToAction("Login", "User");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Group,Titles,Describe,Content,Img,Order,View")] tblNew tblNew)
        {
            if (IsLogin())
            {
                if (ModelState.IsValid)
                {
                    tblNew.ImgResizer = tblNew.Img.Replace("/Uploads", "/Uploads/_thumbs");
                    tblNew.ModifyDate = DateTime.Now;
                    //db.Entry(tblNew).State = EntityState.Modified;
                    //db.SaveChanges();
                    var a = ExecuteNews.News.InsertAndUpdate(SessionDecentralize(), tblNew).Status;
                    return RedirectToAction("Index");
                }
                ViewBag.Group = new SelectList(ExecuteNews.Group.GetAll(), "Id", "Title", tblNew.Group);
                return View(tblNew);
            }
            else return RedirectToAction("Login", "User");
        }

        public ActionResult Delete(int id)
        {
            if (IsLogin())
            {
                if (id == 0)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                tblNew tblNew = ExecuteNews.News.GetById(SessionDecentralize(), id).Data;
                if (tblNew == null)
                {
                    return HttpNotFound();
                }
                return View(tblNew);
            }
            else return RedirectToAction("Login", "User");
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            if (IsLogin())
            {
                //tblNew tblNew = db.tblNews.Find(id);
                //db.tblNews.Remove(tblNew);
                //db.SaveChanges();

                var a = ExecuteNews.News.DeleteById(SessionDecentralize(), id).Status;

                return RedirectToAction("Index");
            }
            else return RedirectToAction("Login", "User");
        }
    }
}