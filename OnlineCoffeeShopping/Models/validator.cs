using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI.WebControls;

namespace OnlineCoffeeShopping
{
    
    public class validator
    {
        public string ErrorMessage { get; set; }

     public  validator()
        {

        }
        public bool PasswordValid(int length)
        {

            if (length < 1)
            {
                ErrorMessage = "Please enter password.";
                return false;
            }
            else if (length >= 8 && length <= 30)
            {
                return true;
                
            }
            else
            {
                ErrorMessage = "Invalid password combination.";
                return false;
            }
        }
        public bool UserNameValid(int length)
        {
            if (length < 1 || length == 0)
            {
                ErrorMessage = "Please enter username.";
                return false;
            }
            else if (length >= 6 && length <= 40)
            {
                return true;

            }
            else
            {
                ErrorMessage = "Name must be grater than 5 character.";
                return false;
            }
        }
        public bool EmailValid(string Email, int length)
        {
            bool rgex = Regex.IsMatch(Email, @"^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$");

            if(length < 1)
            {
                ErrorMessage = "Please enter email.";
                return false;
            }
            else if(rgex != true)
            {
                ErrorMessage = "Please enter correct email.";
                return false;
            }
            else
            {
                return true;
            }
        }
        public bool ComparePassword(string PW1,string PW2)
        {
            if(PW1 != PW2)
            {
                ErrorMessage = "Password not match.";
                return false;
            }
            else
            {
                return true;
            }
        }
        public bool RequiredValid(int length)
        {
            if(length < 1)
            {
                ErrorMessage = "*";
                return false;
            }
            else
            {
                return true;
            }
        }
        public bool DropDownValid(int index)
        {
            if(index == 0)
            {
                ErrorMessage = "Please select value";
                return false;
            }
            else
            {
                return true;
            }

        }
    }

  
}