using NewsProject.Bussiness;
using NewsProject.Interface;

namespace NewsProject
{
    public static class ExecuteNews
    {
        public static INews News => new BNews();
        public static IGroup Group => new BGroup();
        public static IComment Comment => new BComment();
        public static ISupport Support => new BSupport();
        public static IUser User => new BUser();
        public static IAccount Account => new BAccount();
    }
}