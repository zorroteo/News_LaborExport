using NewsProject.Entitys;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace NewsProject.Access
{
    internal class AGroup
    {
        public tblGroup GetById(int id)
        {
            using (var db = new ModelDbContext())
            {
                return db.tblGroups.Find(id);
            }
        }

        public bool InsertAndUpdate(tblGroup group)
        {
            using (var db = new ModelDbContext())
            {
                var item = new tblGroup() { Id = group.Id };
                if (db.tblGroups.Any(p => p.Id == group.Id))
                {
                    db.tblGroups.Attach(item);
                    item.Title = group.Title;
                    item.Describe = group.Describe;
                    item.Icon = group.Icon;
                    item.ModifyDate = DateTime.Now;
                    item.ParentId = group.ParentId;
                }
                else db.tblGroups.Add(group);
                return db.SaveChanges() > 0;
            }
        }

        public bool DeleteById(short id)
        {
            using (var db = new ModelDbContext())
            {
                if (!db.tblGroups.Any(p => p.Id == id)) return false;
                var item = new tblGroup() { Id = id };
                db.tblGroups.Attach(item);
                db.tblGroups.Remove(item);
                return db.SaveChanges() > 0;
            }
        }

        public bool UpdateStatus(short id, short status)
        {
            using (var db = new ModelDbContext())
            {
                var item = new tblGroup() { Id = id };
                if (db.tblGroups.Any(p => p.Id == id))
                {
                    db.tblGroups.Attach(item);
                    item.Status = status;
                }
                else return false;
                return db.SaveChanges() > 0;
            }
        }
        public ICollection<tblGroup> GetAll()
        {
            using (var db = new ModelDbContext())
            {
                return db.tblGroups.Where(p => p.Status != (short)Commons.Status.Deleted).OrderByDescending(p => p.Id).ToList();
            }
        }
        public ICollection<tblGroup> GetByPaging(int pageNumber, int pageSize)
        {
            using (var db = new ModelDbContext())
            {
                return db.tblGroups.Where(p => p.Status != (short)Commons.Status.Deleted).OrderByDescending(p => p.Id).Skip(pageNumber * pageSize).Take(pageSize).ToList();
            }
        }

        public IPagedList<tblGroup> GetByPageList(int pageNumber, int pageSize)
        {
            using (var db = new ModelDbContext())
            {
                return db.tblGroups.Where(p => p.Status != (short)Commons.Status.Deleted).OrderByDescending(p => p.Id).ToPagedList(pageNumber, pageSize);
            }
        }

        public ICollection<tblGroup> GetByParent(short parent)
        {
            using (var db = new ModelDbContext())
            {
                return db.tblGroups.Where(p => p.Status != (short)Commons.Status.Deleted && p.ParentId == parent).OrderByDescending(p => p.Id).Include(p=>p.Childrens).ToList();
            }
        }
    }
}