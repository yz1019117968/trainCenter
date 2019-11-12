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
    StringWriter writer = new StringWriter(); //�ṩһ������д���ı����� 
    HtmlTextWriter buffer = new HtmlTextWriter(writer); //��htmlWriter��������������ǾͿ��Ի���������������� 
    base.Render(buffer); //����ҳ�滭һ�飬�����ǵõ���ʼ��ҳ��html���� 
    string html = writer.ToString(); //�ҵ���δ��룬����������������Ӣ�ı�ɺ��� 
    // 
    html = html.Replace("There are no images:", "���ڻ�û��ͼƬ");
    html = html.Replace("Upload File", "�ϴ�ͼƬ");
    html = html.Replace("Status</div>", "״̬</div>");
    html = html.Replace("Selected Image", "ѡ�е�ͼƬ");
    html = html.Replace("Create Folder", "����Ŀ¼");
    html = html.Replace("Delete Image", "ɾ����ͼƬ");
    html = html.Replace("/Upload/", "'�ϴ�'");
    html = html.Replace("<legend>Preview", "<legend>Ԥ��ͼƬ");
    html = html.Replace("<legend>Dimensions", "<legend>������ʾ�ߴ�");
    html = html.Replace("Original Size", "ԭͼ��С");
    html = html.Replace("Custom Size", "����Ϊ");
    html = html.Replace("Lock image ratio", "�����ߴ����");
    html = html.Replace("Percentage", "�ٷֱ�");
    html = html.Replace("Image Gallery", "�ҵ����");
    html = html.Replace("<legend>Properties", "<legend>ͼƬ����");
    html = html.Replace("Align", "��������");
    html = html.Replace("Border", "�߿�");
    html = html.Replace("VSpace", "��߾�");
    html = html.Replace("HSpace", "�ϱ߾�");
    html = html.Replace("Alt", "ת������");
    html = html.Replace("Title", "ͼƬ����");
    html = html.Replace("Insert", "������");
    // 
    return html;
} 
</script>
<html>
<head>
	<title>Image Gallery</title>
</head>
<body>
    <asp:Label ID="Label1" runat="server" Text="�޸Ķ�ͼʱ�����ͼƬ������Ϊ������.jpg�������磺��1.jpg���������޸ģ���������5��,�������ֿ�ͼ��Ƭ��" Visible="true"></asp:Label>
    <br>
    <asp:Label ID="Label2" runat="server" Text="��������ߵġ�up����" Font-Bold="True" ForeColor="Red"></asp:Label>
    <form id="Form1" runat="server" enctype="multipart/form-data">  
    
		<FTB:ImageGallery id="ImageGallery1" 
			JavaScriptLocation="ExternalFile" 
			UtilityImagesLocation="ExternalFile" 
			SupportFolder="~/aspnet_client/FreeTextBox/"
			AllowImageDelete=true AllowImageUpload=true AllowDirectoryCreate=true AllowDirectoryDelete=true runat="Server" />
		
	</form>

</body>
</html>
