using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NewsProject.Entitys;
using PagedList;

namespace NewsProject.Interface
{
    public interface ISupport
    {
        ICollection<tblSupport> GetAll();
        tblSupport GetById(int id);
        bool InsertAndUpdate(tblSupport support);
        bool DeleteById(int id);
        bool UpdateStatus(int id, short status);
        ICollection<tblSupport> GetByPaging(int pageNumber, int pageSize);
        IPagedList<tblSupport> GetByPageList(int pageNumber, int pageSize);
        ICollection<tblSupport> GetByStatusPaging(short status, int pageNumber, int pageSize);
        IPagedList<tblSupport> GetByStatusPageList(short status, int pageNumber, int pageSize);
    }
}
