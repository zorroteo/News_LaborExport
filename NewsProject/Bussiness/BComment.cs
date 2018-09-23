using NewsProject.Access;
using NewsProject.Entitys;
using NewsProject.Interface;
using PagedList;
using System;
using System.Collections.Generic;

namespace NewsProject.Bussiness
{
    internal class BComment : IComment
    {
        public tblComment GetById(int id)
        {
            try
            {
                return new AComment().GetById(id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool DeleteById(short id)
        {
            try
            {
                return new AComment().DeleteById(id);
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
                return new AComment().UpdateStatus(id, status);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public ICollection<tblComment> GetByNews(int id)
        {
            try
            {
                return new AComment().GetByNews(id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public ICollection<tblComment> GetByNewsPaging(int id, int number, int pagingNumber)
        {
            try
            {
                return new AComment().GetByNewsPaging(id, number, pagingNumber);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IPagedList<tblComment> GetByStatusPagedList(short status, int pageNumber, int pageSize)
        {
            try
            {
                return new AComment().GetByStatusPagedList(status, pageNumber, pageSize);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}