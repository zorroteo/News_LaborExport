using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsProject.Interface
{
    public interface IAccount
    {
        bool LoginByUserName(string userName, string password);
        bool LoginByEmail(string email, string password);
        short GetDecentralize(int id);
        short GetDecentralize(string account);
    }
}
