using NewsProject.Commons;
using NewsProject.Entitys;

namespace NewsProject.Interface
{
    public interface INews
    {
        Messages<tblNew> GetAll(short permissions);

        Messages<tblNew> GetAllPageList(short permissions, int pageNumber, int pageSize);

        Messages<tblNew> GetByStatusPageList(short permissions, short status, int pageNumber, int pageSize);

        Messages<tblNew> GetByGroupPageList(short permissions, short group, int pageNumber, int pageSize);

        Messages<tblNew> GetAllPaging(short permissions, int pageNumber, int pageSize);

        Messages<tblNew> GetByStatusPaging(short permissions, short status, int pageNumber, int pageSize);

        Messages<tblNew> GetByGroupPaging(short permissions, short group, int pageNumber, int pageSize);

        Messages<tblNew> GetById(short permissions, int id);

        Messages<tblNew> InsertAndUpdate(short permissions, tblNew news);

        Messages<tblNew> DeleteById(short permissions, int id);

        Messages<tblNew> UpdateStatus(short permissions, int id, short status);

        Messages<tblNew> UpdateView(short permissions, int id);
    }
}