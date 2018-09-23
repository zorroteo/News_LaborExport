using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace News_Manage.Models
{
    public class AccountManage
    {
        public string UserName { get; set; }
        public string PassWord { get; set; }
    }
    public class AccountManageConfirn : AccountManage
    {
        public string PassWordConfirn { get; set; }
    }
}