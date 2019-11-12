using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 登陆新 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "guanliyuan" && TextBox2.Text == "jndxsxypxzx")
        {
            Response.Redirect("浏览信息平台.aspx");
        }
        else {
            Page.RegisterStartupScript("ss", "<script>alert('用户名或密码错误！')</script>");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("zhuye.aspx");
    }
}