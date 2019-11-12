using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class 下载中心 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
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
                    
                }
            }
        }
        else
        {
            Page.RegisterStartupScript("ss", "<script>alert('上传文件路径错误!')</script>");
        }
      string con;
        con = "Server=Lenovo-PC;Database=培训中心1;Trusted_Connection=SSPI";
        SqlConnection mycon = new SqlConnection(con);
        mycon.Open();
        string strselect = "insert into dbo.下载中心 (文件名,日期,文件路径) values ('" + TextBox1.Text + "','"
         + TextBox2.Text+ "','~/FILES/" + FileUpload1.FileName + "')";
        SqlCommand sqlcmd = new SqlCommand(strselect, mycon);
        sqlcmd.ExecuteNonQuery();
        mycon.Close();
        Page.RegisterStartupScript("ss", "<script>alert('文件成功上传!')</script>");
        
      
    }
    public void UpLoad(string path, System.Web.UI.WebControls.FileUpload fileupload)
    {
        bool fileOK = false;

        if (fileupload.HasFile)
        {
            string fileException = System.IO.Path.GetExtension(fileupload.FileName).ToLower();
            string[] allowedException = { ".docx", ".xlsx", ".xls", ".doc", ".mpp", ".rar", ".zip", ".vsd", ".txt", ".jpg", ".gif", ".bmp", ".png", ".swf", ".avi", ".mp3", ".rm", ".wma", ".wmv" };
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
    protected void Button2_Click(object sender, EventArgs e)
    {
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
        TextBox2.Text = y + "." + m + "." + d;
        Calendar1.Visible = false;
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            //获得编号信息
            string strids = GridView1.SelectedRow.Cells[0].Text;
            Response.Write("<script>alert(" + strids + ");</script>");
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
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "上传文件")
            MultiView1.ActiveViewIndex = 0;
        if (RadioButtonList1.SelectedValue == "查看文件")
        {
            MultiView1.ActiveViewIndex = 1;

        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("浏览信息平台.aspx");
    }
  
}