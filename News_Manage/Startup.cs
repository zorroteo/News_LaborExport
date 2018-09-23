using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(News_Manage.Startup))]
namespace News_Manage
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
