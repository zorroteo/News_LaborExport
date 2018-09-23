using NewsProject.Entitys;
using System.Linq;

namespace NewsProject.Access
{
    internal class AAccount
    {
        public bool LoginByUserName(string userName, string password)
        {
            using (var db = new ModelDbContext())
            {
                var encode = Commons.Encode.MD5(password);
                return db.tblUsers.Any(p => p.UserName.ToUpper().Equals(userName.ToUpper()) &&
                                            p.Password.ToUpper().Equals(encode.ToUpper()));
            }
        }

        public bool LoginByEmail(string email, string password)
        {
            using (var db = new ModelDbContext())
            {
                var encode = Commons.Encode.MD5(password);
                return db.tblUsers.Any(p => p.Email.ToUpper().Equals(email.ToUpper()) &&
                                            p.Password.ToUpper().Equals(encode.ToUpper()));
            }
        }

        /// <summary>
        /// Get Decentralize BY Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public short GetDecentralize(int id)
        {
            using (var db = new ModelDbContext())
            {
                if (db.tblUsers.Any(p => p.Id == id))
                {
                    // ReSharper disable once PossibleNullReferenceException
                    return db.tblUsers.Find(id).Decentralize;
                }
                return -1;
            }
        }

        /// <summary>
        /// Get Decentralize By Account
        /// </summary>
        /// <param name="account">User name or email</param>
        /// <returns></returns>
        public short GetDecentralize(string account)
        {
            using (var db = new ModelDbContext())
            {
                var acc = account.ToLower();
                if (db.tblUsers.Any(p => p.UserName.ToLower().Equals(acc)))
                {
                    return db.tblUsers.First(p => p.UserName.ToLower().Equals(acc)).Decentralize;
                }
                if (db.tblUsers.Any(p => p.Email.ToLower().Equals(acc)))
                {
                    return db.tblUsers.First(p => p.Email.ToLower().Equals(acc)).Decentralize;
                }

                return -1;
            }
        }
    }
}