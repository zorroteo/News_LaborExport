using System.Web.Optimization;

namespace News_Manage
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css"));

            bundles.Add(new ScriptBundle("~/bundles/ckfinder").Include(
                "~/Plugins/ckeditor/ckeditor.js",
                "~/Plugins/ckfinder/ckfinder.js",
                "~/Scripts/jquery.cookies.js"));

            bundles.Add(new StyleBundle("~/Content/bundlesnews").Include(
                "~/Content/bootstrap.min.css",
                "~/Content/news/font-awesome.min.css",
                "~/Content/news/magnific-popup.min.css",
                "~/Content/news/owl.carousel.min.css",
                "~/Content/news/main.min.css",
                "~/Content/news/presets/preset1.min.css",
                "~/Content/news/responsive.min.css"));

            bundles.Add(new ScriptBundle("~/bundles/news").Include(
                "~/Scripts/jquery-1.10.2.min.js",
                "~/Scripts/bootstrap.min.js",
                "~/Scripts/news/jquery.magnific-popup.min.js",
                "~/Scripts/news/owl.carousel.min.js",
                "~/Scripts/news/moment.min.js",
                "~/Scripts/news/jquery.simpleWeather.min.js",
                "~/Scripts/news/jquery.sticky-kit.min.js",
                "~/Scripts/news/jquery.easy-ticker.min.js",
                "~/Scripts/news/main.min.js",
                "~/Scripts/news/switcher.min.js"
                ));

            bundles.Add(new ScriptBundle("~/bundles/page").Include(
                "~/Scripts/dashboard/pace/pace.min.js"));

            bundles.Add(new StyleBundle("~/Content/page").Include(
                "~/Content/dashboard/pace/pace.min.css"));

            bundles.Add(new StyleBundle("~/Content/admin").Include(
                "~/Content/dashboard/bootstrap/css/bootstrap.min.css",
                "~/Content/dashboard/open-iconic/css/open-iconic-bootstrap.min.css",
                "~/Content/dashboard/flatpickr/flatpickr.min.css",
                "~/Content/dashboard/stylesheets/main.min.css",
                "~/Content/dashboard/stylesheets/custom.css"));

            bundles.Add(new ScriptBundle("~/bundles/admin").Include(
                "~/Scripts/dashboard/jquery/jquery.min.js",
                "~/Scripts/dashboard/bootstrap/js/popper.min.js",
                "~/Scripts/dashboard/bootstrap/js/bootstrap.min.js",
                "~/Scripts/dashboard/stacked-menu/stacked-menu.min.js",
                "~/Scripts/dashboard/perfect-scrollbar/perfect-scrollbar.min.js",
                "~/Scripts/dashboard/flatpickr/flatpickr.min.js",
                "~/Scripts/dashboard/jquery.easy-pie-chart/jquery.easypiechart.min.js",
                "~/Scripts/dashboard/chart.js/Chart.min.js",
                "~/Scripts/dashboard/main.min.js",
                "~/Scripts/dashboard/pages/easypiechart-demo.js",
                "~/Scripts/dashboard/pages/dashboard-demo.js"
            ));
        }
    }
}