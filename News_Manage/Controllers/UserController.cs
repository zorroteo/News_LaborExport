using News_Manage.Models;
using NewsProject;
using NewsProject.Entitys;
using System;
using System.Data.Entity;
using System.Net;
using System.Web.Mvc;

namespace News_Manage.Controllers
{
    public class UserController : BaseController
    {
        private ModelDbContext db = new ModelDbContext();

        public ActionResult Login()
        {
            return View("Login");
        }

        [HttpPost]
        public ActionResult Login(AccountManage account)
        {
            if (IsLogin())
            {
                return RedirectToAction("Index", "News");
            }
            else
            {
                ViewBag.Message = "Thông tin tài khoản hoặc mật khẩu không chính xác, vui lòng kiểm tra lại!";
                if (ExecuteNews.Account.LoginByEmail(account.UserName, account.PassWord) ||
                    ExecuteNews.Account.LoginByUserName(account.UserName, account.PassWord))
                {
                    var user = new tblUser();
                    user = ExecuteNews.User.GetByUserName(SessionDecentralize(), account.UserName).Data ?? ExecuteNews.User.GetByEmail(SessionDecentralize(), account.UserName).Data;

                    Session[NewsProject.Commons.Session.UserName.ToString()] = user.Email;
                    Session[NewsProject.Commons.Session.Email.ToString()] = user.UserName;
                    Session[NewsProject.Commons.Session.Decentralize.ToString()] = user.Decentralize;
                    Session[NewsProject.Commons.Session.Status.ToString()] = user.Status;
                    Session[NewsProject.Commons.Session.Id.ToString()] = user.Id;

                    return RedirectToAction("Index", "News");
                }
                return View("Login", account);
            }
        }

        public ActionResult Index(int page = 1)
        {
            if (IsLogin())
            {
                //var tblUser = db.tblUsers.Where(p => p.Status != (short)NewsProject.Commons.Status.InActive);
                return View(ExecuteNews.User.GetByPageList(SessionDecentralize(), page, (short)Common.PageNumber.Normal).PagedList);
            }
            else return RedirectToAction("Login", "User");
        }

        public ActionResult New(int page = 1)
        {
            if (IsLogin())
            {
                // var tblUser = db.tblUsers.Where(p => p.Status == (short)NewsProject.Commons.Status.New);
                return View(ExecuteNews.User.GetByStatusPageList(SessionDecentralize(), (short)NewsProject.Commons.Status.New, page, (short)Common.PageNumber.Normal).PagedList);
            }
            else return RedirectToAction("Login", "User");
        }

        public ActionResult NotHandling(int page = 1)
        {
            if (IsLogin())
            {
                //var tblUser = db.tblUsers.Where(p => p.Status == (short)NewsProject.Commons.Status.NotHandling);
                //return View(tblUser.ToList());
                return View(ExecuteNews.User.GetByStatusPageList(SessionDecentralize(), (short)NewsProject.Commons.Status.NotHandling, page, (short)Common.PageNumber.Normal).PagedList);
            }
            else return RedirectToAction("Login", "User");
        }

        public ActionResult Handling(int page = 1)
        {
            if (IsLogin())
            {
                //var tblUser = db.tblUsers.Where(p => p.Status == (short)NewsProject.Commons.Status.Handling);
                //return View(tblUser.ToList());
                return View(ExecuteNews.User.GetByStatusPageList(SessionDecentralize(), (short)NewsProject.Commons.Status.Handling, page, (short)Common.PageNumber.Normal).PagedList);
            }
            else return RedirectToAction("Login", "User");
        }

        public ActionResult Deleted(int page = 1)
        {
            if (IsLogin())
            {
                //var tblUser = db.tblUsers.Where(p => p.Status == (short)NewsProject.Commons.Status.Deleted);
                //return View(tblUser.ToList());
                return View(ExecuteNews.User.GetByStatusPageList(SessionDecentralize(), (short)NewsProject.Commons.Status.Deleted, page, (short)Common.PageNumber.Normal).PagedList);
            }
            else return RedirectToAction("Login", "User");
        }

        public ActionResult UpdateStatus(int id, short status)
        {
            Common.MessageComment message = new Common.MessageComment() { Status = false, Message = string.Empty };
            if (IsLogin())
            {
                if (ModelState.IsValid)
                {
                    //var tblUser = db.tblComments.Find(id);
                    //tblUser.Status = status ?? 0;
                    //db.Entry(tblUser).State = EntityState.Modified;
                    //message.Status = db.SaveChanges() > 0;
                    message.Status = ExecuteNews.User.UpdateStatus(SessionDecentralize(), id, status).Status;
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

        public ActionResult Details(int id = 0)
        {
            if (IsLogin())
            {
                if (id == 0)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                tblUser tblUser = ExecuteNews.User.GetById(SessionDecentralize(), id).Data;
                if (tblUser == null)
                {
                    return HttpNotFound();
                }
                return View(tblUser);
            }
            else return RedirectToAction("Login", "User");
        }

        public ActionResult Create()
        {
            if (IsLogin())
            {
                if (SessionDecentralize() == (short)NewsProject.Commons.Decentralize.Admin)
                {
                    return View();
                }
                return View("Index");
            }
            else return RedirectToAction("Login", "User");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Creators,FullName,UserName,Password,Email,Img,Decentralize")] tblUser tblUser)
        {
            if (IsLogin())
            {
                if (SessionDecentralize() == (short)NewsProject.Commons.Decentralize.Admin)
                {
                    if (ModelState.IsValid)
                    {
                        tblUser.ImgResizer = tblUser.Img.Replace("/Uploads", "/Uploads/_thumbs");
                        tblUser.Creators = 1;
                        tblUser.Status = 1;
                        tblUser.CreateDate = DateTime.Now;
                        tblUser.ModifyDate = DateTime.Now;
                        var a = ExecuteNews.User.InsertAndUpdate(SessionDecentralize(), tblUser).Status;
                        return RedirectToAction("Index");
                    }
                    return View(tblUser);
                }
                return View("Index");
            }
            else return RedirectToAction("Login", "User");
        }

        public ActionResult Edit(int id = 0)
        {
            if (IsLogin())
            {
                if (SessionDecentralize() == (short)NewsProject.Commons.Decentralize.Admin)
                {
                    if (id == 0)
                    {
                        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                    }
                    var tblNew = ExecuteNews.User.GetById(SessionDecentralize(), id).Data;
                    if (tblNew == null)
                    {
                        return HttpNotFound();
                    }
                    return View(tblNew);
                }
                return View("Index");
            }
            else return RedirectToAction("Login", "User");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Group,Titles,Describe,Content,Img,Order,View")] tblNew tblNew)
        {
            if (IsLogin())
            {
                if (SessionDecentralize() == (short)NewsProject.Commons.Decentralize.Admin)
                {
                    if (ModelState.IsValid)
                    {
                        tblNew.ImgResizer = tblNew.Img.Replace("/Uploads", "/Uploads/_thumbs");
                        tblNew.ModifyDate = DateTime.Now;
                        db.Entry(tblNew).State = EntityState.Modified;
                        db.SaveChanges();
                        return RedirectToAction("Index");
                    }
                    return View(tblNew);
                }
                return View("Index");
            }
            else return RedirectToAction("Login", "User");
        }

        public ActionResult Delete(int id = 0)
        {
            if (IsLogin())
            {
                if (SessionDecentralize() == (short)NewsProject.Commons.Decentralize.Admin)
                {
                    if (id == 0)
                    {
                        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                    }
                    tblUser tblUser = ExecuteNews.User.GetById(SessionDecentralize(), id).Data;
                    if (tblUser == null)
                    {
                        return HttpNotFound();
                    }
                    return View(tblUser);
                }
                return View("Index");
            }
            else return RedirectToAction("Login", "User");
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            if (IsLogin())
            {
                if (SessionDecentralize() == (short)NewsProject.Commons.Decentralize.Admin)
                {
                    //tblNew tblNew = db.tblNews.Find(id);
                    //db.tblNews.Remove(tblNew);
                    //db.SaveChanges();
                    var a = ExecuteNews.User.DeleteById(SessionDecentralize(), id).Status;
                    return RedirectToAction("Index");
                }
                return View("Index");
            }
            else return RedirectToAction("Login", "User");
        }
    }
}