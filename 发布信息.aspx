<%@ Page Language="C#" AutoEventWireup="true" CodeFile="发布信息.aspx.cs" Inherits="后台back" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1 {
            width: 100%;
            border-collapse: collapse;
            border: 2px solid #000000;
        }
    
html * { 
-moz-box-sizing: border-box; 
box-sizing: border-box; 
} 

        .style3
        {
            height: 24px;
        }
        .style4
        {
            height: 24px;
            width: 206px;
        }
        .style5
        {
            width: 206px;
        }

        .style6
        {
            width: 206px;
            height: 34px;
        }
        .style7
        {
            height: 34px;
        }
        .style8
        {
            height: 32px;
        }

        .style9
        {
            width: 100%;
        }

    </style>
</head>
<body background="IMAGES/00558PIC3t8_1024.jpg">
    <form id="form1" runat="server">
    <div align=center>
    <font size="6" face="黑体">信息发布</font>
    </div>
    <div align=left>
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
            Font-Italic="False" Font-Names="微軟正黑體 Light" Font-Overline="False" 
            Font-Size="X-Large" Font-Strikeout="False" Font-Underline="True" 
            NavigateUrl="~/浏览信息平台.aspx">浏览信息</asp:HyperLink>
        <asp:Image ID="Image1" runat="server" Height="25px" ImageUrl="~/IMAGES/图标.jpg" 
            Width="29px" />
        &nbsp
        <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" 
            Font-Names="微軟正黑體 Light" Font-Size="X-Large" Font-Underline="True" 
            NavigateUrl="~/发布信息.aspx">发布信息</asp:HyperLink> <asp:Image ID="Image2" runat="server" Height="25px" ImageUrl="~/IMAGES/图标.jpg" 
            Width="29px" />
    </div>
    <p align=center><asp:RadioButtonList ID="RadioButtonList1" runat="server" 
        RepeatDirection="Horizontal" AutoPostBack="True" 
            onselectedindexchanged="RadioButtonList1_SelectedIndexChanged">
        <asp:ListItem>培训项目</asp:ListItem>
        <asp:ListItem>培训动态</asp:ListItem>
        <asp:ListItem>他山之石</asp:ListItem>
    </asp:RadioButtonList></p>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <table class="style1">
                <tr>
                    <td>
                        请输入信息：</td>
                    <td>
                        培训动态>></td>
                </tr>
                <tr>
                    <td>
                        标题名称：</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        内容：</td>
                    <td><ftb:freetextbox id="FreeTextBox1" runat="server" imagegallerypath="~/saveimages/" 
                                    imagegalleryurl="ftb.imagegallery.aspx?rif={0}&cif={0}" language="zh-CN" 
                                    pastemode="Default" readonly="False"
                                  
                                    toolbarlayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu|Bold,Italic,Underline,Strikethrough;Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertRule|Cut,Copy,Paste;Undo,Redo,Print,InsertImageFromGallery,Preview" 
                                    Width="800px" Height="400px">        </ftb:freetextbox>

                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        作者：</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        编辑：</td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        日期：</td>
                    <td>
                        
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="21px" 
                            ImageUrl="~/IMAGES/日历.jpg" onclick="ImageButton1_Click" Width="26px" />
                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
                            BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" 
                            DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" 
                            ForeColor="#003399" Height="200px" 
                            onselectionchanged="Calendar1_SelectionChanged" Visible="False" Width="220px">
                            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" 
                                Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                            <WeekendDayStyle BackColor="#CCCCFF" />
                        </asp:Calendar>
                        
                    </td>
                    
                </tr> <tr>
                    <td class="style8">上传文件：
                        </td>
                    <td class="style8">
                        
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <asp:Button ID="Button7" runat="server" Text="上传" onclick="Button7_Click" />
                      
                        <asp:Label ID="Label4" runat="server" Visible="False"></asp:Label>
                      
                    </td>
                </tr><tr>
                    <td class="style8">
                       </td>
                    <td class="style8">
                        <asp:Button ID="Button1" runat="server" Text="确定" onclick="Button1_Click" />
                        &nbsp<asp:Button 
                            ID="Button5" runat="server" Text="预览" onclick="Button5_Click" />
&nbsp;<asp:Button ID="Button2" runat="server" Text="取消" onclick="Button2_Click" />
                    </td>
                    
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table class="style1">
                <tr>
                    <td class="style4">
                        请输入信息：</td>
                    <td class="style3">
                        培训项目&gt;&gt;</td>
                </tr>
                <tr>
                    <td class="style5">
                        项目标题：</td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        项目负责人：</td>
                    <td>
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        项目信息：</td>
                    <td><FTB:FreeTextBox id="FreeTextBox2" runat="server" Height="400px" 
                            Width="800px" imagegallerypath="~/saveimages/" 
                            imagegalleryurl="ftb.imagegallery.aspx?rif={0}&amp;cif={0}" language="zh-CN" 
                            pastemode="Default" readonly="False" 
                            toolbarlayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu|Bold,Italic,Underline,Strikethrough;Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertRule|Cut,Copy,Paste;Undo,Redo,Print,InsertImageFromGallery,Preview" />
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style4">
                        项目日期：</td>
                    <td class="style3">
                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                        <asp:ImageButton ID="ImageButton2" runat="server" Height="20px" 
                            ImageUrl="~/IMAGES/日历.jpg" onclick="ImageButton2_Click" Width="24px" />
                        <asp:Calendar ID="Calendar2" runat="server" BackColor="White" 
                            BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" 
                            DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" 
                            ForeColor="#003399" Height="200px" 
                            onselectionchanged="Calendar2_SelectionChanged" Width="220px" 
                            Visible="False">
                            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" 
                                Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                            <WeekendDayStyle BackColor="#CCCCFF" />
                        </asp:Calendar>
                    </td>
                </tr>
                 <tr>
                    <td class="style5">
                        上传文件：</td>
                    <td>
                        <asp:FileUpload ID="FileUpload2" runat="server" />
                        <asp:Button ID="Button8" runat="server"
                            Text="上传" onclick="Button8_Click" /><asp:Label ID="Label6" runat="server" Text="已上传的文件："></asp:Label>
                        <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td class="style7">
                        <asp:Button ID="Button3" runat="server" Text="确认" onclick="Button3_Click" />&nbsp<asp:Button 
                            ID="Button10" runat="server" Text="预览" onclick="Button10_Click"  />&nbsp
                        <asp:Button ID="Button4" runat="server" Text="取消" onclick="Button4_Click" />
                    </td>
                </tr>
               
            </table>
        </asp:View>
        <asp:View ID="View3" runat="server">

            <table class="style9">
                <tr>
                    <td align=center>
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align=center>
                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align=center>
                        <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td align=center>
                        <asp:Panel ID="Panel1" runat="server">
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td align=center>
                        <asp:Button ID="Button6" runat="server" Text="确定发表" onclick="Button6_Click" />&nbsp
                        <asp:Button ID="Button9" runat="server" Text="取    消" onclick="Button9_Click" />
                    </td>
                </tr>
            </table>

        </asp:View>
        <asp:View ID="View4" runat="server">
        <table class="style9">
                <tr>
                    <td align=center>
                        <asp:Label ID="Label7" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align=center>
                        <asp:Label ID="Label8" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align=center>
                        <asp:Label ID="Label9" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td align=center>
                        <asp:Panel ID="Panel2" runat="server">
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td align=center>
                        <asp:Button ID="Button11" runat="server" Text="确定发表" onclick="Button11_Click" />&nbsp
                        <asp:Button ID="Button12" runat="server" Text="取    消" 
                            onclick="Button12_Click" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View5" runat="server">

            <table class="style9">
                <tr>
                    <td>
                        请输入信息：</td>
                    <td>
                        他山之石&gt;&gt;</td>
                </tr>
                <tr>
                    <td>
                        标题：</td>
                    <td>
                        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        内容：</td>
                    <td>
                        <FTB:FreeTextBox id="FreeTextBox3" runat="server" Height="400px" 
                            Width="800px" imagegallerypath="~/saveimages/" 
                            imagegalleryurl="ftb.imagegallery.aspx?rif={0}&amp;cif={0}" language="zh-CN" 
                            pastemode="Default" readonly="False" 
                            toolbarlayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu|Bold,Italic,Underline,Strikethrough;Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertRule|Cut,Copy,Paste;Undo,Redo,Print,InsertImageFromGallery,Preview" /></td>
                </tr>
                <tr><td>日期：</td>
                <td>
                    <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                    <asp:ImageButton ID="ImageButton3" runat="server" Height="21px" 
                            ImageUrl="~/IMAGES/日历.jpg"  Width="26px" 
                        onclick="ImageButton3_Click" /><asp:Calendar ID="Calendar3" runat="server" 
                        BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" 
                        DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" 
                        ForeColor="#003399" Height="200px" 
                        onselectionchanged="Calendar3_SelectionChanged" Visible="False" Width="220px">
                            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" 
                                Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                            <WeekendDayStyle BackColor="#CCCCFF" />
                            </asp:Calendar>
                    </td></tr>
                <tr>
                    <td>
                        上传文件：</td>
                    <td>
                        <asp:FileUpload ID="FileUpload3" runat="server" />
                        <asp:Button ID="Button13" runat="server"
                            Text="上传" onclick="Button13_Click1"  /><asp:Label ID="Label10" runat="server" Text="已上传的文件："></asp:Label>
                        <asp:Label ID="Label11" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="Button14" runat="server" Text="确认" onclick="Button14_Click" />
                        &nbsp;<asp:Button ID="Button15" runat="server" 
                            Text="预览" onclick="Button15_Click" />
                        &nbsp;
                        <asp:Button ID="Button16" runat="server"  Text="取消" />
                    </td>
                </tr>
            </table>

        </asp:View>
        <asp:View ID="View6" runat="server">

            <table class="style9">
                <tr>
                    <td align="center">
                        <asp:Label ID="Label12" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Label ID="Label13" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Label ID="Label14" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Panel ID="Panel3" runat="server">
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Button ID="Button17" runat="server"  Text="确定发表" 
                            onclick="Button17_Click" />
                        &nbsp;
                        <asp:Button ID="Button18" runat="server"  
                            Text="取    消" onclick="Button18_Click" />
                    </td>
                </tr>
            </table>

        </asp:View>
    </asp:MultiView>
    </form>
</body>
</html>
