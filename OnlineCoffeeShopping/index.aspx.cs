using OnlineCoffeeShopping.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineCoffeeShopping
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnNWL_Click(object sender, EventArgs e)
        {
            Database db = new Database();
            SqlConnection con = db.Connection;
            try
            {
                con.Open();
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandText = "Insert into Newsletter(Email)values(@email)";
                cmd.Parameters.AddWithValue("@email",txtEmail.Text);
                cmd.ExecuteNonQuery();
                lblInsert.Text = "Thank you!";
            }
            catch (Exception ex)
            {

            }
            finally { con.Close(); }

        }
    }
}