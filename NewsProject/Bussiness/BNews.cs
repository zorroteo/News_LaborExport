using NewsProject.Access;
using NewsProject.Commons;
using NewsProject.Entitys;
using NewsProject.Interface;
using System;

namespace NewsProject.Bussiness
{
    internal class BNews : INews
    {
        public Messages<tblNew> DeleteById(short permissions, int id)
        {
            var response = new Commons.Messages<tblNew>() { Status = false, Message = string.Empty };
            try
            {
                if (ADecentralize.Delete(permissions))
                {
                    response.Status = new ANews().DeleteById(id);
                    response.Message = response.Status ? "Delete successfully." : "Delete failed.";
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

        public Messages<tblNew> GetAll(short permissions)
        {
            var response = new Commons.Messages<tblNew>() { Status = false, Message = string.Empty };
            try
            {
                if (ADecentralize.Read(permissions))
                {
                    response.List = new ANews().GetAll();
                    response.Status = true;
                    response.Message = response.Status ? "Get all successfully." : "Get all failed.";
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

        public Messages<tblNew> GetAllPaging(short permissions, int pageNumber, int pageSize)
        {
            var response = new Commons.Messages<tblNew>() { Status = false, Message = string.Empty };
            try
            {
                if (ADecentralize.Read(permissions))
                {
                    response.List = new ANews().GetAllPaging(pageNumber, pageSize);
                    response.Status = true;
                    response.Message = response.Status ? "Get all paging successfully." : "Get all paging failed.";
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

        public Messages<tblNew> GetAllPageList(short permissions, int pageNumber, int pageSize)
        {
            var response = new Commons.Messages<tblNew>() { Status = false, Message = string.Empty };
            try
            {
                if (ADecentralize.Read(permissions))
                {
                    response.PagedList = new ANews().GetAllPageList(pageNumber, pageSize);
                    response.Status = true;
                    response.Message = response.Status ? "Get all page list successfully." : "Get all page list failed.";
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

        public Messages<tblNew> GetByGroupPaging(short permissions, short group, int pageNumber, int pageSize)
        {
            var response = new Commons.Messages<tblNew>() { Status = false, Message = string.Empty };
            try
            {
                if (ADecentralize.Read(permissions))
                {
                    response.List = new ANews().GetByGroupPaging(group, pageNumber, pageSize);
                    response.Status = true;
                    response.Message = response.Status ? "Get by group paging successfully." : "Get by group paging failed.";
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

        public Messages<tblNew> GetByGroupPageList(short permissions, short group, int pageNumber, int pageSize)
        {
            var response = new Commons.Messages<tblNew>() { Status = false, Message = string.Empty };
            try
            {
                if (ADecentralize.Read(permissions))
                {
                    response.PagedList = new ANews().GetByGroupPageList(group, pageNumber, pageSize);
                    response.Status = true;
                    response.Message = response.Status ? "Get by group page list successfully." : "Get by group page list failed.";
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

        public Messages<tblNew> GetById(short permissions, int id)
        {
            var response = new Commons.Messages<tblNew>() { Status = false, Message = string.Empty };
            try
            {
                if (ADecentralize.Delete(permissions))
                {
                    response.Data = new ANews().GetById(id);
                    response.Status = true;
                    response.Message = response.Status ? "Get by id successfully." : "Get by id failed.";
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

        public Messages<tblNew> GetByStatusPaging(short permissions, short status, int pageNumber, int pageSize)
        {
            var response = new Commons.Messages<tblNew>() { Status = false, Message = string.Empty };
            try
            {
                if (ADecentralize.Delete(permissions))
                {
                    response.List = new ANews().GetByStatusPaging(status, pageNumber, pageSize);
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

        public Messages<tblNew> GetByStatusPageList(short permissions, short status, int pageNumber, int pageSize)
        {
            var response = new Commons.Messages<tblNew>() { Status = false, Message = string.Empty };
            try
            {
                if (ADecentralize.Read(permissions))
                {
                    response.PagedList = new ANews().GetByStatusPageList(status, pageNumber, pageSize);
                    response.Status = true;
                    response.Message = response.Status ? "Get by status page list successfully." : "Get by status page list failed.";
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

        public Messages<tblNew> InsertAndUpdate(short permissions, tblNew news)
        {
            var response = new Commons.Messages<tblNew>() { Status = false, Message = string.Empty };
            try
            {
                if (ADecentralize.Create(permissions))
                {
                    response.Status = new ANews().InsertAndUpdate(news);
                    if (new ANews().GetById(news.Id) != null)
                    {
                        response.Message = response.Status ? "Update successfully." : "Update failed.";
                    }
                    else
                    {
                        response.Message = response.Status ? "Insert successfully." : "Insert failed.";
                    }
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

        public Messages<tblNew> UpdateStatus(short permissions, int id, short status)
        {
            var response = new Commons.Messages<tblNew>() { Status = false, Message = string.Empty };
            try
            {
                if (ADecentralize.Delete(permissions))
                {
                    response.Status = new ANews().DeleteById(id);
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

        public Messages<tblNew> UpdateView(short permissions, int id)
        {
            var response = new Commons.Messages<tblNew>() { Status = false, Message = string.Empty };
            try
            {
                if (ADecentralize.Delete(permissions))
                {
                    response.Status = new ANews().UpdateView(id);
                    response.Message = response.Status ? "Update view successfully." : "Update view failed.";
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