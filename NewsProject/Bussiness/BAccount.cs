using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NewsProject.Access;
using NewsProject.Interface;

namespace NewsProject.Bussiness
{
    class BAccount:IAccount
    {
        public bool LoginByUserName(string userName, string password)
        {
            try
            {
                return new AAccount().LoginByUserName(userName, password);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool LoginByEmail(string email, string password)
        {
            try
            {
                return new AAccount().LoginByEmail(email, password);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public short GetDecentralize(int id)
        {
            try
            {
                return new AAccount().GetDecentralize(id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public short GetDecentralize(string account)
        {
            try
            {
                return new AAccount().GetDecentralize(account);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
