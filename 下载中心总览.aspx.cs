using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class 下载中心总览 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            //获得编号信息
            string strids = GridView1.SelectedRow.Cells[0].Text;
            //获取附件文件的保存路径
            string con;
            con = "Server=Lenovo-PC;Database=培训中心1;Trusted_Connection=SSPI";
            SqlConnection mycon = new SqlConnection(con);
            mycon.Open();
            string strpaths = "";
            SqlDataAdapter adsa = new SqlDataAdapter("select * from dbo.下载中心 where 编号='" + strids + "'", mycon);
            DataSet adds = new DataSet();
            adsa.Fill(adds);
            if (adds.Tables[0].Rows.Count > 0)
            {
                strpaths = adds.Tables[0].Rows[0][2].ToString();
            }
            mycon.Close();
            //执行下载文件的操作
            string FullPathURL = Server.MapPath(strpaths);
            //System.IO.FileInfo DownloadFile = new System.IO.FileInfo(FullPathURL);
            System.IO.FileInfo file = new System.IO.FileInfo(FullPathURL);

            if (file.Exists)
            {
                Response.Clear();
                //*修改前做法
                //Response.AddHeader("Content-Disposition", "attachment;filename=" + file.Name);

                //修改后做法
                Response.AddHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(file.Name));

                Response.AddHeader("Content-Length", file.Length.ToString());
                Response.ContentType = "application/application/octet-stream";
                Response.WriteFile(file.FullName);
                Response.End();
                Response.Flush();
                Response.Clear();
            }
            else
            {
                this.Page.RegisterStartupScript("ss", "<script>alert('文件不存在!')</script>");
            }
        }
        catch
        {
            this.Page.RegisterStartupScript("ss", "<script>alert('文件不存在!')</script>");
        }
    }
}