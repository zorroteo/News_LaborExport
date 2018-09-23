using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NewsProject.Entitys;
using NewsProject.Interface;
using NewsProject.Access;
using PagedList;

namespace NewsProject.Bussiness
{
    public class BSupport : ISupport
    {
        public bool DeleteById(int id)
        {
            try
            {
                return new ASupport().DeleteById(id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public ICollection<tblSupport> GetAll()
        {
            try
            {
                return new ASupport().GetAll();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public tblSupport GetById(int id)
        {
            try
            {
                return new ASupport().GetById(id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IPagedList<tblSupport> GetByPageList(int pageNumber, int pageSize)
        {
            try
            {
                return new ASupport().GetByPageList(pageNumber, pageSize);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public ICollection<tblSupport> GetByPaging(int pageNumber, int pageSize)
        {
            try
            {
                return new ASupport().GetByPaging(pageNumber, pageSize);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IPagedList<tblSupport> GetByStatusPageList(short status, int pageNumber, int pageSize)
        {
            try
            {
                return new ASupport().GetByStatusPageList(status, pageNumber, pageSize);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public ICollection<tblSupport> GetByStatusPaging(short status, int pageNumber, int pageSize)
        {
            try
            {
                return new ASupport().GetByStatusPaging(status, pageNumber, pageSize);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool InsertAndUpdate(tblSupport support)
        {
            try
            {
                return new ASupport().InsertAndUpdate(support);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool UpdateStatus(int id, short status)
        {
            try
            {
                return new ASupport().UpdateStatus(id, status);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
