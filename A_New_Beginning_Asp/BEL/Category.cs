using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BEL
{
    

   public class Category
    {
        public int Category_code { get; set; }
        public string Category_description { get; set; }



        /// <summary>
        ///  EnterCategory בנאי  לפרוצדורה 
        /// </summary>
        /// <param name="category_description"></param>
        public Category(string category_description)
        {
            Category_description = category_description;
        }

    }
}
