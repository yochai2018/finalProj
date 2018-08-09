using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BEL
{
  public  class Item
    {
        public string  Item_name { get; set; }
        public decimal Item_price { get; set; }
        public string  Item_image { get; set; }
        public string Item_description { get; set; }
        public int Category_code { get; set; }

        public Item(string item_name, decimal item_price, string item_image, string item_description, int category_code)
        {
            Item_name = item_name;
            Item_price = item_price;
            Item_image = item_image;
            Item_description = item_description;
            Category_code = category_code;
        }
    }
}
