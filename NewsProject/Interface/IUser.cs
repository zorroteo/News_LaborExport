using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NewsProject.Commons;
using NewsProject.Entitys;
using PagedList;

namespace NewsProject.Interface
{
    public interface IUser
    {
        Messages<tblUser> GetById(short permissions, int id);
        Messages<tblUser> GetByUserName(short permissions, string userName);
        Messages<tblUser> GetByEmail(short permissions, string email);
        Messages<tblUser> InsertAndUpdate(short permissions, tblUser user);
        Messages<tblUser> DeleteById(short permissions, int id);
        Messages<tblUser> UpdateStatus(short permissions, int id, short status);
        Messages<tblUser> UpdatePassword(short permissions, int id, string password);
        Messages<tblUser> GetByPaging(short permissions, int number, int pagingNumber);
        Messages<tblUser> GetByStatusPaging(short permissions, short status, int pageNumber, int pageSize);
        Messages<tblUser> GetByPageList(short permissions, int pageNumber, int pageSize);
        Messages<tblUser> GetByStatusPageList(short permissions, short status, int pageNumber, int pageSize);
        Messages<tblUser> IsUserName(short permissions, string userName);
    }
}
