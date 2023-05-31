using OnlineCoffeeShopping.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.EnterpriseServices.CompensatingResourceManager;
using static System.Net.WebRequestMethods;
using System.Text;

namespace OnlineCoffeeShopping.Users
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
       
        protected void resetbtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Database db = new Database();
                SqlConnection con = db.Connection;

                try
                {
                    con.Open();

                    SqlCommand cmd = con.CreateCommand();
                    cmd.CommandText = "SELECT Username, Email from TBL_Users where Email = @email";
                    cmd.Parameters.AddWithValue("@email", TxtEmail.Text);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {

                        string txtUsername = null;

                        txtUsername = reader["Username"].ToString();
                        reader.Close();
                        Security Encrypt = new Security();
                        Random rand = new Random();
                        string token = TxtEmail.Text;

                        const string pool = "abcdefghijklmnopqrstuvwxyz0123456789";
                        for (var i = 0; i < 11; i++)
                        {
                            var c = pool[rand.Next(0, pool.Length)];
                            token += c;
                        }

                        token = Encrypt.EnryptString(token);
                        string EncryptedEmail = Encrypt.EnryptString(TxtEmail.Text);
                        cmd.CommandText = "Delete from ForgetPassword where Email = @email";
                        cmd.ExecuteNonQuery();
                        cmd.CommandText = "INSERT INTO ForgetPassword values(@email, @token, @date)";
                        cmd.Parameters.AddWithValue("@token", token);
                        cmd.Parameters.AddWithValue("@date", DateTime.Now);
                        cmd.ExecuteNonQuery();
                        GenerateResetPassword(TxtEmail.Text, EncryptedEmail, token, txtUsername);

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
        public void GenerateResetPassword(string recipientEmail,string EncryptedEmail,string token, string Username)
        {
           
            string link = "https://localhost:44397/Users/ChangePassword.aspx?Email="+EncryptedEmail+"&Token="+token+"";

            string textBody = "<h3 style=text-color:'silver';>"+"Hi "+Username+", <br/>"+"</h3>";
            textBody += "<p style=text-color:'silver'>" + "We got a requset to change your password. You can create a new password to finish making changes in Account Center."+"</p>"+"<br/>";
            textBody += "<p>" + "After 5 minute this link well not working." + "</p> <br/>";
            textBody += "<a href ="+link+"> Click here</a>";
            textBody += "<p style=text-color:'silver'>" + "If you ignore this message, your password will not be changed, and your changes to Account center will not be saved. If you didn't requset a new password, let us know." + "</p>";
            MailMessage message = new MailMessage();
            message.From = new MailAddress("email");
            message.To.Add(new MailAddress(recipientEmail));
            message.Subject = "Create a new password";
            message.Body = textBody;
            message.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.office365.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.Credentials = new NetworkCredential("email", "password");
            smtp.Send(message);
           



        }

   
    }
}
