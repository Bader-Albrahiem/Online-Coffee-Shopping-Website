using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace OnlineCoffeeShopping
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }
        protected void Application_EndRequest(object sender, EventArgs e)
        {
            
            if (Response.StatusCode == 401)
            {

                HttpContext.Current.Response.Clear();
                HttpContext.Current.Response.Redirect("~/Page403.aspx");
            }
            else if(Response.StatusCode == 404)
            {
                HttpContext.Current.Response.Clear();
                HttpContext.Current.Response.Redirect("~/Page.aspx");
            }
        }
        protected void Application_BeginRequest(object sender, EventArgs e)
        {

         
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

            if (HttpContext.Current.User != null)
            {
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    if (HttpContext.Current.User.Identity is FormsIdentity)
                    {
                        FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
                        FormsAuthenticationTicket ticket = id.Ticket;
                        string userData = ticket.UserData;
                        string[] roles = userData.Split(',');
                        HttpContext.Current.User = new GenericPrincipal(id, roles);
                    }
                }
            }
           
        }
    

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}