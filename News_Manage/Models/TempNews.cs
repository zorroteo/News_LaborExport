using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using NewsProject.Entitys;
namespace News_Manage.Models
{
    public class TempNews
    {
        public ICollection<tblNew> NewNews { get; set; }
        public ICollection<tblNew> ViewsNews { get; set; }
        public ICollection<tblNew> JapanNews { get; set; }
        public ICollection<tblNew> GermanyNews { get; set; }
        public ICollection<tblNew> KoreaNews { get; set; }
        public ICollection<tblNew> TaiwanNews { get; set; }
        public ICollection<tblNew> CanadaNews { get; set; }
        public ICollection<tblNew> JobNews { get; set; }
        public ICollection<tblNew> OrderNews { get; set; }
        public ICollection<tblGroup> Groups { get; set; }
    }
}