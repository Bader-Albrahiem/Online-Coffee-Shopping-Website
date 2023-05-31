using OnlineCoffeeShopping.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Web.Configuration;


namespace OnlineCoffeeShopping
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                if(this.Request.QueryString["ReturnUrl"] != null && HttpContext.Current.User.Identity.IsAuthenticated)
                    {
                        Response.Redirect("~/Page403.aspx");
                    }
                else if (this.Request.QueryString["ReturnUrl"] != null && this.Request.QueryString["ReturnUrl"] != "login.aspx")
                {
                    this.Response.Redirect(Request.QueryString["ReturnUrl"].ToString());
                }
               else
                {
                    this.Response.Redirect("~/index.aspx");
                }
           }

        }
   

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            validator Valid = new validator();

            if (Valid.UserNameValid(TxtUserName.Text.Length) == false)
            {
                CustomValidator2.ErrorMessage = Valid.ErrorMessage;
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {

            validator Valid = new validator();
          
           if(Valid.PasswordValid(TxtPassowrd.Text.Length) == false)
            {
                CustomValidator1.ErrorMessage = Valid.ErrorMessage;
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }

        }
        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            if(Page.IsValid == true)
            {
                Database db = new Database();
                Security Enrypt = new Security();
                string password = Enrypt.EnryptString(TxtPassowrd.Text);
                SqlConnection Con = db.Connection;
                bool redirect = false;
                
               
                try
                {
                    Con.Open();
                    string role = "";
                   
                    SqlCommand cmd = Con.CreateCommand();
                    cmd.CommandText = "SELECT Username,Password,TBL_Users.Role,TBL_Users.User_id,Roles.Role_Name from TBL_Users left join Roles on TBL_Users.Role = Roles.Role_id Where TBL_Users.Username = @US AND TBL_Users.Password = @PWD";
                    cmd.Parameters.AddWithValue("@US",TxtUserName.Text);
                    cmd.Parameters.AddWithValue("@PWD", password);
                    SqlDataReader reader = cmd.ExecuteReader();


                    if (reader.HasRows)
                    {
                        if (reader.Read())
                        {
                            role = reader["Role_Name"].ToString();
                            Session["Id"] = reader["User_id"].ToString();
                        }
                        
                        FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, TxtUserName.Text, DateTime.Now, DateTime.Now.AddMinutes(2880), false, role , FormsAuthentication.FormsCookiePath);
                        string hash = FormsAuthentication.Encrypt(ticket);
                        HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, hash);

                        if (ticket.IsPersistent)
                        {
                            cookie.Expires = ticket.Expiration;
                        }
                        Response.Cookies.Add(cookie);
                        redirect = true;
                        Label1.Text = "Login success";

                    }
                    else
                    {
                        redirect = false;
                        Label1.Text = "Login falid";
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    Response.Redirect("PageUnderMaintaince.aspx",false);
                }
                finally { Con.Close(); }

                if(redirect == true)
                {
                    Response.Redirect(FormsAuthentication.GetRedirectUrl(TxtUserName.Text, false));
                   
                }

            }


        }

    }
}