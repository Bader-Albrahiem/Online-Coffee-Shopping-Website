using OnlineCoffeeShopping.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineCoffeeShopping
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            CartRpeater.DataSource = ShoppingCart.Instance.Items;
            CartRpeater.DataBind();
            LblTotal.Text = "SAR" + ShoppingCart.Instance.GetSubTotal().ToString();
            if(ShoppingCart.Instance.Items.Count == 0)
            {
                Avliablelbl.Visible = true;
                Checkout.Visible = false;
            }
            else 
            {
                Checkout.Visible= true;
                Avliablelbl.Visible = false; 
            }

           
        }

        protected void RemoveBtn_Click(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                ShoppingCart.Instance.RemoveItem(Convert.ToInt32(e.CommandArgument.ToString()));
                Response.Redirect("~/Users/Cart.aspx");
            }
          
            
        }
     
    }
}