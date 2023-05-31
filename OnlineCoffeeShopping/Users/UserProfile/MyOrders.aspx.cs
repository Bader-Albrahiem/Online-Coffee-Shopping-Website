using OnlineCoffeeShopping.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineCoffeeShopping.Users.UserProfile
{
    public partial class MyOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Database db = new Database();
            SqlConnection con = db.Connection;
            DataTable dt = new DataTable();

            try
            {
             
                con.Open();
                string sql = "SELECT Order_date,Order_Quantity,Order_Weight,Total_Price,Order_Status,Product_img,Product_Name FROM Order_Item left join Product_info on Order_Item.Product_id = Product_info.Product_id left join TBL_Prodcut on Order_Item.Product_id = TBL_Prodcut.Product_Id where Customer_id = @id";
                SqlDataAdapter adapter = new SqlDataAdapter(sql,con);
                adapter.SelectCommand.Parameters.AddWithValue("@id", Convert.ToInt32(Session["Id"].ToString()));
                adapter.Fill(dt);
                UserOrdersRPT.DataSource = dt;
                UserOrdersRPT.DataBind();
                if(dt.Rows.Count > 0)
                {
                    Avliablelbl.Visible = false;
                }
                else
                {
                    Avliablelbl.Visible=true;
                }

                
            }
            catch (Exception ex) 
            { 

            }
            finally 
            {
                
                con.Close();
            }
        }
    }
}