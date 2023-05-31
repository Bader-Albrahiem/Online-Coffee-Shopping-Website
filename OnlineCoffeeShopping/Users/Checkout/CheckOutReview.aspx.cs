using AjaxControlToolkit.HtmlEditor.ToolbarButtons;
using OnlineCoffeeShopping.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;




namespace OnlineCoffeeShopping.Users.Checkout
{
    public partial class CheckOutReview : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if(ShoppingCart.Instance.Items.Count == 0)
            {
                Response.Redirect("~/Users/Products.aspx");
            }
            ReviewRPT.DataSource = ShoppingCart.Instance.Items;
            ReviewRPT.DataBind();
            AddRPT.DataSource = ShoppingCart.Instance.OrderList;
            AddRPT.DataBind();

            Database db = new Database();
            SqlConnection con = db.Connection;
            try
            {


                int CustomerId = Convert.ToInt32(Session["Id"]);
                con.Open();
                SqlCommand cmd = con.CreateCommand();
                for (int i = 0; i < ShoppingCart.Instance.Items.Count; i++)
                {

                    var items = ShoppingCart.Instance.Items;
                    var order = ShoppingCart.Instance.OrderList;
                    List<CartItem> myOrderList = items;
                    List<OrderDeatils> OrderData = order;
                    int Prodid = 0;
                    decimal Price = 0;
                    int Quantity = 0;
                    string Weight = "";
                    for (int j = i; j <= i; j++)
                    {
                        Prodid = Convert.ToInt32(myOrderList[j].ProductId.ToString());
                        Price = Convert.ToDecimal(myOrderList[j].UnitPrice.ToString());
                        Quantity = Convert.ToInt16(myOrderList[j].Quantity.ToString());
                        Weight = myOrderList[j].Product_Weight.ToString();
                    }
                    var CustomerName = OrderData[0].Name.ToString();
                    var CustomerPhone = OrderData[0].Phone_Number.ToString();
                    var CustomerCountry = OrderData[0].Country.ToString();
                    var CutomerCity = OrderData[0].City.ToString();
                    var CustomerAddress = OrderData[0].Address.ToString();
                    var CustomerZipCode = OrderData[0].ZipCode.ToString();

                    cmd.Parameters.Clear();
                    cmd.CommandText = "INSERT INTO Order_Item(Customer_id,Product_id,Order_date,Order_Quantity,Order_Weight,Total_Price,CustomerName,CustomerCountry,CustomerAddress,CustomerCity,CustomerZipCode,TransactionId,Order_Status)VALUES(@Cutomerid,@Productid,@OrderDate,@OrderQuantitiy,@OrdeWeight,@TotalPrice,@CtName,@CtContry,@CtAdd,@CtCity,@CtZcode,@TransId,'Payment Recived')";
                    cmd.Parameters.AddWithValue("@Cutomerid", CustomerId);
                    cmd.Parameters.AddWithValue("@Productid", Prodid);
                    cmd.Parameters.AddWithValue("@OrderDate", DateTime.Now);
                    cmd.Parameters.AddWithValue("@OrderQuantitiy", Quantity);
                    cmd.Parameters.AddWithValue("@OrdeWeight", Weight);
                    cmd.Parameters.AddWithValue("@TotalPrice", Price);
                    cmd.Parameters.AddWithValue("@CtName", CustomerName);
                    cmd.Parameters.AddWithValue("@CtContry", CustomerCountry);
                    cmd.Parameters.AddWithValue("@CtAdd", CustomerAddress);
                    cmd.Parameters.AddWithValue("@CtCity", CutomerCity);
                    cmd.Parameters.AddWithValue("@CtZcode", CustomerZipCode);
                    cmd.Parameters.AddWithValue("@TransId", Session["token"].ToString());
                    cmd.ExecuteNonQuery();

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

        protected void addOrder_Click(object sender, EventArgs e)
        {
            GeneratePdfAndSendEmail();
            ShoppingCart.Instance.Items.Clear();
            ShoppingCart.Instance.OrderList.Clear();
            Response.Redirect("OrderComplete.aspx");

        }

        public void GeneratePdfAndSendEmail()
        {


            var items = ShoppingCart.Instance.Items;
            List<CartItem> myOrderList = items;
            string textBody = "<h2>"+"Your order in progress!"+"</h2>";
              textBody += "<p>" + "Order Creation date: " + DateTime.Now + "</p>";
              textBody += " <table border=" + 1 + " cellpadding=" + 1 + " cellspacing=" + 0 + " width = " + 700 + "><tr style=font-size:20px; text-align:center; bgcolor='#4da6ff'><td><b>Product Name</b></td> <td> <b> Price</b> </td> <td> <b>Quantity</b> </td> <td> <b>Weight</b> </td></tr>";
            for (int loopCount = 0; loopCount < myOrderList.Count; loopCount++)
            {
                textBody += "<tr style=font-size:20px; text-align:center;><td>" + $"{myOrderList[loopCount].ProductName}" + "</td><td> " + $"SAR{myOrderList[loopCount].UnitPrice}" + "</td> <td>" + $" {myOrderList[loopCount].Quantity}" + "</td><td>" + $"{myOrderList[loopCount].Product_Weight}G" + "</td> </tr>";
             }
            textBody += "</table>";
            string recipientEmail ="";
            Database db = new Database();
            SqlConnection con = db.Connection;
            try
            {
                con.Open();
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandText = "SELECT Email from TBL_Users where User_id = @id";
                cmd.Parameters.AddWithValue("@id", Session["Id"].ToString());
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    recipientEmail = reader["Email"].ToString();
                }

                reader.Close();
                
            }
            catch(Exception ex)
            {

            }
            finally 
            {
                con.Close(); 
            }
            MailMessage message = new MailMessage();
            message.From = new MailAddress("spcoffeeweb@hotmail.com");
            message.To.Add(new MailAddress(recipientEmail));
            message.Subject = "oreder has been received!";
            message.Body = textBody;
            message.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.office365.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.Credentials = new NetworkCredential("spcoffeeweb@hotmail.com", "josbnuhhslmbaooh");
            smtp.Send(message);
            // Close the PDF document
   
        }
    }
 }
