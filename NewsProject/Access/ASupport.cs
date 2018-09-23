using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using NewsProject.Entitys;
using PagedList;
namespace NewsProject.Access
{
    internal class ASupport
    {
        public ICollection<tblSupport> GetAll()
        {
            using (var db = new ModelDbContext())
            {
                return db.tblSupports.OrderByDescending(p => p.CreateDate).ToList();
            }
        }

        public tblSupport GetById(int id)
        {
            using (var db = new ModelDbContext())
            {
                return db.tblSupports.Find(id);
            }
        }

        public bool InsertAndUpdate(tblSupport support)
        {
            using (var db = new ModelDbContext())
            {
                db.tblSupports.Add(support);
                return db.SaveChanges() > 0;
            }
        }

        public bool DeleteById(int id)
        {
            using (var db = new ModelDbContext())
            {
                if (!db.tblSupports.Any(p => p.Id == id)) return false;
                var item = new tblSupport() { Id = id };
                db.tblSupports.Attach(item);
                db.tblSupports.Remove(item);
                return db.SaveChanges() > 0;
            }
        }

        public bool UpdateStatus(int id, short status)
        {
            using (var db = new ModelDbContext())
            {
                var item = new tblSupport() { Id = id };
                if (db.tblSupports.Any(p => p.Id == id))
                {
                    db.tblSupports.Attach(item);
                    item.Status = status;
                }
                else return false;
                return db.SaveChanges() > 0;
            }
        }
        public ICollection<tblSupport> GetByPaging(int pageNumber, int pageSize)
        {
            using (var db = new ModelDbContext())
            {
                return db.tblSupports.Where(p => p.Status != (short)Commons.Status.Deleted).OrderByDescending(p => p.Id).Skip(pageNumber * pageSize).Take(pageSize).ToList();
            }
        }
        public IPagedList<tblSupport> GetByPageList(int pageNumber, int pageSize)
        {
            using (var db = new ModelDbContext())
            {
                return db.tblSupports.Where(p => p.Status != (short)Commons.Status.Deleted).OrderByDescending(p => p.Id).ToPagedList(pageNumber, pageSize);
            }
        }
        public ICollection<tblSupport> GetByStatusPaging(short status, int pageNumber, int pageSize)
        {
            using (var db = new ModelDbContext())
            {
                return db.tblSupports.Where(p => p.Status == status).OrderByDescending(p => p.Id).Skip(pageNumber * pageSize).Take(pageSize).ToList();
            }
        }
        public IPagedList<tblSupport> GetByStatusPageList(short status, int pageNumber, int pageSize)
        {
            using (var db = new ModelDbContext())
            {
                return db.tblSupports.Where(p => p.Status == status).OrderByDescending(p => p.Id).ToPagedList(pageNumber, pageSize);
            }
        }
    }
}
