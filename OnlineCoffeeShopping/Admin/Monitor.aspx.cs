using OnlineCoffeeShopping.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineCoffeeShopping.Admin
{
    public partial class Monitor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Database db = new Database();
            SqlConnection con = db.Connection;
            string SQL;
            DataTable dt;
            try
            {
                SQL = "SELECT TBL_Prodcut.Product_Id,TBL_Prodcut.Product_Name,TBL_Prodcut.Product_Price,Product_Info.Product_img FROM TBL_Prodcut LEFT join Product_Info on TBL_Prodcut.Product_Id = Product_Info.Product_Id Order by TBL_Prodcut.IsActive";
                dt = db.Reader(SQL);
                MNTProdRpeater.DataSource = dt;
                MNTProdRpeater.DataBind();
            }
            catch(Exception ex)
            {

            }
            finally { con.Close(); }

        }
    }
}