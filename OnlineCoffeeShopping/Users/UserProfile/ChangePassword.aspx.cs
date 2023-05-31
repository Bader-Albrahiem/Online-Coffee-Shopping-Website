using OnlineCoffeeShopping.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineCoffeeShopping.Users.UserProfile
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UpdatePass_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Database db = new Database();
                SqlConnection con = db.Connection;
                Security Encrypted = new Security();
                try
                {
                    string OldPass = Encrypted.EnryptString(OldPWD.Text);
                    con.Open();
                    SqlCommand cmd = con.CreateCommand();
                    cmd.CommandText = "SELECT Password FROM TBL_Users Password where Username = @username and Password = @pass";
                    cmd.Parameters.AddWithValue("@pass", OldPass);
                    cmd.Parameters.AddWithValue("@username", HttpContext.Current.User.Identity.Name.ToString());
                    SqlDataReader rd = cmd.ExecuteReader();
                    if (OldPWD.Text == NewPWD.Text)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please enter password not simillar to old password.')", true);

                    }
                    else
                    {
                        if (rd.HasRows)
                        {
                            string newPassord = Encrypted.EnryptString(NewPWD.Text);
                            rd.Close();
                            cmd.CommandText = "Update TBL_Users SET Password = @NewPass where username = @user and Password = @OldPassword";
                            cmd.Parameters.AddWithValue("@NewPass", newPassord);
                            cmd.Parameters.AddWithValue("@user", HttpContext.Current.User.Identity.Name.ToString());
                            cmd.Parameters.AddWithValue("@OldPassword", OldPass);
                            cmd.ExecuteNonQuery();
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Password has been updated.')", true);

                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('incorrect password.')", true);
                        }
                    }

                }
                catch (Exception ex)
                {

                }
                finally { con.Close(); }
            }
            }
    }
}