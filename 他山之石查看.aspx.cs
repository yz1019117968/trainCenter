using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class 他山之石查看 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string con;
        con = "Server=Lenovo-PC;Database=培训中心1;Trusted_Connection=SSPI";
        SqlConnection mycon = new SqlConnection(con);
        mycon.Open();
        string strselect = "select * from dbo.他山之石 where 标题='" + Session["mids"].ToString() + "'";
        SqlCommand sqlcmd = new SqlCommand(strselect, mycon);
        SqlDataReader dr = sqlcmd.ExecuteReader();
        if (dr.Read())
        {
            Label1.Text = dr["标题"].ToString();
            Label2.Text = "日期：" + dr["日期"].ToString();
            Label3.Text = dr["内容"].ToString();
            // Label5.Text = dr["文件路径"].ToString();
            string[] str = dr["文件路径"].ToString().Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < str.Length - 1; i++)
            {
                Label l1 = new Label();
                l1.Text = "   文件" + (i + 1).ToString() + "：";
                l1.Font.Name = "微软雅黑";
                Panel1.Controls.Add(l1);
                HyperLink h1 = new HyperLink();
                h1.Text = str[i];
                h1.NavigateUrl = "~/FILES/" + str[i];
                Panel1.Controls.Add(h1);

            }
        }
        dr.Close();
        mycon.Close();
    }
}