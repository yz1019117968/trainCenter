using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mainweb : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("培训动态总览.aspx");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("培训项目总览.aspx");
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["mids"] = GridView1.SelectedRow.Cells[0].Text;
        Response.Redirect("培训项目查看.aspx");
    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["mids"] = GridView2.SelectedRow.Cells[0].Text;
        Response.Redirect("培训动态查看.aspx");
    }
}