using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.Caching;

namespace OnlineCoffeeShopping.Models
{
    public class Database
    {
        private SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["OCS_DB"].ConnectionString);
        public SqlConnection Connection { get { return Con; } }
      

        public Database()
        {

        }

        public int CheckData(string username, string email)
        {
            int result = 5;
            try
            {


                Con.Open();
                SqlCommand cmd = new SqlCommand("Select Username,Email from TBL_Users where Username = @username or Email = @email", Con);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@email", email);
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {

                    if (reader["Username"].ToString() == username)
                    {
                        reader.Close();
                        result = 1;
                        break;
                    }
                    else if (reader["Email"].ToString() == email)
                    {
                        reader.Close();
                        result = 2;
                        break;
                    }
                    else
                    {
                        reader.Close();
                        result = 0;
                        
                    }

                }

            }
            catch (Exception ex)
            {

            }
            finally
            {
                
                Con.Close();
            }
           return result;

        }
        public int CheckData(string username,string Companyname,string email)
        {
            int result = 5;
            try { 
            Con.Open();
            SqlCommand cmd = new SqlCommand("Select Username,CompanyName from TBL_Users where Username = @username or Email = @email or CompanyName = @Companyname", Con);
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@Companyname", Companyname);
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {

                if (reader["Username"].ToString() == username)
                {
                    reader.Close();
                    result = 1;
                    break;
                }
                else if (reader["Email"].ToString() == email)
                {
                    reader.Close();
                    result = 2;
                    break;
                }
                else if (reader["CompanyName"].ToString() == Companyname)
                {
                    reader.Close();
                    result = 3;
                    break;
                }
                else
                {
                    reader.Close();
                    result = 0;

                }

            }

            }
            catch (Exception ex)
            {
              
            }
            finally
            {
                
                Con.Close();
            }
            return result;
        }

        public DataTable Reader(string SQL)
        {
            DataTable dt = new DataTable();
            try
            {
                Con.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(SQL, Con);
                adapter.Fill(dt);

            }
            catch(Exception ex)
            {

            }
            finally
            {
                Con.Close();
            }
            return dt;
        }



    }
}