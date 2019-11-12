using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class 修改信息培训动态 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //TextBox5.Text = Session["mids"].ToString();
        if (!IsPostBack)
        {
            string con;
            con = "Server=Lenovo-PC;Database=培训中心1;Trusted_Connection=SSPI";
            SqlConnection mycon = new SqlConnection(con);
            mycon.Open();
            string strselect = "select * from dbo.培训项目 where 编号='" + Session["mids"].ToString() + "'";
            SqlCommand sqlcmd = new SqlCommand(strselect, mycon);
            SqlDataReader dr = sqlcmd.ExecuteReader();
            if (dr.Read())
            {
                TextBox5.Text = dr["项目标题"].ToString();
                TextBox6.Text = dr["项目负责人"].ToString();
                TextBox7.Text = dr["日期"].ToString();
                FreeTextBox1.Text = dr["项目信息"].ToString();
                Label5.Text = dr["文件路径"].ToString();
            }
            dr.Close();
            mycon.Close();
        } 
        string[] str = Label5.Text.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
        for (int i = 0; i < str.Length; i++)
        {

            HyperLink h1 = new HyperLink();
            // Response.Write("<br>");
            h1.Text = str[i];
            h1.NavigateUrl = "~/FILES/" + str[i];
            Panel1.Controls.Add(h1);

        }
        
        }
    protected void  Button3_Click(object sender, EventArgs e)
{
    string con;
    con = "Server=Lenovo-PC;Database=培训中心1;Trusted_Connection=SSPI";
    SqlConnection mycon = new SqlConnection(con);
    mycon.Open();
    if (Label4.Text == "")
    {
        string strselect = "UPDATE dbo.培训项目  SET 项目标题='" + TextBox5.Text
         + "',项目负责人='" + TextBox6.Text
           + "',日期='" + TextBox7.Text
    + "',项目信息='" + FreeTextBox1.Text + "',文件路径='" + Label5.Text + " 'where 编号='"
    + Session["mids"].ToString() + "'";
        SqlCommand sqlcmd = new SqlCommand(strselect, mycon);
        sqlcmd.ExecuteNonQuery();
    }
    else {
        string strselect = "UPDATE dbo.培训项目  SET 项目标题='" + TextBox5.Text
             + "',项目负责人='" + TextBox6.Text
               + "',日期='" + TextBox7.Text
        + "',项目信息='" + FreeTextBox1.Text + "',文件路径='" + Label4.Text + " 'where 编号='"
        + Session["mids"].ToString() + "'";
        SqlCommand sqlcmd = new SqlCommand(strselect, mycon);
        sqlcmd.ExecuteNonQuery();
    }
    mycon.Close();
    Response.Redirect("浏览信息平台.aspx");
}
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Calendar1.Visible = true;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        int y; int m; int d;
        y = Calendar1.SelectedDate.Year;
        m = Calendar1.SelectedDate.Month;
        d = Calendar1.SelectedDate.Day;
        TextBox7.Text = y + "." + m + "." + d;
        Calendar1.Visible = false;
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("浏览信息平台.aspx");
    }
    public void UpLoad(string path, System.Web.UI.WebControls.FileUpload fileupload)
    {
        bool fileOK = false;

        if (fileupload.HasFile)
        {
            string fileException = System.IO.Path.GetExtension(fileupload.FileName).ToLower();
            string[] allowedException = { ".xlsx", ".xls", ".doc", ".mpp", ".rar", ".zip", ".vsd", ".txt", ".jpg", ".gif", ".bmp", ".png", ".swf", ".avi", ".mp3", ".rm", ".wma", ".wmv" };
            for (int i = 0; i < allowedException.Length; i++)
            {
                if (fileException == allowedException[i])
                    fileOK = true;
            }
        }
        if (fileOK)
        {

            //判断文件是否存在,不存在则创建路径
            if (System.IO.Directory.Exists(path))
            {
                //该目录存在，则将上传的文件保存在该目录当中;     
            }
            else
            {
                System.IO.Directory.CreateDirectory(path);
            }

            fileupload.SaveAs(path + "\\" + fileupload.FileName);
        }
        else
        {
            throw new Exception("不支持此格式文件上传!");
        }

    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        string FilePath = "";
        //是否有上传文件
        if (this.FileUpload1.FileName != null && this.FileUpload1.FileName != "")
        {
            if (FileUpload1.PostedFile.ContentLength <= 0)
            {
                Page.RegisterStartupScript("ss", "<script>alert('上传文件为空文件，请重新选择!')</script>");
            }
            else
            {
                if (FileUpload1.HasFile)
                {
                    if (FileUpload1.PostedFile.ContentLength > 4196304)//单位字节，大于4MB
                    {
                        Page.RegisterStartupScript("ss", "<script>alert('上传文件过大!')</script>");
                        return;
                    }
                    else
                    {
                        FilePath = Server.MapPath("~/FILES");
                        //获取图片保存路径信息
                        Session["FilePaths"] = "FILES\\" + FileUpload1.FileName;
                    }
                    UpLoad(FilePath, this.FileUpload1);
                    Page.RegisterStartupScript("ss", "<script>alert('文件成功上传!')</script>");
                }
            }
        }
        else
        {
            Page.RegisterStartupScript("ss", "<script>alert('上传文件路径错误!')</script>");
        }
        Label4.Text += FileUpload1.FileName + ",";
    }
}
    
