using OnlineCoffeeShopping.Models;
using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineCoffeeShopping
{
    public partial class ProductInfo : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString.Count == 0)
            {
                Response.Redirect("~/Users/Products.aspx");
            }
            else
            {
                if (!this.IsPostBack)
                {
                    string id = Request.QueryString["ProdId"].ToString();

                    Database db = new Database();
                    DataTable dt;
                    string SQL = "SELECT P.Product_Id,Product_Name,Product_Price,Product_Desc,Product_Weight,Product_img,CompanyName FROM TBL_Prodcut P LEFT join Product_Info I on P.Product_Id = I.Product_Id LEFT JOIN TBL_Users ON Provider_Id = User_Id Where P.Product_Id='" + id + "'";

                    dt = db.Reader(SQL);

                    PdInfoRepeater.DataSource = dt;
                    PdInfoRepeater.DataBind();

                }
            }

        }

        protected void btnAddtoCart_Click(object sender, EventArgs e)
        {


            foreach (RepeaterItem item in PdInfoRepeater.Items)
            {
                //Find the txt control
                TextBox txtqantity = (TextBox)item.FindControl("Quantity");
                if (txtqantity != null)
                {
                    ShoppingCart.Instance.AddItem(Convert.ToInt32(Request.QueryString["ProdId"].ToString()), Convert.ToInt16(txtqantity.Text));
                    Response.Redirect("~/Users/Cart.aspx");
                }

            }

         
        }


    }
}