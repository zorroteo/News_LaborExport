using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NewsProject.Entitys;
using PagedList;

namespace NewsProject.Interface
{
    public interface IComment
    {
        tblComment GetById(int id);
        bool DeleteById(short id);
        bool UpdateStatus(short id, short status);
        ICollection<tblComment> GetByNews(int id);
        ICollection<tblComment> GetByNewsPaging(int id, int pageNumber, int pageSize);
        IPagedList<tblComment> GetByStatusPagedList(short status, int pageNumber, int pageSize);
    }
}
