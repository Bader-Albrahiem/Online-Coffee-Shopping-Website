using OnlineCoffeeShopping.Admin;
using OnlineCoffeeShopping.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineCoffeeShopping
{
    public partial class CompanyProfile : System.Web.UI.Page
    {
        string id = HttpContext.Current.User.Identity.Name;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Id"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            DataTable ProdtDt, OrdersDt,MyOrderDt= new DataTable();
            Database db = new Database();
            string OrderSql = "SELECT Order_Id,Order_date, Order_Quantity,CustomerCountry,CustomerCity,CustomerAddress,CustomerZipCode,Order_Status, O.Order_Weight, Total_Price,Username,Product_Name,Category FROM Order_Item O LEFT JOIN TBL_Users on Customer_id = User_id LEFT JOIN TBL_Prodcut P on O.Product_id = P.Product_Id  Where Provider_Id =" + Session["Id"] + " Order by Order_Status ASC";
            if (!IsPostBack)
            {
                string MyProdSql = "SELECT * from TBL_Prodcut Where Provider_Id =" + Session["Id"] + "";
                ProdtDt = db.Reader(MyProdSql);
                MyprodRpeater.DataSource = ProdtDt;
                MyprodRpeater.DataBind();


                SqlConnection con = db.Connection;
                try
                {
                    con.Open();
                    SqlCommand cmd = con.CreateCommand();
                    cmd.CommandText = "SELECT Email,First_Name,Last_name from TBL_Users where Username = @username";
                    cmd.Parameters.AddWithValue("@username", HttpContext.Current.User.Identity.Name.ToString());
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        TxtFirstName.Text = dr[1].ToString();
                        TxtLasName.Text = dr[2].ToString();
                        TxtEmail.Text = dr[0].ToString();
                        dr.Close();
                    }
                  
                    string sql = "SELECT Order_date,Order_Quantity,Order_Weight,Total_Price,Order_Status,Product_img,Product_Name FROM Order_Item left join Product_info on Order_Item.Product_id = Product_info.Product_id left join TBL_Prodcut on Order_Item.Product_id = TBL_Prodcut.Product_Id where Customer_id = @id";
                    SqlDataAdapter adapter = new SqlDataAdapter(sql, con);
                    adapter.SelectCommand.Parameters.AddWithValue("@id", Convert.ToInt32(Session["Id"].ToString()));
                    adapter.Fill(MyOrderDt);
                    CompanyOrder.DataSource = MyOrderDt;
                    CompanyOrder.DataBind();
                    if (MyOrderDt.Rows.Count > 0)
                    {
                        Avliablelbl.Visible = false;
                    }
                    else
                    {
                        Avliablelbl.Visible = true;
                    }
                }
                catch (Exception ex)
                {

                }
                finally { con.Close(); }

            }
            OrdersDt = db.Reader(OrderSql);
            OrdersReapter.DataSource = OrdersDt;
            OrdersReapter.DataBind();

            TxtUsername.Text = HttpContext.Current.User.Identity.Name;

        }
        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {

            validator Valid = new validator();

            if (Valid.PasswordValid(args.Value.Length) == false)
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

            if (Valid.ComparePassword(TxtNewPassword.Text, TxtReEnterPassword.Text) == false)
            {
                CustomValidator1.ErrorMessage = Valid.ErrorMessage;
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }

        }

        protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
        {

            validator Valid = new validator();

            if (Valid.PasswordValid(args.Value.Length) == false)
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

            if (Valid.EmailValid(args.Value, args.Value.Length) == false)
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

            if (Valid.RequiredValid(TxtFirstName.Text.Length) == false)
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

            if (Valid.RequiredValid(TxtLasName.Text.Length) == false)
            {
                CustomValidator6.ErrorMessage = Valid.ErrorMessage;
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }

        }
        protected void CustomValidator7_ServerValidate(object source, ServerValidateEventArgs args)
        {

            validator Valid = new validator();

            if (Valid.RequiredValid(args.Value.Length) == false)
            {
                CustomValidator7.ErrorMessage = Valid.ErrorMessage;
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }

        }
        protected void CustomValidator8_ServerValidate(object source, ServerValidateEventArgs args)
        {

            validator Valid = new validator();

            if (Valid.RequiredValid(args.Value.Length) == false)
            {
                CustomValidator8.ErrorMessage = Valid.ErrorMessage;
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }

        }
        protected void CustomValidator9_ServerValidate(object source, ServerValidateEventArgs args)
        {

            validator Valid = new validator();

            if (Valid.RequiredValid(args.Value.Length) == false)
            {
                CustomValidator9.ErrorMessage = Valid.ErrorMessage;
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }

        }
        protected void CustomValidator10_ServerValidate(object source, ServerValidateEventArgs args)
        {

            validator Valid = new validator();

            if (Valid.RequiredValid(args.Value.Length) == false)
            {
                CustomValidator10.ErrorMessage = Valid.ErrorMessage;
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }

        }

        protected void CustomValidator12_ServerValidate(object source, ServerValidateEventArgs args)
        {

            validator Valid = new validator();

            if (Valid.RequiredValid(args.Value.Length) == false)
            {
                CustomValidator12.ErrorMessage = Valid.ErrorMessage;
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }

        }
        protected void CustomValidator13_ServerValidate(object source, ServerValidateEventArgs args)
        {

            validator Valid = new validator();

            if (Valid.RequiredValid(args.Value.Length) == false)
            {
                CustomValidator13.ErrorMessage = Valid.ErrorMessage;
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }

        }
        protected void CustomValidator14_ServerValidate(object source, ServerValidateEventArgs args)
        {

            validator Valid = new validator();

            if (Valid.RequiredValid(args.Value.Length) == false)
            {
                CustomValidator14.ErrorMessage = Valid.ErrorMessage;
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }

        }
        protected void CustomValidator15_ServerValidate(object source, ServerValidateEventArgs args)
        {

            validator Valid = new validator();

            if (Valid.RequiredValid(args.Value.Length) == false)
            {
                CustomValidator15.ErrorMessage = Valid.ErrorMessage;
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }

        }

        protected void BtnEdit_Click(object sender, EventArgs e)
        {
            TxtEmail.ReadOnly = false;
            TxtFirstName.ReadOnly = false;
            TxtLasName.ReadOnly = false;
            BtnEdit.Visible = false;
            BtnUpdate.Visible = true;
            BtnCancelInfo.Visible = true;
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            BtnEdit.Visible = true;
            BtnUpdate.Visible = false;
            if (Page.IsValid)
            {
                Database db = new Database();
                SqlConnection Con = db.Connection;
                try
                {

                    Con.Open();
                    SqlCommand cmd = Con.CreateCommand();
                    cmd.CommandText = "UPDATE TBL_Users SET First_Name = @FNAME, Last_Name = @Lname, Email = @email where username = @User";
                    cmd.Parameters.AddWithValue("@FNAME", TxtFirstName.Text);
                    cmd.Parameters.AddWithValue("@Lname", TxtLasName.Text);
                    cmd.Parameters.AddWithValue("@User", HttpContext.Current.User.Identity.Name.ToString());
                    cmd.Parameters.AddWithValue("@email", TxtEmail.Text);
                    cmd.ExecuteNonQuery();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Personal information has been updated.')", true);
                }
                catch (Exception ex)
                {

                }
                finally { Con.Close(); }
            }
        }


        protected void MyprodRpeater_itemcommand(object source, RepeaterCommandEventArgs e)
        {

            Button EditBtnProd = (Button)e.Item.FindControl("EditBtnProd");
            Button UpdateProdBtn = (Button)e.Item.FindControl("UpdateProdBtn");
            Button CancelProd = (Button)e.Item.FindControl("CancelBtn");
            TextBox TxtProudctEdit = (TextBox)e.Item.FindControl("TxtProudctEdit");
            TextBox TxtPriceEdit = (TextBox)e.Item.FindControl("TxtPriceEdit");
            TextBox TxtQuantittyEdit = (TextBox)e.Item.FindControl("TxtQuantittyEdit");
            TextBox TxtWeightEdit = (TextBox)e.Item.FindControl("TxtWeightEdit");
            CustomValidator TxtProdNameValid = (CustomValidator)e.Item.FindControl("CustomValidator16");
            CustomValidator TxtProdPriceValid = (CustomValidator)e.Item.FindControl("CustomValidator17");
            CustomValidator TxtProdQuantityValid = (CustomValidator)e.Item.FindControl("CustomValidator18");
            CustomValidator TxtProdWeightValid = (CustomValidator)e.Item.FindControl("CustomValidator19");
            validator Valid = new validator();


            if (e.CommandName == "EditBtnProd")
            {
                CancelProd.Visible = true;
                TxtProudctEdit.ReadOnly = false;
                TxtPriceEdit.ReadOnly = false;
                TxtQuantittyEdit.ReadOnly = false;
                TxtWeightEdit.ReadOnly = false;
                EditBtnProd.Visible = false;
                UpdateProdBtn.Visible = true;
            }
            if (e.CommandName == "UpdateProdBtn")
            {
                EditBtnProd.Visible = true;
                UpdateProdBtn.Visible = false;
                TxtProudctEdit.ReadOnly = true;
                TxtPriceEdit.ReadOnly = true;
                TxtQuantittyEdit.ReadOnly = true;
                TxtWeightEdit.ReadOnly = true;

                if (Valid.RequiredValid(TxtProudctEdit.Text.Length) == false)
                {
                    TxtProdNameValid.ErrorMessage = Valid.ErrorMessage;
                    TxtProdNameValid.IsValid = false;
                }
                else
                {
                    TxtProdNameValid.IsValid = true;
                }



                if (Valid.RequiredValid(TxtPriceEdit.Text.Length) == false)
                {
                    TxtProdPriceValid.ErrorMessage = Valid.ErrorMessage;
                    TxtProdPriceValid.IsValid = false;
                }
                else
                {
                    TxtProdPriceValid.IsValid = true;
                }



                if (Valid.RequiredValid(TxtQuantittyEdit.Text.Length) == false)
                {
                    TxtProdQuantityValid.ErrorMessage = Valid.ErrorMessage;
                    TxtProdQuantityValid.IsValid = false;
                }
                else
                {
                    TxtProdQuantityValid.IsValid = true;
                }

                if (Valid.RequiredValid(TxtWeightEdit.Text.Length) == false)
                {
                    TxtProdWeightValid.ErrorMessage = Valid.ErrorMessage;
                    TxtProdWeightValid.IsValid = false;
                }
                else
                {
                    TxtProdWeightValid.IsValid = true;
                }

            }
            if (e.CommandName == "DeleteBtnProd")
            {


                Database db = new Database();
                SqlConnection con = db.Connection;
                try
                {
                    con.Open();
                    SqlCommand cmd = con.CreateCommand();
                    cmd.CommandText = "DELETE FROM TBL_Prodcut WHERE Product_Id = @Prodid";
                    cmd.Parameters.AddWithValue("@Prodid", Convert.ToInt32(e.CommandArgument));
                    cmd.ExecuteNonQuery();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Product has been Deleted.')", true);

                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
                finally
                {
                    con.Close();
                }
            }
            if (e.CommandName == "UpdateProdBtn")
            {


                Database db = new Database();
                SqlConnection con = db.Connection;
                try
                {
                    con.Open();
                    SqlCommand cmd = con.CreateCommand();
                    cmd.CommandText = "UPDATE TBL_Prodcut SET Product_Name = @ProdName, Product_Weight = @ProdWeight, Product_Quantity = @ProdQuantity, Product_Price = @ProdPrice WHERE Product_Id =@Prodid";
                    cmd.Parameters.AddWithValue("@Prodid", Convert.ToInt32(e.CommandArgument));
                    cmd.Parameters.AddWithValue("@ProdName", TxtProudctEdit.Text);
                    cmd.Parameters.AddWithValue("@ProdWeight", TxtWeightEdit.Text);
                    cmd.Parameters.AddWithValue("@ProdQuantity", Convert.ToInt16(TxtQuantittyEdit.Text));
                    cmd.Parameters.AddWithValue("@ProdPrice", float.Parse(TxtPriceEdit.Text));
                    cmd.ExecuteNonQuery();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Product has been Edited.')", true);

                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
                finally
                {
                    con.Close();
                }

            }
            if(e.CommandName == "CancelProdBtn")
            {
                EditBtnProd.Visible = true;
                UpdateProdBtn.Visible = false;
                CancelProd.Visible = false;
                TxtProudctEdit.ReadOnly = true;
                TxtPriceEdit.ReadOnly = true;
                TxtQuantittyEdit.ReadOnly = true;
                TxtWeightEdit.ReadOnly = true;
            }
        }

        protected void SendRptBtn_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {
                if (!this.IsPostBack)
                {
                    Database db = new Database();
                    SqlConnection Con = db.Connection;
                    try
                    {
                        Con.Open();
                        SqlCommand cmd = Con.CreateCommand();
                        cmd.CommandText = "Insert into Company_Feed(User_id,User_Email,Report_Details)values(@Username,@Email,@Desc)";
                        cmd.Parameters.AddWithValue("@Username", id.ToString());
                        cmd.Parameters.AddWithValue("@Email", TxtReportEmail.Text);
                        cmd.Parameters.AddWithValue("@Desc", TxtReportDesc.Text);
                        cmd.ExecuteNonQuery();
                        ReportText.Text = "Report has been send, Thanks!";
                    }
                    catch (Exception ex)
                    {

                    }
                    finally
                    {
                        Con.Close();
                    }
                }
            }
        }

        protected void AddNewProdBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Database db = new Database();
                SqlConnection Con = db.Connection;
                string[] Type = { ".jpg", ".bmp", ".gif", ".png", ".jfif" };
                string path = Server.MapPath(@"~/Uploadedimage");
                bool IsValid = false;
                try
                {
                    if (inputGroupFile02.HasFile)
                    {
                        string ext = Path.GetExtension(inputGroupFile02.PostedFile.FileName);
                        string filename = inputGroupFile02.PostedFile.FileName;

                        for (int i = 0; i < Type.Length; i++)
                        {
                            if (ext == Type[i])
                            {
                                IsValid = true;
                                break;
                            }
                        }
                        if (IsValid == true)
                        {
                            if (inputGroupFile02.PostedFile.ContentLength > 3000000)
                            {
                                lblNewProd.Text = "File size is bigger than excepted";
                            }
                            else
                            {
                                if (!Directory.Exists(path))
                                {
                                    Directory.CreateDirectory(path);

                                }

                                if (File.Exists(Path.Combine(path, filename)))
                                {
                                    Random rand = new Random();
                                    filename = rand.Next() + filename;
                                }
                                inputGroupFile02.SaveAs(Path.Combine(path, filename));
                                Con.Open();
                                SqlCommand cmd = Con.CreateCommand();
                                cmd.CommandText = "INSERT INTO TBL_Prodcut values(@ProviderId, @Pro_Name, @Pro_Qunatity, @Pro_Price, @Pro_Desc,@Prodect_Weight,@Catgeory,@IsActive) Select scope_Identity()";
                                cmd.Parameters.AddWithValue("@ProviderId", Session["Id"].ToString()); ;
                                cmd.Parameters.AddWithValue("@Pro_Name", TxtProdName.Text);
                                cmd.Parameters.AddWithValue("@Pro_Qunatity", txtQunatity.Text);
                                cmd.Parameters.AddWithValue("@Pro_Price", TxtProdPrice.Text);
                                cmd.Parameters.AddWithValue("@Pro_Desc", TxtProdDescription.Text);
                                cmd.Parameters.AddWithValue("@Prodect_Weight", WEG1.Text);
                                cmd.Parameters.AddWithValue("@Catgeory", DrpNewProdCate.SelectedValue);
                                cmd.Parameters.AddWithValue("@IsActive", 0);
                                int LastId = Convert.ToInt32(cmd.ExecuteScalar());
                                cmd.CommandText = "Insert into Product_info VALUES(@id,@img)";
                                cmd.Parameters.AddWithValue("@id", LastId);
                                cmd.Parameters.AddWithValue("@img", "../Uploadedimage" + "\\" + filename);
                                lblNewProd.Text = "New product has been uploadded.";
                                cmd.ExecuteNonQuery();
                            }
                        }
                        else
                        {
                            lblNewProd.Text = "Format not Correct";
                        }
                    }
                    else
                    {
                        lblNewProd.Text = "No file found";
                    }

                }
                catch (Exception ex)
                {

                }
                finally
                {
                    Con.Close();
                }
            }
        }


        protected void OrdersReapter_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Button Updatestatus = (Button)e.Item.FindControl("ShippingBtn");

            if (e.CommandName.Equals("UpdateStatus"))
            {
                Updatestatus.Visible = false;
                Database db = new Database();
                SqlConnection con = db.Connection;
                try
                {
                    con.Open();
                    SqlCommand cmd = con.CreateCommand();
                    cmd.CommandText = "UPDATE Order_Item SET Order_Status = 'Shipping' WHERE Order_Id = @Ordid";
                    cmd.Parameters.AddWithValue("Ordid", Convert.ToInt32(e.CommandArgument));
                    cmd.ExecuteNonQuery();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Order Status has been updated.')", true);

                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
                finally
                {
                    con.Close();
                }
            }

        }

        protected void BtnChangePass_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Database db = new Database();
                SqlConnection con = db.Connection;
                Security Encrypted = new Security();
                try
                {
                    string OldPass = Encrypted.EnryptString(TxtOldPassword.Text);
                    con.Open();
                    SqlCommand cmd = con.CreateCommand();
                    cmd.CommandText = "SELECT Password FROM TBL_Users Password where Username = @username and Password = @pass";
                    cmd.Parameters.AddWithValue("@pass", OldPass);
                    cmd.Parameters.AddWithValue("@username", HttpContext.Current.User.Identity.Name.ToString());
                    SqlDataReader rd = cmd.ExecuteReader();
                    if (TxtOldPassword.Text == TxtNewPassword.Text)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please enter password not simillar to old password.')", true);

                    }
                    else
                    {
                        if (rd.HasRows)
                        {
                            string newPassord = Encrypted.EnryptString(TxtNewPassword.Text);
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

        protected void BtnCancelInfo_Click(object sender, EventArgs e)
        {
            TxtEmail.ReadOnly = true;
            TxtFirstName.ReadOnly = true;
            TxtLasName.ReadOnly = true;
            BtnEdit.Visible = true;
            BtnUpdate.Visible = false;
            BtnCancelInfo.Visible = false;
        }
    }
}
   

     