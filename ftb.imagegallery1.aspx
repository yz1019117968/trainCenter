<%@ Page Language="C#" ValidateRequest=false Trace="false" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<%@ Import Namespace="System.IO" %> 
<script runat="server">
protected void Page_Load(Object Src, EventArgs E) {
    if (!IsPostBack)
        ImageGallery1.CurrentImagesFolder = "~/rollnewsimages";
    
	// *** remove this return statement to use the following code ***
	return;

    string currentFolder = ImageGallery1.CurrentImagesFolder;
	
	// modify the directories allowed
    if (currentFolder == "~/images")
    {

		// these are the default directories FTB:ImageGallery will find
		string[] defaultDirectories = System.IO.Directory.GetDirectories(Server.MapPath(currentFolder),"*");
		
		// user defined custom directories
		string[] customDirectories = new string[] {"folder1","folder2"};
		
		// the gallery will use these images in this instance
		ImageGallery1.CurrentDirectories = customDirectories;
	}
	
	
	// modify the images allowed
    if (currentFolder == "~/images")
    {

		System.IO.DirectoryInfo directoryInfo = new System.IO.DirectoryInfo(Server.MapPath(currentFolder));

		// these are the default images FTB:ImageGallery will find
		System.IO.FileInfo[] defaultImages = directoryInfo.GetFiles("*");
		
		// user defined custom images (here, we're just allowing the first two)
		System.IO.FileInfo[] customImages = new System.IO.FileInfo[2] {defaultImages[0], defaultImages[1]};
		
		// the gallery will use these images in this instance
		ImageGallery1.CurrentImages = customImages;
	}	
	
}
protected override void Render(HtmlTextWriter writer)
{
    writer.Write(this.ChineseGallery());
}
private string ChineseGallery()
{
    StringWriter writer = new StringWriter(); //提供一个可以写的文本区域 
    HtmlTextWriter buffer = new HtmlTextWriter(writer); //让htmlWriter操作这个区域，我们就可以获得这个区域里的内容 
    base.Render(buffer); //先让页面画一遍，让我们得到初始的页面html代码 
    string html = writer.ToString(); //找到这段代码，我们来处理它，把英文变成汉字 
    // 
    html = html.Replace("There are no images:", "现在还没有图片");
    html = html.Replace("Upload File", "上传图片");
    html = html.Replace("Status</div>", "状态</div>");
    html = html.Replace("Selected Image", "选中的图片");
    html = html.Replace("Create Folder", "创建目录");
    html = html.Replace("Delete Image", "删除该图片");
    html = html.Replace("/Upload/", "'上传'");
    html = html.Replace("<legend>Preview", "<legend>预览图片");
    html = html.Replace("<legend>Dimensions", "<legend>设置显示尺寸");
    html = html.Replace("Original Size", "原图大小");
    html = html.Replace("Custom Size", "设置为");
    html = html.Replace("Lock image ratio", "锁定尺寸比例");
    html = html.Replace("Percentage", "百分比");
    html = html.Replace("Image Gallery", "我的像册");
    html = html.Replace("<legend>Properties", "<legend>图片属性");
    html = html.Replace("Align", "横向排列");
    html = html.Replace("Border", "边框");
    html = html.Replace("VSpace", "左边距");
    html = html.Replace("HSpace", "上边距");
    html = html.Replace("Alt", "转换文字");
    html = html.Replace("Title", "图片标题");
    html = html.Replace("Insert", "不可用");
    // 
    return html;
} 
</script>
<html>
<head>
	<title>Image Gallery</title>
</head>
<body>
    <asp:Label ID="Label1" runat="server" Text="修改顶图时，请给图片重命名为“数字.jpg”，例如：“1.jpg”；如需修改，请务必添加5组,否则会出现孔图案片！" Visible="true"></asp:Label>
    <br>
    <asp:Label ID="Label2" runat="server" Text="请勿点击左边的“up”！" Font-Bold="True" ForeColor="Red"></asp:Label>
    <form id="Form1" runat="server" enctype="multipart/form-data">  
    
		<FTB:ImageGallery id="ImageGallery1" 
			JavaScriptLocation="ExternalFile" 
			UtilityImagesLocation="ExternalFile" 
			SupportFolder="~/aspnet_client/FreeTextBox/"
			AllowImageDelete=true AllowImageUpload=true AllowDirectoryCreate=true AllowDirectoryDelete=true runat="Server" />
		
	</form>

</body>
</html>
