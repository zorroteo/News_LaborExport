using System.Web.Mvc;

namespace News_Manage.Controllers
{
    public class BaseController : Controller
    {
        protected bool IsLogin()
        {
            if ((Session[NewsProject.Commons.Session.Email.ToString()] != null || Session[NewsProject.Commons.Session.UserName.ToString()] != null)
                && Session[NewsProject.Commons.Session.Status.ToString()] != null && Session[NewsProject.Commons.Session.Decentralize.ToString()] != null)
            {
                return true;
            }
            return false;
        }

        protected short SessionDecentralize()
        {
            if (IsLogin())
            {
                return (short)Session[NewsProject.Commons.Session.Decentralize.ToString()];
            }
            return -1;
        }

        protected short SessionId()
        {
            if (IsLogin())
            {
                return (short)Session[NewsProject.Commons.Session.Id.ToString()];
            }
            return -1;
        }
    }
}