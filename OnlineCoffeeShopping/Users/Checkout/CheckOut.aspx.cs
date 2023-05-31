using OnlineCoffeeShopping.Models;
using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineCoffeeShopping.Users.Company
{
    public partial class CheckOut : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
           if(ShoppingCart.Instance.Items.Count == 0)
            {
                Response.Redirect("~/Users/Products.aspx");
            }
                decimal total = ShoppingCart.Instance.GetSubTotal() + ShoppingCart.Instance.Tax() + ShoppingCart.Instance.Shipping();
                CheckOutRPTR.DataSource = ShoppingCart.Instance.Items;
                CheckOutRPTR.DataBind();
                SubtotalLBl.Text = "Subtotal: " + "SAR" + Convert.ToString(ShoppingCart.Instance.GetSubTotal());
                LblTotal.Text = "Total: " + "SAR" + total.ToString();
                TaxLbl.Text = "Tax: " + "SAR" + ShoppingCart.Instance.Tax().ToString();
                Shippinglbl.Text = "Shipping: " + "SAR" + ShoppingCart.Instance.Shipping().ToString();
            
        }
        protected void CheckoutBtn_Click(object sender, ImageClickEventArgs e)
        {
                Session["payment_amt"] = ShoppingCart.Instance.USDtotal();
                ShoppingCart.Instance.AddOrder(txtName.Text, txtPhone.Text,drpCountry.SelectedValue,txtCity.Text,txtZipcode.Text,txtAddress.Text);

            Response.Redirect("CheckoutStart.aspx");

        }
    }
}