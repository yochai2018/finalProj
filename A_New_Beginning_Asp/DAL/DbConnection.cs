using BEL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace DAL
{
    public class DbConnection
    {
        static private SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-3QS68FM\SQLEXPRESS;Initial Catalog=A_New_Beginning;Integrated Security=True");

        static public Admin AdminLogin(string admin_id, string admin_password)
        {
            SqlDataReader sdr = null;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "AdminLogin";
                cmd.Parameters.Clear();
                cmd.Parameters.Add(new SqlParameter("@admin_id", admin_id));
                cmd.Parameters.Add(new SqlParameter("@admin_password", admin_password));
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                sdr = cmd.ExecuteReader();

                if (sdr.Read())
                {
                    Admin administrator = new Admin(sdr["Admin_id"].ToString(), sdr["Admin_first_name"].ToString(), sdr["Admin_last_name"].ToString(), sdr["Admin_password"].ToString());
                    return administrator;

                }


            }
            catch (Exception t)
            {

                Console.WriteLine(t.ToString());
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    sdr.Close();
                    con.Close();
                }
            }

            return null;
        }


        static public string EnterCategory(string category_description)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "EnterCategory";
                cmd.Parameters.Clear();
                cmd.Parameters.Add(new SqlParameter("@category_description", category_description));
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                int rows = cmd.ExecuteNonQuery();

                if (rows <= 0)
                {
                    return null;
                }
                else
                {
                    return "good";
                }


            }
            catch (Exception t)
            {

                Console.WriteLine(t.ToString());
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
            return null;
        }


        static public string EnterItem(string item_name, decimal item_price, string item_image, string item_description, int category_code)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "EnterItem";
                cmd.Parameters.Clear();
                cmd.Parameters.Add(new SqlParameter("@item_name", item_name.ToString()));
                cmd.Parameters.Add(new SqlParameter("@item_price", item_price));
                cmd.Parameters.Add(new SqlParameter("@item_image", item_image.ToString()));
                cmd.Parameters.Add(new SqlParameter("@item_description", item_description.ToString()));
                cmd.Parameters.Add(new SqlParameter("@category_code", category_code));

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                int rows = cmd.ExecuteNonQuery();

                if (rows <= 0)
                {
                    return null;
                }
                else
                {
                    return "good";
                }


            }
            catch (Exception t)
            {

                Console.WriteLine(t.ToString());
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
            return null;

        }



        static public Item DeleteItems(int item_code)
        {
            Item item;
            SqlDataReader sdr = null;
            SqlCommand cmd = new SqlCommand();

            try
            {

                cmd.Connection = con;

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "DeleteItems";
                cmd.Parameters.Clear();
                cmd.Parameters.Add(new SqlParameter("@item_code", item_code.ToString()));
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }




                SqlCommand SqlCommand = new SqlCommand("SELECT * FROM  Items WHERE item_code="+item_code, con);
                sdr = SqlCommand.ExecuteReader();


             
                        while (sdr.Read())
                        {
                          
                                item = new Item(sdr["item_name"].ToString(), decimal.Parse(sdr["item_price"].ToString()), sdr["item_image"].ToString(), sdr["item_description"].ToString(), int.Parse(sdr["Category_code"].ToString()));
                                return item;
                            
                            
                        }

            }
            catch (Exception t)
            {

                Console.WriteLine(t.ToString());
            }
            finally
            {
                sdr.Close();
                int rows = cmd.ExecuteNonQuery();

                if (con.State == ConnectionState.Open)
                {

                    con.Close();
                }
            }
            return null;
        }

    }
}

