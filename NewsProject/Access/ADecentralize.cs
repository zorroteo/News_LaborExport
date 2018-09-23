namespace NewsProject.Access
{
    internal static class ADecentralize
    {
        public static bool Create(short permissions)
        {
            return permissions == (short)Commons.Decentralize.Admin ||
                   permissions == (short)Commons.Decentralize.Employees;
        }

        public static bool Edit(short permissions)
        {
            return permissions == (short)Commons.Decentralize.Admin ||
                   permissions == (short)Commons.Decentralize.Employees;
        }

        public static bool Delete(short permissions)
        {
            return permissions == (short)Commons.Decentralize.Admin ||
                   permissions == (short)Commons.Decentralize.Employees;
        }

        public static bool Approve(short permissions)
        {
            return permissions == (short)Commons.Decentralize.Admin ||
                   permissions == (short)Commons.Decentralize.Employees;
        }

        public static bool Read(short permissions)
        {
            return permissions == (short)Commons.Decentralize.Client || permissions == (short)Commons.Decentralize.Admin ||
                   permissions == (short)Commons.Decentralize.Employees || permissions == (short)Commons.Decentralize.Limit;
        }
    }
}