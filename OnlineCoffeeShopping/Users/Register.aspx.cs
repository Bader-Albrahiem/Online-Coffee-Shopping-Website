using OnlineCoffeeShopping.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineCoffeeShopping
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            validator Valid = new validator();

            if(Valid.UserNameValid(TxtUserName.Text.Length) == true)
            {
                args.IsValid = true;
            }
            else
            {
                CustomValidator1.ErrorMessage = Valid.ErrorMessage;
                args.IsValid = false;
            }
            
        }
        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            validator Valid = new validator();

            if (Valid.EmailValid(TxtEmail.Text, TxtEmail.Text.Length) == true)
            {
                args.IsValid = true;
            }
            else
            {
                CustomValidator2.ErrorMessage = Valid.ErrorMessage;
                args.IsValid = false;
            }

        }
        protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
        {

            validator Valid = new validator();

            if (Valid.PasswordValid(TxtPassword.Text.Length) == false)
            {
                CustomValidator3.ErrorMessage = Valid.ErrorMessage;
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }

        }
        protected void CustomValidator4_ServerValidate(object source, ServerValidateEventArgs args)
        {

            validator Valid = new validator();

            if (Valid.ComparePassword(TxtPassword.Text, TxtReEnterPassword.Text) == false)
            {
                CustomValidator4.ErrorMessage = Valid.ErrorMessage;
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }

        }

        protected void BtnReister_Click(object sender, EventArgs e)
        {
            if(Page.IsValid == true)
            {
                Database db = new Database();
                SqlConnection Con = db.Connection;

               int userdata = db.CheckData(TxtUserName.Text, TxtEmail.Text);
                if (userdata == 1)
                {
                    Label1.Text = "Username already exsists";   
                }
                else if (userdata == 2)
                {
                    Label1.Text = "Email already exsists";
                }
                else
                {
                    try
                    {
                        Security Encrypt = new Security();

                        string password = Encrypt.EnryptString(TxtPassword.Text);
                        Con.Open();
                        SqlCommand cmd = Con.CreateCommand();
                        cmd.CommandText = "insert into TBL_Users(Username,Email,Password,Role)values(@user,@email,@pass,101)";
                        cmd.Parameters.AddWithValue("@user", TxtUserName.Text);
                        cmd.Parameters.AddWithValue("@email", TxtEmail.Text);
                        cmd.Parameters.AddWithValue("@pass", password);
                        cmd.ExecuteNonQuery();

                        Label1.Text = "Register successfully.";

                    }
                    catch (Exception ex)
                    {
                        Response.Redirect("PageUnderMaintaince.aspx");
                    }
                    finally
                    {
                        Con.Close();
                    }
                }

            }
        }
    }
}