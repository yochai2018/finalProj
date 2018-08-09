using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BL;
using BEL;


public partial class _Default : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        Session.LCID = 1037;
        Label1.Text = System.DateTime.Now.ToString("T");
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        Label1.Text = System.DateTime.Now.ToString("T");

    }



    protected void btnSumbit_Click(object sender, EventArgs e)
    {


       Admin admin= Operations.AdminLogin(admin_id.Text, admin_password.Text);

        if (admin != null)
        {
            if (admin.Admin_id == admin_id.Text && admin.Admin_password == admin_password.Text)
            {
                Response.Redirect("HomePage.aspx");
            }
        }
        else
        {
            lblNoAdmin.Text = "Wrong Detailes!";
        }

    }
}