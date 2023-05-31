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
    public partial class CompanyRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            validator Valid = new validator();

            if (Valid.UserNameValid(TxtUserName.Text.Length) == true)
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

            if (Valid.PasswordValid(TxtPssword.Text.Length) == false)
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

            if (Valid.ComparePassword(TxtPssword.Text, TxtReEnterPassword.Text) == false)
            {
                CustomValidator4.ErrorMessage = Valid.ErrorMessage;
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }

        }
        protected void CustomValidator5_ServerValidate(object source, ServerValidateEventArgs args)
        {

            validator Valid = new validator();

            if (Valid.RequiredValid(TxtCompanyName.Text.Length) == false)
            {
                CustomValidator5.ErrorMessage = Valid.ErrorMessage;
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }

        }
        protected void CustomValidator6_ServerValidate(object source, ServerValidateEventArgs args)
        {

            validator Valid = new validator();

            if (Valid.DropDownValid(DrpCcuntry.SelectedIndex) == false)
            {
                CustomValidator6.ErrorMessage = Valid.ErrorMessage;
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }

        }

        protected void btnReg_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {
                Database db = new Database();
                SqlConnection Con = db.Connection;
                try
                {
                  int Checkdata =  db.CheckData(TxtUserName.Text, TxtCompanyName.Text, TxtEmail.Text);

                    if(Checkdata == 1)
                    {
                        Label1.Text = "Username already exsists";
                    }
                    else if(Checkdata == 2)
                    {
                        Label1.Text = "Email already exsists";
                    }
                    else if(Checkdata == 3)
                    {
                        Label1.Text = "Company Name already exsists";
                    }
                    else
                    {
                        Security Encrypt = new Security();
                        Con.Open();

                        string password = Encrypt.EnryptString(TxtPssword.Text);
                        SqlCommand cmd = Con.CreateCommand();
                        cmd.CommandText = "insert into TBL_Users(Username,Email,Password,Role,CompanyName,Country)values(@user,@email,@pass,102,@CmName,@CTRY)";
                        cmd.Parameters.AddWithValue("@user", TxtUserName.Text);
                        cmd.Parameters.AddWithValue("@email", TxtEmail.Text);
                        cmd.Parameters.AddWithValue("@pass", password);
                        cmd.Parameters.AddWithValue("@CmName", TxtCompanyName.Text);
                        cmd.Parameters.AddWithValue("@CTRY", DrpCcuntry.SelectedValue.ToString());
                        cmd.ExecuteNonQuery();

                        Label1.Text = "Register successfully.";
                    }
                        
                }
                catch(Exception ex)
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
