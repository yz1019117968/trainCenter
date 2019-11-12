using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class 他山之石修改 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string con;
            con = "Server=Lenovo-PC;Database=培训中心1;Trusted_Connection=SSPI";
            SqlConnection mycon = new SqlConnection(con);
            mycon.Open();
            string strselect = "select * from dbo.他山之石 where 编号='" + Session["mids"].ToString() + "'";
            SqlCommand sqlcmd = new SqlCommand(strselect, mycon);
            SqlDataReader dr = sqlcmd.ExecuteReader();
            if (dr.Read())
            {
                TextBox8.Text = dr["标题"].ToString();
               
                TextBox9.Text = dr["日期"].ToString();
                FreeTextBox3.Text = dr["内容"].ToString();
                Label12.Text = dr["文件路径"].ToString();
            }
            dr.Close();
            mycon.Close();
        } 
        string[] str = Label12.Text.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
        for (int i = 0; i < str.Length; i++)
        {

            HyperLink h1 = new HyperLink();
            // Response.Write("<br>");
            h1.Text = str[i];
            h1.NavigateUrl = "~/FILES/" + str[i];
            Panel1.Controls.Add(h1);

        }

    }
    protected void Button13_Click1(object sender, EventArgs e)
    {
        string FilePath = "";
        //是否有上传文件
        if (this.FileUpload3.FileName != null && this.FileUpload3.FileName != "")
        {
            if (FileUpload3.PostedFile.ContentLength <= 0)
            {
                Page.RegisterStartupScript("ss", "<script>alert('上传文件为空文件，请重新选择!')</script>");
            }
            else
            {
                if (FileUpload3.HasFile)
                {
                    if (FileUpload3.PostedFile.ContentLength > 4196304)//单位字节，大于4MB
                    {
                        Page.RegisterStartupScript("ss", "<script>alert('上传文件过大!')</script>");
                        return;
                    }
                    else
                    {
                        FilePath = Server.MapPath("~/FILES");
                        //获取图片保存路径信息
                        Session["FilePaths"] = "FILES\\" + FileUpload3.FileName;
                    }
                    UpLoad(FilePath, this.FileUpload3);
                    Page.RegisterStartupScript("ss", "<script>alert('文件成功上传!')</script>");
                }
            }
        }
        else
        {
            Page.RegisterStartupScript("ss", "<script>alert('上传文件路径错误!')</script>");
        }
        Label11.Text += FileUpload3.FileName + ",";
    }
    public void UpLoad(string path, System.Web.UI.WebControls.FileUpload fileupload)
    {
        bool fileOK = false;

        if (fileupload.HasFile)
        {
            string fileException = System.IO.Path.GetExtension(fileupload.FileName).ToLower();
            string[] allowedException = {".docx", ".xlsx", ".xls", ".doc", ".mpp", ".rar", ".zip", ".vsd", ".txt", ".jpg", ".gif", ".bmp", ".png", ".swf", ".avi", ".mp3", ".rm", ".wma", ".wmv" };
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
    protected void Button14_Click(object sender, EventArgs e)
    {
        string con;
        con = "Server=Lenovo-PC;Database=培训中心1;Trusted_Connection=SSPI";
        SqlConnection mycon = new SqlConnection(con);
        mycon.Open();
        if (Label11.Text == "")
        {
            string strselect = "UPDATE dbo.他山之石  SET 标题='" + TextBox8.Text
               + "',日期='" + TextBox9.Text
        + "',内容='" + FreeTextBox3.Text + "',文件路径='" + Label12.Text + " 'where 编号='"
        + Session["mids"].ToString() + "'";
            SqlCommand sqlcmd = new SqlCommand(strselect, mycon);
            sqlcmd.ExecuteNonQuery();
        }
        else
        {
            string strselect = "UPDATE dbo.他山之石  SET 标题='" + TextBox8.Text
                
                   + "',日期='" + TextBox9.Text
            + "',内容='" + FreeTextBox3.Text + "',文件路径='" + Label11.Text + " 'where 编号='"
            + Session["mids"].ToString() + "'";
            SqlCommand sqlcmd = new SqlCommand(strselect, mycon);
            sqlcmd.ExecuteNonQuery();
        }
        mycon.Close();
        Response.Redirect("浏览信息平台.aspx");
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Calendar3.Visible = true;
    }
    protected void Calendar3_SelectionChanged(object sender, EventArgs e)
    {
        int y; int m; int d;
        y = Calendar3.SelectedDate.Year;
        m = Calendar3.SelectedDate.Month;
        d = Calendar3.SelectedDate.Day;
        TextBox9.Text = y + "." + m + "." + d;
        Calendar3.Visible = false;
    }
}