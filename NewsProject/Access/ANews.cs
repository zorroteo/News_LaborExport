using NewsProject.Entitys;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using PagedList;

namespace NewsProject.Access
{
    internal class ANews
    {
        public ICollection<tblNew> GetAll()
        {
            using (var db = new ModelDbContext())
            {
                return db.tblNews.Where(p => p.Status != (short)Commons.Status.Deleted).Include(t => t.tblGroup).Include(t => t.tblComments).OrderByDescending(p => p.Id).ToList();
            }
        }
        public IPagedList<tblNew> GetAllPageList(int pageNumber, int pageSize)
        {
            using (var db = new ModelDbContext())
            {
                return db.tblNews.Where(p => p.Status != (short)Commons.Status.Deleted).Include(t => t.tblGroup).Include(t => t.tblComments).OrderByDescending(p => p.Id).ToPagedList(pageNumber, pageSize);
            }
        }
        public IPagedList<tblNew> GetByStatusPageList(short status, int pageNumber, int pageSize)
        {
            using (var db = new ModelDbContext())
            {
                return db.tblNews.Where(p => p.Status == status).Include(t => t.tblGroup).Include(t => t.tblComments).OrderByDescending(p => p.Id).ToPagedList(pageNumber, pageSize);
            }
        }
        public IPagedList<tblNew> GetByGroupPageList(short id, int pageNumber, int pageSize)
        {
            using (var db = new ModelDbContext())
            {
                return db.tblNews.Where(p => p.Group == id && p.Status != (short)Commons.Status.Deleted).Include(t => t.tblGroup).Include(t => t.tblComments).OrderByDescending(p => p.Id).ToPagedList(pageNumber, pageSize);
            }
        }

        public ICollection<tblNew> GetAllPaging(int pageNumber, int pageSize)
        {
            using (var db = new ModelDbContext())
            {
                return db.tblNews.Where(p => p.Status != (short)Commons.Status.Deleted).Include(t => t.tblGroup).Include(t => t.tblComments).OrderByDescending(p => p.Id).Skip((pageNumber - 1) * pageSize).Take(pageSize).ToList();
            }
        }
        public ICollection<tblNew> GetByStatusPaging(short status, int pageNumber, int pageSize)
        {
            using (var db = new ModelDbContext())
            {
                return db.tblNews.Where(p => p.Status == status).Include(t => t.tblGroup).Include(t => t.tblComments).OrderByDescending(p => p.Id).Skip((pageNumber - 1) * pageSize).Take(pageSize).ToList();
            }
        }
        public ICollection<tblNew> GetByGroupPaging(short id, int pageNumber, int pageSize)
        {
            using (var db = new ModelDbContext())
            {
                return db.tblNews.Where(p => p.Group == id && p.Status != (short)Commons.Status.Deleted).Include(t => t.tblGroup).Include(t => t.tblComments).OrderByDescending(p => p.Id).Skip((pageNumber - 1) * pageSize).Take(pageSize).ToList();
            }
        }

        public tblNew GetById(int id)
        {
            using (var db = new ModelDbContext())
            {
                return db.tblNews.Where(p => p.Id == id).Include(p => p.tblGroup).OrderByDescending(p => p.CreateDate).Include(p => p.tblComments).FirstOrDefault();
            }
        }

        public bool InsertAndUpdate(tblNew news)
        {
            using (var db = new ModelDbContext())
            {
                var item = new tblNew() { Id = news.Id };
                if (db.tblNews.Any(p => p.Id == news.Id))
                {
                    db.tblNews.Attach(item);
                    item.Content = news.Content;
                    item.ModifyDate = DateTime.Now;
                    item.Describe = news.Describe;
                    item.Group = news.Group;
                    item.Img = news.Img;
                    item.ImgResizer = news.ImgResizer;
                    item.Position = news.Position;
                    item.Titles = news.Titles;
                }
                else db.tblNews.Add(news);
                return db.SaveChanges() > 0;
            }
        }

        public bool DeleteById(int id)
        {
            using (var db = new ModelDbContext())
            {
                if (!db.tblNews.Any(p => p.Id == id)) return false;
                var item = new tblNew() { Id = id };
                db.tblNews.Attach(item);
                db.tblNews.Remove(item);
                return db.SaveChanges() > 0;
            }
        }

        public bool UpdateStatus(int id, short status)
        {
            using (var db = new ModelDbContext())
            {
                var item = new tblNew() { Id = id };
                if (db.tblNews.Any(p => p.Id == id))
                {
                    db.tblNews.Attach(item);
                    item.Status = status;
                }
                else return false;
                return db.SaveChanges() > 0;
            }
        }

        public bool UpdateView(int id)
        {
            using (var db = new ModelDbContext())
            {
                var item = new tblNew() { Id = id };
                if (db.tblNews.Any(p => p.Id == id))
                {
                    db.tblNews.Attach(item);
                    item.View++;
                }
                else return false;
                return db.SaveChanges() > 0;
            }
        }
    }
}