using OnlineCoffeeShopping.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Reflection.Emit;


namespace OnlineCoffeeShopping
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CartItems.Text = ShoppingCart.Instance.Items.Count.ToString();
            userMenu.Visible = false;
            if (this.Page.User.Identity.IsAuthenticated)
            {
                btnLogin.Text = "Logout";
                btnReg.Visible = false;
                BtnAcc.Visible = true;
                BtnAcc.Text = "Welcome:" + (HttpContext.Current.User.Identity.Name);



                if (HttpContext.Current.User.IsInRole("admin") == true)
                {
                    AdDash.Visible = true;
                    BtnAcc.NavigateUrl = null;
                }
                else if(HttpContext.Current.User.IsInRole("Company") == true)
                {
                    BtnAcc.NavigateUrl = "~/Users/Company/CompanyProfile.aspx";
                }
                else if(HttpContext.Current.User.IsInRole("User") == true)
                {
                    BtnAcc.Visible=false;
                    userMenu.Visible=true;
                    
                }  
               
            }
            else
            {
                btnLogin.Text = "Login";
                btnReg.Visible = true;
                BtnAcc.Visible = false;
                userMenu.Visible = false;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Session["Id"] = null;
                FormsAuthentication.SignOut();
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void SeacrhBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Users/Products.aspx?name="+TxtSearchBox.Text+"");
        }
    }
}