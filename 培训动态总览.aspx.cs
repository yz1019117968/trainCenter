using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 培训动态总览 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        Session["mids"] = GridView1.SelectedRow.Cells[0].Text;
       Response.Redirect("培训动态查看.aspx");
    }
}