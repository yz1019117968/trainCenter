using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.Sql;
using System.Data.SqlClient;
public partial class 浏览信息平台 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "培训动态")
           MultiView1.ActiveViewIndex = 0;            
        if (RadioButtonList1.SelectedValue == "培训项目")
            MultiView1.ActiveViewIndex = 1;
        if (RadioButtonList1.SelectedValue == "他山之石")
            MultiView1.ActiveViewIndex = 2;
    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["mids"] = GridView2.SelectedRow.Cells[0].Text;
        Response.Redirect("修改信息培训动态.aspx");
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["mids"] = GridView1.SelectedRow.Cells[0].Text;
        Response.Redirect("修改信息培训项目.aspx");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("发布信息.aspx");
    }
    protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["mids"] = GridView3.SelectedRow.Cells[0].Text;
        Response.Redirect("修改信息他山之石.aspx");
    }
}