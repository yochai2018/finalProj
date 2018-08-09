using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BEL
{
    public class Admin
    {
        public string Admin_id { get; set; }
        public string Admin_first_name { get; set; }
        public string Admin_last_name { get; set; }
        public string Admin_password { get; set; }

        /// <summary>
        /// בנאי מחלקת אדמין ללא מפתחות זרים
        /// </summary>
        /// <param name="admin_id"></param>
        /// <param name="admin_first_name"></param>
        /// <param name="admin_last_name"></param>
        /// <param name="admin_password"></param>
        public Admin(string admin_id, string admin_first_name, string admin_last_name, string admin_password)
        {
            Admin_id = admin_id;
            Admin_first_name = admin_first_name;
            Admin_last_name = admin_last_name;
            Admin_password = admin_password;
        }
    }
}
