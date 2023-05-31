using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace OnlineCoffeeShopping.Models
{
    public class Product
    {
        public int Id { get; set; }
        public decimal Price { get; set; }
        public string ProductName { get; set; }
        public string CompanyName { get; set; }
        public string imgPath { get; set;}

        public string Product_Weight { get; set; }
        public Product(int id)
        {
            Database db = new Database();
            string SQL = "SELECT P.Product_Id,Product_Name,Product_Price,Product_Desc,Product_Weight,Product_img,CompanyName FROM TBL_Prodcut P LEFT join Product_Info I on P.Product_Id = I.Product_Id LEFT JOIN TBL_Users ON Provider_Id = User_Id Where P.Product_Id=@ProdId";
            
            SqlConnection Con = db.Connection;
            Con.Open();
            SqlCommand cmd = Con.CreateCommand();
            cmd.CommandText = SQL;
            cmd.Parameters.AddWithValue("ProdId", id);
            SqlDataReader reader = cmd.ExecuteReader();

            if(reader.Read())
            {
                this.ProductName = reader["Product_Name"].ToString();
                this.Price = Convert.ToDecimal(reader["Product_Price"].ToString());
                this.CompanyName = reader["CompanyName"].ToString();
                this.imgPath = reader["Product_img"].ToString();
                this.Product_Weight = reader["Product_Weight"].ToString() ;
            }
            
        }
    }
}