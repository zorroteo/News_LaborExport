using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NewsProject.Entitys;
using NewsProject.Interface;
using NewsProject.Access;
using NewsProject.Commons;
using PagedList;

namespace NewsProject.Bussiness
{
    public class BUser : IUser
    {
        public Messages<tblUser> GetById(short permissions, int id)
        {
            var response = new Messages<tblUser>() { Status = false, Message = string.Empty, Data = new tblUser() };
            try
            {
                if (ADecentralize.Read(permissions))
                {
                    response.Data = new AUser().GetById(id);
                    response.Status = true;
                    response.Message = response.Status ? "Get by Id successfully." : "Get by Id failed.";
                    return response;
                }
                response.Message = "Limit permissions!";
                return response;
            }
            catch (Exception ex)
            {
                FileHelper.WriteLine(Settings.Path, ex);
                response.Message = "Execution error!";
                return response;
            }
        }

        public Messages<tblUser> GetByUserName(short permissions, string userName)
        {
            var response = new Messages<tblUser>() { Status = false, Message = string.Empty, Data = new tblUser() };
            try
            {
                if (ADecentralize.Read(permissions))
                {
                    response.Data = new AUser().GetByUserName(userName);
                    response.Status = true;
                    response.Message = response.Status ? "Get by user name successfully." : "Get by user name failed.";
                    return response;
                }
                response.Message = "Limit permissions!";
                return response;
            }
            catch (Exception ex)
            {
                FileHelper.WriteLine(Settings.Path, ex);
                response.Message = "Execution error!";
                return response;
            }
        }

        public Messages<tblUser> GetByEmail(short permissions, string email)
        {
            var response = new Messages<tblUser>() { Status = false, Message = string.Empty, Data = new tblUser() };
            try
            {
                if (ADecentralize.Read(permissions))
                {
                    response.Data = new AUser().GetByEmail(email);
                    response.Status = true;
                    response.Message = response.Status ? "Get by user name successfully." : "Get by user name failed.";
                    return response;
                }
                response.Message = "Limit permissions!";
                return response;
            }
            catch (Exception ex)
            {
                FileHelper.WriteLine(Settings.Path, ex);
                response.Message = "Execution error!";
                return response;
            }
        }
        public Messages<tblUser> InsertAndUpdate(short permissions, tblUser user)
        {
            var response = new Messages<tblUser>() { Status = false, Message = string.Empty };
            try
            {
                if (ADecentralize.Read(permissions))
                {
                    response.Status = new AUser().InsertAndUpdate(user);
                    if (new AUser().GetById(user.Id) != null)
                        response.Message = response.Status ? "Update successfully." : "Update failed.";
                    else
                        response.Message = response.Status ? "Insert successfully." : "Insert failed.";
                    return response;
                }
                response.Message = "Limit permissions!";
                return response;
            }
            catch (Exception ex)
            {
                FileHelper.WriteLine(Settings.Path, ex);
                response.Message = "Execution error!";
                return response;
            }
        }

        public Messages<tblUser> DeleteById(short permissions, int id)
        {
            var response = new Messages<tblUser>() { Status = false, Message = string.Empty };
            try
            {
                if (ADecentralize.Read(permissions))
                {
                    response.Status = new AUser().DeleteById(id);
                    response.Message = response.Status ? "Delete by Id successfully." : "Delete by Id failed.";
                    return response;
                }
                response.Message = "Limit permissions!";
                return response;
            }
            catch (Exception ex)
            {
                FileHelper.WriteLine(Settings.Path, ex);
                response.Message = "Execution error!";
                return response;
            }
        }

        public Messages<tblUser> UpdateStatus(short permissions, int id, short status)
        {
            var response = new Messages<tblUser>() { Status = false, Message = string.Empty };
            try
            {
                if (ADecentralize.Read(permissions))
                {
                    response.Status = new AUser().UpdateStatus(id, status);
                    response.Message = response.Status ? "Update status successfully." : "Update status failed.";
                    return response;
                }
                response.Message = "Limit permissions!";
                return response;
            }
            catch (Exception ex)
            {
                FileHelper.WriteLine(Settings.Path, ex);
                response.Message = "Execution error!";
                return response;
            }
        }

        public Messages<tblUser> UpdatePassword(short permissions, int id, string password)
        {
            var response = new Messages<tblUser>() { Status = false, Message = string.Empty };
            try
            {
                if (ADecentralize.Read(permissions))
                {
                    response.Status = new AUser().UpdatePassword(id, password);
                    response.Message = response.Status ? "Update password successfully." : "Update password failed.";
                    return response;
                }
                response.Message = "Limit permissions!";
                return response;
            }
            catch (Exception ex)
            {
                FileHelper.WriteLine(Settings.Path, ex);
                response.Message = "Execution error!";
                return response;
            }
        }

        public Messages<tblUser> GetByPaging(short permissions, int number, int pagingNumber)
        {
            var response = new Messages<tblUser>() { Status = false, Message = string.Empty,List = new List<tblUser>()};
            try
            {
                if (ADecentralize.Read(permissions))
                {
                    response.List = new AUser().GetByPaging(number, pagingNumber);
                    response.Status = true;
                    response.Message = response.Status ? "Get by paging successfully." : "Get by paging failed.";
                    return response;
                }
                response.Message = "Limit permissions!";
                return response;
            }
            catch (Exception ex)
            {
                FileHelper.WriteLine(Settings.Path, ex);
                response.Message = "Execution error!";
                return response;
            }
        }

        public Messages<tblUser> IsUserName(short permissions, string userName)
        {
            var response = new Messages<tblUser>() { Status = false, Message = string.Empty };
            try
            {
                if (ADecentralize.Read(permissions))
                {
                    response.Status = new AUser().IsUserName(userName);
                    response.Message = response.Status ? "Is user name successfully." : "Is user name failed.";
                    return response;
                }
                response.Message = "Limit permissions!";
                return response;
            }
            catch (Exception ex)
            {
                FileHelper.WriteLine(Settings.Path, ex);
                response.Message = "Execution error!";
                return response;
            }
        }
        public Messages<tblUser> GetByStatusPaging(short permissions, short status, int pageNumber, int pageSize)
        {
            var response = new Messages<tblUser>() { Status = false, Message = string.Empty};
            try
            {
                if (ADecentralize.Read(permissions))
                {
                    response.List = new AUser().GetByStatusPaging(status, pageNumber, pageSize);
                    response.Status = true;
                    response.Message = response.Status ? "Get by status paging successfully." : "Get by status paging failed.";
                    return response;
                }
                response.Message = "Limit permissions!";
                return response;
            }
            catch (Exception ex)
            {
                FileHelper.WriteLine(Settings.Path, ex);
                response.Message = "Execution error!";
                return response;
            }
        }

        public Messages<tblUser> GetByPageList(short permissions, int pageNumber, int pageSize)
        {
            var response = new Messages<tblUser>() { Status = false, Message = string.Empty };
            try
            {
                if (ADecentralize.Read(permissions))
                {
                    response.PagedList = new AUser().GetByPageList(pageNumber, pageSize);
                    response.Status = true;
                    response.Message = response.Status ? "Get by PageList successfully." : "Get by page list failed.";
                    return response;
                }
                response.Message = "Limit permissions!";
                return response;
            }
            catch (Exception ex)
            {
                FileHelper.WriteLine(Settings.Path, ex);
                response.Message = "Execution error!";
                return response;
            }
        }

        public Messages<tblUser> GetByStatusPageList(short permissions, short status, int pageNumber, int pageSize)
        {
            var response = new Messages<tblUser>() { Status = false, Message = string.Empty };
            try
            {
                if (ADecentralize.Read(permissions))
                {
                    response.PagedList = new AUser().GetByStatusPageList(status, pageNumber, pageSize);
                    response.Status = true;
                    response.Message = response.Status ? "Get by status PageList successfully." : "Get by status page list failed.";
                    return response;
                }
                response.Message = "Limit permissions!";
                return response;
            }
            catch (Exception ex)
            {
                FileHelper.WriteLine(Settings.Path, ex);
                response.Message = "Execution error!";
                return response;
            }
        }

    }
}
