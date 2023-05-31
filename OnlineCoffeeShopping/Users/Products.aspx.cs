using OnlineCoffeeShopping.Models;
using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineCoffeeShopping
{
    public partial class Products : System.Web.UI.Page
    {

        Database db = new Database();
        DataTable dt = new DataTable();
        string SQL;
        protected void Page_Load(object sender, EventArgs e)
        {
    
            if (Request.QueryString.Count > 0)
            {
                string name = Request.QueryString["Name"].ToString();
                SQL = "SELECT TBL_Prodcut.Product_Id,TBL_Prodcut.Product_Name,TBL_Prodcut.Product_Price,Product_Info.Product_img FROM TBL_Prodcut LEFT join Product_Info on TBL_Prodcut.Product_Id = Product_Info.Product_Id WHERE TBL_Prodcut.IsActive = 1 AND TBL_Prodcut.Product_Name LIKE @Name";

                SqlConnection con = db.Connection;
                try
                {
                    con.Open();
                    SqlCommand cmd = con.CreateCommand();
                    SqlDataAdapter adapter = new SqlDataAdapter(SQL, con);
                    adapter.SelectCommand.Parameters.AddWithValue("@Name","%"+name+"%");

                    adapter.Fill(dt);
                    ProdcutRpeater.DataSource = dt;
                    ProdcutRpeater.DataBind();
                    if (dt.Rows.Count > 0)
                    {
                        lblEmpty.Visible = false;
                    }
                    else
                    {
                        lblEmpty.Visible = true;
                    }
                }
                catch (Exception ex)
                {

                }
                finally
                {
                    con.Close();
                };
            }
            else
            {
                SQL = "SELECT TBL_Prodcut.Product_Id,TBL_Prodcut.Product_Name,TBL_Prodcut.Product_Price,Product_Info.Product_img FROM TBL_Prodcut LEFT join Product_Info on TBL_Prodcut.Product_Id = Product_Info.Product_Id WHERE TBL_Prodcut.IsActive = 1";
                dt = db.Reader(SQL);
                ProdcutRpeater.DataSource = dt;
                ProdcutRpeater.DataBind();
                lblEmpty.Visible = false;

                if (DropDownList1.SelectedIndex != 0)
                {
                    dt.Clear();
                    ProdcutRpeater.Dispose();
                    ProdcutRpeater.DataBind();
                    SQL = "SELECT TBL_Prodcut.Product_Id,TBL_Prodcut.Product_Name,TBL_Prodcut.Product_Price,Product_Info.Product_img FROM TBL_Prodcut LEFT join Product_Info on TBL_Prodcut.Product_Id = Product_Info.Product_Id WHERE TBL_Prodcut.IsActive = 1 AND category = '" + DropDownList1.SelectedValue + "'";
                    dt = db.Reader(SQL);
                    ProdcutRpeater.DataSource = dt;
                    ProdcutRpeater.DataBind();
                    int num = dt.Rows.Count;
                    if (dt.Rows.Count > 0)
                    {
                        lblEmpty.Visible = false;
                    }
                    else
                    {
                        lblEmpty.Visible = true;
                    }
                }
            }
        }

        
    }
}