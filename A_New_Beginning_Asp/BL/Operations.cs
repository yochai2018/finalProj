using BEL;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Operations
    {

        public static Admin AdminLogin(string admin_id, string admin_password)
        {
            return DbConnection.AdminLogin(admin_id, admin_password);
        }


        static public string EnterCategory(string category_description)
        {
            return DbConnection.EnterCategory(category_description);
        }


        static public string EnterItem(string item_name, decimal item_price, string item_image, string item_description, int category_code)
        {
            return DbConnection.EnterItem(item_name, item_price, item_image, item_description, category_code);
        }


        static public Item DeleteItems(int item_code)
        {
            return DbConnection.DeleteItems(item_code);
        }
    }
}
