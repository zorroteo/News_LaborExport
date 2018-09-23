using NewsProject.Entitys;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;

namespace NewsProject.Access
{
    internal class AUser
    {
        public tblUser GetById(int id)
        {
            using (var db = new ModelDbContext())
            {
                return db.tblUsers.Find(id);
            }
        }

        public tblUser GetByUserName(string userName)
        {
            using (var db = new ModelDbContext())
            {
                return db.tblUsers.SingleOrDefault(p => p.UserName.ToLower().Equals(userName.ToLower().Trim()));
            }
        }

        public tblUser GetByEmail(string email)
        {
            using (var db = new ModelDbContext())
            {
                return db.tblUsers.SingleOrDefault(p => p.Email.ToLower().Equals(email.ToLower().Trim()));
            }
        }

        public bool InsertAndUpdate(tblUser user)
        {
            using (var db = new ModelDbContext())
            {
                var item = new tblUser() { Id = user.Id };
                if (db.tblUsers.Any(p => p.Id == user.Id))
                {
                    db.tblUsers.Attach(item);
                    item.FullName = user.FullName;
                    item.ModifyDate = DateTime.Now;
                    item.UserName = user.UserName;
                    item.Password = Commons.Encode.MD5(user.Password);
                    item.Img = user.Img;
                    item.ImgResizer = user.ImgResizer;
                    item.Email = user.Email;
                }
                else db.tblUsers.Add(user);
                return db.SaveChanges() > 0;
            }
        }

        public bool DeleteById(int id)
        {
            using (var db = new ModelDbContext())
            {
                if (!db.tblUsers.Any(p => p.Id == id)) return false;
                var item = new tblUser() { Id = id };
                db.tblUsers.Attach(item);
                db.tblUsers.Remove(item);
                return db.SaveChanges() > 0;
            }
        }

        public bool UpdateStatus(int id, short status)
        {
            using (var db = new ModelDbContext())
            {
                var item = new tblUser() { Id = id };
                if (db.tblUsers.Any(p => p.Id == id))
                {
                    db.tblUsers.Attach(item);
                    item.Status = status;
                }
                else return false;
                return db.SaveChanges() > 0;
            }
        }

        public bool UpdatePassword(int id, string password)
        {
            using (var db = new ModelDbContext())
            {
                var item = new tblUser() { Id = id };
                if (db.tblUsers.Any(p => p.Id == id))
                {
                    db.tblUsers.Attach(item);
                    item.Password = Commons.Encode.MD5(password);
                }
                else return false;
                return db.SaveChanges() > 0;
            }
        }

        public ICollection<tblUser> GetByPaging(int pageNumber, int pageSize)
        {
            using (var db = new ModelDbContext())
            {
                return db.tblUsers.Where(p => p.Status != (short)Commons.Status.Deleted).OrderByDescending(p => p.Id).Skip(pageNumber * pageSize).Take(pageNumber).ToList();
            }
        }

        public ICollection<tblUser> GetByStatusPaging(short status, int pageNumber, int pageSize)
        {
            using (var db = new ModelDbContext())
            {
                return db.tblUsers.Where(p => p.Status == status).OrderByDescending(p => p.Id).Skip(pageNumber * pageSize).Take(pageNumber).ToList();
            }
        }

        public IPagedList<tblUser> GetByPageList(int pageNumber, int pageSize)
        {
            using (var db = new ModelDbContext())
            {
                return db.tblUsers.Where(p => p.Status != (short)Commons.Status.Deleted).OrderByDescending(p => p.Id).ToPagedList(pageNumber, pageSize);
            }
        }

        public IPagedList<tblUser> GetByStatusPageList(short status, int pageNumber, int pageSize)
        {
            using (var db = new ModelDbContext())
            {
                return db.tblUsers.Where(p => p.Status == status).OrderByDescending(p => p.Id).ToPagedList(pageNumber, pageSize);
            }
        }

        public bool IsUserName(string userName)
        {
            using (ModelDbContext db = new ModelDbContext())
            {
                return db.tblUsers.Any(p => p.UserName.Equals(userName) || p.UserName.ToUpper().Equals(userName.ToUpper()));
            }
        }
        
    }
}