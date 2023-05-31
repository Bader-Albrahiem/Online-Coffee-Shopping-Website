using OnlineCoffeeShopping.Models;
using Org.BouncyCastle.Asn1.Ocsp;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineCoffeeShopping.Users
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Email"] == null || Request.QueryString["token"] == null  || Request.QueryString.Count == 0)
            {
                Response.Redirect("~/Users/ForgetPassword.aspx");
            }
        }

        protected void Resetpassword_Click(object sender, EventArgs e)
        {
            Database db = new Database();
            SqlConnection con = db.Connection;
            try
            {
                Security Decrypte = new Security();
                string DecryptedEmail = Decrypte.DecryptString(Request.QueryString["Email"]);

                con.Open();
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandText = "SELECT * FROM ForgetPassword Where Email = @email";
                cmd.Parameters.AddWithValue("@email",DecryptedEmail);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    if (reader["token"].ToString() == Request.QueryString["token"].ToString())
                    {
                        reader.Close();
                        string EncryptedPass = Decrypte.EnryptString(TxtNewPassword.Text);
                        cmd.CommandText = "UPDATE TBL_USERS SET Password = @password where Email = @email";
                        cmd.Parameters.AddWithValue("@password", EncryptedPass);
                        cmd.ExecuteNonQuery();
                        cmd.CommandText = "Delete From ForgetPassword where Email = @email";
                        cmd.ExecuteNonQuery();
                        lblPasswordchanged.Text = "Your password has been changed.";
                    }
                    else
                    {
                        lblPasswordchanged.Text = "Invalid link";
                    }
                }
                else
                {
                    lblPasswordchanged.Text = "Invalid link";
                }
            }
            catch(Exception ex)
            {

            }
            finally
            {
                con.Close();
            }
        }
    }
}