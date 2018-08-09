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

public partial class HomePage : System.Web.UI.Page
{
    static private SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-3QS68FM\SQLEXPRESS;Initial Catalog=A_New_Beginning;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MultiView1.ActiveViewIndex = 0;
            MultiView2.ActiveViewIndex = 0;
        }
        Session.LCID = 1037;
    }

    /// <summary>
    /// מתודה מכניסה קטגורייה לטבלה
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void EnterCategory_Click(object sender, EventArgs e)
    {
        

        if(TxtCat.Text=="")
        {
            return;
        }
        MultiView1.ActiveViewIndex = 1;
        string enterCategory = Operations.EnterCategory(TxtCat.Text);

        if (enterCategory == null)
        {
            LblNameCat.Text = "Category Exists";
        }
        else
        {
            LblNameCat.Text = TxtCat.Text;
        }
        GridView1.DataBind();
    }

    /// <summary>
    /// מתודה מחזירה לדף בית מדף הצגת קטגוריה שנקלטה
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void BcakHome_Click(object sender, EventArgs e)
    {
        TxtCat.Text = "";
        LblNameCat.Text = "";
        MultiView1.ActiveViewIndex = 0;

    }

    protected void EnterItem_Click(object sender, EventArgs e)
    {
        

        if (TxtItemName.Text=="" || TxtPrice.Text=="" || TxtPrice.Text==""  || TxtDescriptionItem.Text=="" || TxtCategoryItem.Text=="")
        {
            
            return;
        }
        MultiView2.ActiveViewIndex = 1;
        decimal parsedValue;
        if (!decimal.TryParse(TxtPrice.Text, out parsedValue))
        {
            return;
        }

        string enterItem = Operations.EnterItem(TxtItemName.Text,decimal.Parse( TxtPrice.Text), FileUploadImage.ToString(), TxtDescriptionItem.Text,int.Parse(TxtCategoryItem.Text));

        if(enterItem== null)
        {
            LblItemName.Text = "Item Exists";
            LblItemPrice.Text= "Item Exists";
            LblItemPrice.Text = "Item Exists";
            LblDescriptionItem.Text = "Item Exists";
            LblCatgoryItem.Text = "Item Exists";
        }
        else
        {

            LblItemName.Text = TxtItemName.Text;
            LblItemPrice.Text = TxtPrice.Text;
            LblItemPrice.Text = TxtPrice.Text;
            LblDescriptionItem.Text = TxtDescriptionItem.Text;
            LblCatgoryItem.Text = TxtCategoryItem.Text;
        }

    }

    protected void BcakHome2_Click(object sender, EventArgs e)
    {
        TxtItemName.Text = "";
        TxtPrice.Text = "";
        TxtDescriptionItem.Text = "";
        TxtCategoryItem.Text = "";

        LblItemName.Text = "";
        LblItemPrice.Text = "";
        LblItemPrice.Text = "";
        LblDescriptionItem.Text = "";
        LblCatgoryItem.Text = "";
        MultiView2.ActiveViewIndex = 0;
    }


}