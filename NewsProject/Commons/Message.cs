using PagedList;
using System.Collections.Generic;

namespace NewsProject.Commons
{
    public class Messages<T>
    {
        public bool Status { get; set; }
        public string Message { get; set; }
        public T Data { get; set; }
        public ICollection<T> List { get; set; }
        public IPagedList<T> PagedList { get; set; }
    }
}