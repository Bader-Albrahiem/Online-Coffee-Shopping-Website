using OnlineCoffeeShopping.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PayPal.Api;
namespace OnlineCoffeeShopping.Users
{
    public partial class CheckoutStart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(ShoppingCart.Instance.Items.Count == 0)
            {
                Response.Redirect("~/Users/Products.aspx");
            }
            NVPAPICaller payPalCaller = new NVPAPICaller();
            string retMsg = "";
            string token = "";

            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                if (Session["payment_amt"] != null)
                {
                    string amt = Session["payment_amt"].ToString();

                    bool ret = payPalCaller.ShortcutExpressCheckout(amt, ref token, ref retMsg);
                    if (ret)
                    {
                        Session["token"] = token;
                        Response.Redirect(retMsg);
                    }
                    else
                    {
                        Response.Redirect("~/PageUnderMaintaince.aspx");
                    }

                }
                else
                {
                    Response.Redirect("~/PageUnderMaintaince.aspx");
                }
                var config = ConfigManager.Instance.GetProperties();
                var accessToken = new OAuthTokenCredential(config).GetAccessToken();
                //Get APIContext Object
                var apiContext = new APIContext(accessToken);
            }
            else
            {
                Response.Redirect("~/Users/Checkout/Checkout.aspx");
            }

        }




    }
    }
