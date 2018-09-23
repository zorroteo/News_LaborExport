using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using NewsProject;
using NewsProject.Entitys;

namespace News_Manage.Controllers
{
    public class CommentsController : BaseController
    {
        private ModelDbContext db = new ModelDbContext();

        public ActionResult Index()
        {
            if (IsLogin())
            {
                var tblComments = db.tblComments.Where(p => p.Status != (short)NewsProject.Commons.Status.InActive).Include(t => t.tblComment2).Include(t => t.tblNew);
                return View(tblComments.ToList());
            }
            else return RedirectToAction("Login", "User");
        }

        public ActionResult New(int page = 1)
        {
            if (IsLogin())
            {
                //var tblComments = db.tblComments.Where(p => p.Status == (short)NewsProject.Commons.Status.New).Include(t => t.tblComment2).Include(t => t.tblNew);
                //return View(tblComments.ToList());
                return View(ExecuteNews.Comment.GetByStatusPagedList((short)NewsProject.Commons.Status.New, page, (short)NewsProject.Commons.NumberPaging.Normal));
            }
            else return RedirectToAction("Login", "User");
        }

        public ActionResult NotHandling(int page = 1)
        {
            if (IsLogin())
            {
                //var tblComments = db.tblComments.Where(p => p.Status == (short)NewsProject.Commons.Status.NotHandling).Include(t => t.tblComment2).Include(t => t.tblNew);
                //return View(tblComments.ToList());
                return View(ExecuteNews.Comment.GetByStatusPagedList((short)NewsProject.Commons.Status.NotHandling, page, (short)NewsProject.Commons.NumberPaging.Normal));
            }
            else return RedirectToAction("Login", "User");
        }

        public ActionResult Handling(int page = 1)
        {
            if (IsLogin())
            {
                //var tblComments = db.tblComments.Where(p => p.Status == (short)NewsProject.Commons.Status.Handling).Include(t => t.tblComment2).Include(t => t.tblNew);
                //return View(tblComments.ToList());
                return View(ExecuteNews.Comment.GetByStatusPagedList((short)NewsProject.Commons.Status.Handling, page, (short)NewsProject.Commons.NumberPaging.Normal));
            }
            else return RedirectToAction("Login", "User");
        }

        public ActionResult Deleted(int page = 1)
        {
            if (IsLogin())
            {
                //var tblComments = db.tblComments.Where(p => p.Status == (short)NewsProject.Commons.Status.Deleted).Include(t => t.tblComment2).Include(t => t.tblNew);
                //return View(tblComments.ToList());
                return View(ExecuteNews.Comment.GetByStatusPagedList((short)NewsProject.Commons.Status.Deleted, page, (short)NewsProject.Commons.NumberPaging.Normal));
            }
            else return RedirectToAction("Login", "User");
        }

        public ActionResult Details(long? id)
        {
            if (IsLogin())
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                tblComment tblComment = db.tblComments.Find(id);
                if (tblComment == null)
                {
                    return HttpNotFound();
                }
                return View(tblComment);
            }
            else return RedirectToAction("Login", "User");
        }

        public ActionResult Create()
        {
            ViewBag.ParentId = new SelectList(db.tblComments, "Id", "Name");
            ViewBag.News = new SelectList(db.tblNews, "Id", "Titles");
            return View();
        }

        public ActionResult UpdateStatus(long? id, short? status)
        {
            Common.MessageComment message = new Common.MessageComment() { Status = false, Message = string.Empty };
            if (IsLogin())
            {
                if (ModelState.IsValid)
                {
                    var tblComment = db.tblComments.Find(id);
                    tblComment.Status = status ?? 0;
                    db.Entry(tblComment).State = EntityState.Modified;
                    message.Status = db.SaveChanges() > 0;
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

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,ParentId,News,Name,Email,PhoneNumber,Content,Status,CreateDate,ModifyDate")] tblComment tblComment)
        {
            if (ModelState.IsValid)
            {
                db.tblComments.Add(tblComment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ParentId = new SelectList(db.tblComments, "Id", "Name", tblComment.ParentId);
            ViewBag.News = new SelectList(db.tblNews, "Id", "Titles", tblComment.News);
            return View(tblComment);
        }

        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblComment tblComment = db.tblComments.Find(id);
            if (tblComment == null)
            {
                return HttpNotFound();
            }
            ViewBag.ParentId = new SelectList(db.tblComments, "Id", "Name", tblComment.ParentId);
            ViewBag.News = new SelectList(db.tblNews, "Id", "Titles", tblComment.News);
            return View(tblComment);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,ParentId,News,Name,Email,PhoneNumber,Content,Status,CreateDate,ModifyDate")] tblComment tblComment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblComment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ParentId = new SelectList(db.tblComments, "Id", "Name", tblComment.ParentId);
            ViewBag.News = new SelectList(db.tblNews, "Id", "Titles", tblComment.News);
            return View(tblComment);
        }

        public ActionResult Delete(long? id)
        {
            if (IsLogin())
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                tblComment tblComment = db.tblComments.Find(id);
                if (tblComment == null)
                {
                    return HttpNotFound();
                }
                return View(tblComment);
            }
            else return RedirectToAction("Login", "User");
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            if (IsLogin())
            {
                tblComment tblComment = db.tblComments.Find(id);
                db.tblComments.Remove(tblComment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else return RedirectToAction("Login", "User");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
