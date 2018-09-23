using NewsProject.Access;
using NewsProject.Entitys;
using NewsProject.Interface;
using PagedList;
using System;
using System.Collections.Generic;

namespace NewsProject.Bussiness
{
    internal class BGroup : IGroup
    {
        public bool DeleteById(short id)
        {
            try
            {
                return new AGroup().DeleteById(id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public ICollection<tblGroup> GetAll()
        {
            try
            {
                return new AGroup().GetAll();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public ICollection<tblGroup> GetByParent(short parent)
        {
            try
            {
                return new AGroup().GetByParent(parent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public tblGroup GetById(int id)
        {
            try
            {
                return new AGroup().GetById(id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public ICollection<tblGroup> GetByPaging(int pageNumber, int pageSize)
        {
            try
            {
                return new AGroup().GetByPaging(pageNumber, pageSize);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IPagedList<tblGroup> GetByPageList(int pageNumber, int pageSize)
        {
            try
            {
                return new AGroup().GetByPageList(pageNumber, pageSize);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool InsertAndUpdate(tblGroup group)
        {
            try
            {
                return new AGroup().InsertAndUpdate(group);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool UpdateStatus(short id, short status)
        {
            try
            {
                return new AGroup().UpdateStatus(id, status);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}