using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class 后台back : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string[] str =Label4.Text.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
        for (int i = 0; i < str.Length; i++)
        {
             Label l1 = new Label();
             l1.Text = "  文件" + (i+1).ToString()+"：";
             l1.Font.Name = "微软雅黑";
             Panel1.Controls.Add(l1);
            HyperLink h1 = new HyperLink();
            h1.Text = str[i];
            h1.NavigateUrl = "~/FILES/" + str[i];
            Panel1.Controls.Add(h1);
            
        }
      
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "培训动态")        
            MultiView1.ActiveViewIndex = 0;
        if (RadioButtonList1.SelectedValue == "培训项目")
        {
            MultiView1.ActiveViewIndex = 1;
          
        }
        if (RadioButtonList1.SelectedValue == "他山之石")
        {
            MultiView1.ActiveViewIndex = 4;
          
        }
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string con;
        con = "Server=Lenovo-PC;Database=培训中心1;Trusted_Connection=SSPI";
        SqlConnection mycon = new SqlConnection(con);
        mycon.Open();
        string strselect = "insert into dbo.培训动态 (标题,内容,作者,日期,编辑,文件路径) values ('" + TextBox1.Text + "','"
        + FreeTextBox1.Text
         + "','" + TextBox2.Text
          + "','" + TextBox4.Text
    + "','" + TextBox3.Text
    + "','" + Label4.Text + "')";
        SqlCommand sqlcmd = new SqlCommand(strselect, mycon);
        sqlcmd.ExecuteNonQuery();
        mycon.Close();
        Label4.Text = "";
        Page.RegisterStartupScript("ss", "<script>alert('上传成功！')</script>");
        Response.Redirect("浏览信息平台.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string con;
        con = "Server=Lenovo-PC;Database=培训中心1;Trusted_Connection=SSPI";
        SqlConnection mycon = new SqlConnection(con);
        mycon.Open();
        string strselect = "insert into dbo.培训项目 (项目标题,项目负责人,项目信息,日期,文件路径) values ('" + TextBox5.Text + "','"
        + TextBox6.Text
         + "','" + FreeTextBox2.Text
          + "','" + TextBox7.Text+
          "','" + Label5.Text + "')";
        SqlCommand sqlcmd = new SqlCommand(strselect, mycon);
        sqlcmd.ExecuteNonQuery();
        mycon.Close();
        Label5.Text = "";
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
        TextBox4.Text = y + "." + m + "." + d;
        Calendar1.Visible = false;
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Calendar2.Visible = true;
    }

    protected void Calendar2_SelectionChanged(object sender, EventArgs e)
    {
        int y; int m; int d;
        y = Calendar2.SelectedDate.Year;
        m = Calendar2.SelectedDate.Month;
        d = Calendar2.SelectedDate.Day;
        TextBox7.Text = y + "." + m + "." + d;
        Calendar2.Visible = false;
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("浏览信息平台.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("浏览信息平台.aspx");
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        //string str = FreeTextBox1.Text;
        //Response.Redirect("预览界面.aspx?标题=" + TextBox1.Text + "&作者=" + TextBox2.Text + "&编辑=" + TextBox3.Text + "&日期=" + TextBox4.Text + "&内容=" +str + "&返回=发布信息.aspx");
        MultiView1.ActiveViewIndex = 2;
        Label1.Text = TextBox1.Text;
        Label2.Text = "作者：" +TextBox2.Text + "  编辑：" + TextBox3.Text + "  日期：" + TextBox4.Text;
        Label3.Text = FreeTextBox1.Text;
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        string con;
        con = "Server=Lenovo-PC;Database=培训中心1;Trusted_Connection=SSPI";
        SqlConnection mycon = new SqlConnection(con);
        mycon.Open();
        string strselect = "insert into dbo.培训动态 (标题,内容,作者,日期,编辑) values ('" + TextBox1.Text + "','"
        + FreeTextBox1.Text
         + "','" + TextBox2.Text
          + "','" + TextBox4.Text
    + "','" + TextBox3.Text + "')";
        SqlCommand sqlcmd = new SqlCommand(strselect, mycon);
        sqlcmd.ExecuteNonQuery();
        mycon.Close();
        Label4.Text = "";
        Response.Redirect("浏览信息平台.aspx");
    }
    protected void Button7_Click(object sender, EventArgs e)
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
    public void UpLoad(string path, System.Web.UI.WebControls.FileUpload fileupload)
    {
        bool fileOK = false;

        if (fileupload.HasFile)
        {
            string fileException = System.IO.Path.GetExtension(fileupload.FileName).ToLower();
            string[] allowedException = {".docx",".xlsx", ".xls", ".doc", ".mpp", ".rar", ".zip", ".vsd", ".txt", ".jpg", ".gif", ".bmp", ".png", ".swf", ".avi", ".mp3", ".rm", ".wma", ".wmv" };
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
    protected void Button9_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        string FilePath = "";
        //是否有上传文件
        if (this.FileUpload2.FileName != null && this.FileUpload2.FileName != "")
        {
            if (FileUpload2.PostedFile.ContentLength <= 0)
            {
                Page.RegisterStartupScript("ss", "<script>alert('上传文件为空文件，请重新选择!')</script>");
            }
            else
            {
                if (FileUpload2.HasFile)
                {
                    if (FileUpload2.PostedFile.ContentLength > 4196304)//单位字节，大于4MB
                    {
                        Page.RegisterStartupScript("ss", "<script>alert('上传文件过大!')</script>");
                        return;
                    }
                    else
                    {
                        FilePath = Server.MapPath("~/FILES");
                        //获取图片保存路径信息
                        Session["FilePaths"] = "FILES\\" + FileUpload2.FileName;
                    }
                    UpLoad(FilePath, this.FileUpload2);
                    Page.RegisterStartupScript("ss", "<script>alert('文件成功上传!')</script>");
                }
            }
        }
        else
        {
            Page.RegisterStartupScript("ss", "<script>alert('上传文件路径错误!')</script>");
        }
        Label5.Text += FileUpload2.FileName + ",";
       
    }
    protected void Button10_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 3;
        Label7.Text = TextBox5.Text;
        Label8.Text = "项目负责人：" + TextBox6.Text + "  日期：" + TextBox7.Text;
        Label9.Text = FreeTextBox2.Text;
    }
    protected void Button11_Click(object sender, EventArgs e)
    {
        string con;
        con = "Server=Lenovo-PC;Database=培训中心1;Trusted_Connection=SSPI";
        SqlConnection mycon = new SqlConnection(con);
        mycon.Open();
        string strselect = "insert into dbo.培训项目 (项目标题,项目负责人,项目信息,日期,文件路径) values ('" + TextBox5.Text + "','"
        + TextBox6.Text
         + "','" + FreeTextBox2.Text
          + "','" + TextBox7.Text +
          "','" + Label5.Text + "')";
        SqlCommand sqlcmd = new SqlCommand(strselect, mycon);
        sqlcmd.ExecuteNonQuery();
        mycon.Close();
        Label5.Text = "";
        Response.Redirect("浏览信息平台.aspx");
    }
    protected void Button12_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
    protected void Button13_Click(object sender, EventArgs e)
    {

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
                        Session["FilePaths"] = "FILES\\" + FileUpload2.FileName;
                    }
                    UpLoad(FilePath, this.FileUpload3);
                    Page.RegisterStartupScript("ss", "<script>alert('文件成功上传!')</script>");
                }
            }
        }
        else
        {
            throw new Exception("不支持此格式文件上传!");
        }
        Label11.Text += FileUpload3.FileName + ",";
    }
    protected void Button15_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 5;
        Label12.Text = TextBox8.Text;
        Label13.Text = TextBox9.Text;
        Label14.Text = FreeTextBox3.Text;
    }
    protected void Button17_Click(object sender, EventArgs e)
    {
        string con;
        con = "Server=Lenovo-PC;Database=培训中心1;Trusted_Connection=SSPI";
        SqlConnection mycon = new SqlConnection(con);
        mycon.Open();
        string strselect = "insert into dbo.他山之石 (标题,日期,内容,文件路径) values ('" + TextBox8.Text + "','"
        + TextBox9.Text + "','"
            + FreeTextBox3.Text+
          "','" + Label11.Text + "')";
        SqlCommand sqlcmd = new SqlCommand(strselect, mycon);
        sqlcmd.ExecuteNonQuery();
        mycon.Close();
        Label11.Text = "";
        Response.Redirect("浏览信息平台.aspx");
    }
    protected void Button14_Click(object sender, EventArgs e)
    {
        string con;
        con = "Server=Lenovo-PC;Database=培训中心1;Trusted_Connection=SSPI";
        SqlConnection mycon = new SqlConnection(con);
        mycon.Open();
        string strselect = "insert into dbo.他山之石 (标题,日期,内容,文件路径) values ('" + TextBox8.Text + "','"
        +TextBox9.Text+"','"
            + FreeTextBox3.Text +
          "','" + Label11.Text + "')";
        SqlCommand sqlcmd = new SqlCommand(strselect, mycon);
        sqlcmd.ExecuteNonQuery();
        mycon.Close();
        Label11.Text = "";
        Response.Redirect("浏览信息平台.aspx");
    }
    protected void Button18_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 4;
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

