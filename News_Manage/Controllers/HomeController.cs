using News_Manage.Common;
using News_Manage.Models;
using System;
using System.Linq;
using System.Web.Mvc;

namespace News_Manage.Controllers
{
    public class HomeController : BaseController
    {
        [ActionName("Index")]
        public ActionResult HomeNews()
        {
            var tempNews = new TempNews()
            {
                CanadaNews = NewsProject.ExecuteNews.News.GetByGroupPaging(SessionDecentralize(), (short)Country.Canada, 1, 5).List,
                JapanNews = NewsProject.ExecuteNews.News.GetByGroupPaging(SessionDecentralize(), (short)Country.Japan, 1, 5).List,
                GermanyNews = NewsProject.ExecuteNews.News.GetByGroupPaging(SessionDecentralize(), (short)Country.Germany, 1, 5).List,
                KoreaNews = NewsProject.ExecuteNews.News.GetByGroupPaging(SessionDecentralize(), (short)Country.Korea, 1, 5).List,
                TaiwanNews = NewsProject.ExecuteNews.News.GetByGroupPaging(SessionDecentralize(), (short)Country.Taiwan, 1, 5).List,
                JobNews = NewsProject.ExecuteNews.News.GetByGroupPaging(SessionDecentralize(), (short)Country.Job, 1, 10).List,
                OrderNews = NewsProject.ExecuteNews.News.GetAll(SessionDecentralize()).List.OrderByDescending(p => p.Order).Take(10).ToList(),
                NewNews = NewsProject.ExecuteNews.News.GetAllPaging(SessionDecentralize(), 1, 10).List,
                ViewsNews = NewsProject.ExecuteNews.News.GetAll(SessionDecentralize()).List.OrderByDescending(p => p.View).Take(10).ToList()
            };
            return View("HomeNews", tempNews);
        }

        [ActionName("Group")]
        [HttpGet]
        public ActionResult GroupNews(string group, int? page)
        {
            var pageNumber = page ?? 1;
            Common.Country groupName;
            ViewBag.Group = group;
            if (Enum.TryParse(group, out groupName))
            {
                var listItem = NewsProject.ExecuteNews.News.GetByGroupPageList(SessionDecentralize(), (short)groupName, pageNumber, (int)PageNumber.Normal);
                return View("GroupNews", listItem.PagedList);
            }
            return View("GroupNews", NewsProject.ExecuteNews.News.GetByGroupPageList(SessionDecentralize(), (short)Common.Country.New, pageNumber, (int)PageNumber.Normal).PagedList);
        }

        [ActionName("Detail")]
        public ActionResult DetailNews(int? id)
        {
            var idNews = id ?? 1;
            var news = NewsProject.ExecuteNews.News.GetById(SessionDecentralize(), idNews).Data;
            ViewBag.Group = news.tblGroup.Title;
            return View("DetailNews", news);
        }

        [HttpGet]
        public ActionResult Search(string search)
        {
            return null;
        }
    }
}