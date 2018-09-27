using System.Web;
using System.Web.Mvc;

namespace KC_MGMT_ASPClient
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
