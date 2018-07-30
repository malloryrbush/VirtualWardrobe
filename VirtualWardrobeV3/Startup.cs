using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(VirtualWardrobeV3.Startup))]
namespace VirtualWardrobeV3
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
