using BEL;
using BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DeleteItem : System.Web.UI.Page
{
    static private SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-3QS68FM\SQLEXPRESS;Initial Catalog=A_New_Beginning;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {     
        if (!IsPostBack)
        {
            MultiView1.ActiveViewIndex = 0;
        }
        Session.LCID = 1037;
    }



    protected void DeleteItems_Click(object sender, EventArgs e)
    {
        

        if(TxtItem.Text=="")
        {
            return;
        }
       
        Item deleteItem = Operations.DeleteItems(int.Parse(TxtItem.Text));

        if(deleteItem!= null)
        {
           
            LblItemName.Text = deleteItem.Item_name;
            LblItemPrice.Text = deleteItem.Item_price.ToString();
            LblDescriptionItem.Text = deleteItem.Item_description;
            LblCatgoryItem.Text = deleteItem.Category_code.ToString();
            MultiView1.ActiveViewIndex = 1;
        }
        else
        {
            lblNoItem.Text = "Item Code No Exsist";
            MultiView1.ActiveViewIndex = 2;
        }


        GridView1.DataBind();
    }

    protected void BcakHome2_Click(object sender, EventArgs e)
    {
        LblItemName.Text = "";
        LblItemPrice.Text = "";
        LblDescriptionItem.Text = "";
        LblCatgoryItem.Text = "";
       lblNoItem.Text = "";
        TxtItem.Text = "";
        MultiView1.ActiveViewIndex = 0;
    }
}