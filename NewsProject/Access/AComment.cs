using NewsProject.Entitys;
using PagedList;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace NewsProject.Access
{
    internal class AComment
    {
        public tblComment GetById(int id)
        {
            using (var db = new ModelDbContext())
            {
                return db.tblComments.Find(id);
            }
        }

        public bool DeleteById(short id)
        {
            using (var db = new ModelDbContext())
            {
                if (!db.tblComments.Any(p => p.Id == id)) return false;
                var item = new tblComment() { Id = id };
                db.tblComments.Attach(item);
                db.tblComments.Remove(item);
                return db.SaveChanges() > 0;
            }
        }

        public bool UpdateStatus(short id, short status)
        {
            using (var db = new ModelDbContext())
            {
                var item = new tblComment() { Id = id };
                if (db.tblComments.Any(p => p.Id == id))
                {
                    db.tblComments.Attach(item);
                    item.Status = status;
                }
                else return false;
                return db.SaveChanges() > 0;
            }
        }

        public ICollection<tblComment> GetByNews(int id)
        {
            using (var db = new ModelDbContext())
            {
                return db.tblComments.Where(p => p.News == id && p.Status != (short)Commons.Status.Deleted).OrderByDescending(p => p.Id).ToList();
            }
        }

        public ICollection<tblComment> GetByNewsPaging(int id, int pageNumber, int pageSize)
        {
            using (var db = new ModelDbContext())
            {
                return db.tblComments.Where(p => p.News == id && p.Status!=(short)Commons.Status.Deleted).OrderByDescending(p => p.Id).Skip(pageNumber * pageSize).Take(pageSize).ToList();
            }
        }

        public ICollection<tblComment> GetByStatusPaging(short status, int pageNumber, int pageSize)
        {
            using (var db = new ModelDbContext())
            {
                return db.tblComments.Where(p => p.Status == status).OrderByDescending(p => p.Id).Skip(pageNumber * pageSize).Take(pageSize).ToList();
            }
        }
        public IPagedList<tblComment> GetByStatusPagedList(short status, int pageNumber, int pageSize)
        {
            using (var db = new ModelDbContext())
            {
                return db.tblComments.Where(p => p.Status == status).OrderByDescending(p => p.Id).ToPagedList(pageNumber, pageSize);
            }
        }
    }
}