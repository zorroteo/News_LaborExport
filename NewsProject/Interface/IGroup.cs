using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NewsProject.Entitys;
using PagedList;

namespace NewsProject.Interface
{
    public interface IGroup
    {
        tblGroup GetById(int id);
        bool InsertAndUpdate(tblGroup group);
        bool DeleteById(short id);
        bool UpdateStatus(short id, short status);
        ICollection<tblGroup> GetByPaging(int pageNumber, int pageSize);
        IPagedList<tblGroup> GetByPageList(int pageNumber, int pageSize);
        ICollection<tblGroup> GetAll();
        ICollection<tblGroup> GetByParent(short parent);
    }
}
