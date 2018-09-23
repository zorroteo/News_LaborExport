using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using NewsProject.Entitys;
namespace News_Manage.Common
{
    public class Messages
    {
        public string Message { get; set; }
        public bool Status { get; set; }
    }
    public class MessageNews : Messages
    {
        public tblNew New { get; set; }
        public ICollection<tblNew> News { get; set; }
    }
    public class MessageGroup : Messages
    {
        public tblGroup Group { get; set; }
        public ICollection<tblGroup> Groups { get; set; }
    }
    public class MessageComment : Messages
    {
        public tblComment Comment { get; set; }
        public ICollection<tblComment> Comments { get; set; }
    }
    public class MessageSupport : Messages
    {
        public tblSupport Support { get; set; }
        public ICollection<tblSupport> Supports { get; set; }
    }
    public class MessageUser : Messages
    {
        public tblUser User { get; set; }
        public ICollection<tblUser> Users { get; set; }
    }
}