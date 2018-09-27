using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(KC_MGMT_ASPClient.Startup))]
namespace KC_MGMT_ASPClient
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
