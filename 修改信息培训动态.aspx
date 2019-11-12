<%@ Page Language="C#" AutoEventWireup="true" CodeFile="修改信息培训动态.aspx.cs" Inherits="修改信息培训动态" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            height: 33px;
        }
    </style>
</head>
<body background="IMAGES/00558PIC3t8_1024.jpg">
    <form id="form1" runat="server">
    <p align=center> <font size="6" face="黑体" >更改培训动态</font></p>
    <div>
    <table class="style1">
                <tr>
                    <td>
                        请输入信息：</td>
                    <td class="style1">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        标题名称：</td>
                    <td class="style1">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        内容：</td>
                    <td class="style1">
                        <FTB:FreeTextBox ID="FreeTextBox1" runat="server" Height="400px" 
                            imagegallerypath="~/saveimages/" 
                            imagegalleryurl="ftb.imagegallery.aspx?rif={0}&amp;cif={0}" language="zh-CN" 
                            pastemode="Default" readonly="False" 
                            toolbarlayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu|Bold,Italic,Underline,Strikethrough;Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertRule|Cut,Copy,Paste;Undo,Redo,Print,InsertImageFromGallery,Preview" 
                            Width="800px">
                        </FTB:FreeTextBox>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        作者：</td>
                    <td class="style1">
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        编辑：</td>
                    <td class="style1">
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        日期：</td>
                    <td class="style1">
                        
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="20px" 
                            ImageUrl="~/IMAGES/日历.jpg" onclick="ImageButton1_Click" Width="24px" />
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
                    
                </tr>
                 <tr>
                    <td>
                        上传文件：</td>
                    <td class="style1">
                        <asp:Label ID="Label1" runat="server" Text="下面超链接为已上传文件，如需更改，请重新上传所有需要的文件！" ForeColor="Red"></asp:Label>
                        <asp:Panel ID="Panel1" runat="server">
                        </asp:Panel>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <asp:Button ID="Button3" runat="server"
                            Text="上传" onclick="Button3_Click" /><asp:Label ID="Label2" runat="server" Text="重新上传的文件："></asp:Label>
                        <asp:Label ID="Label4" runat="server"></asp:Label>
                        <asp:Label ID="Label5" runat="server" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                       </td>
                    <td class="style1">
                        <asp:Button ID="Button1" runat="server" Text="确定" onclick="Button1_Click" />&nbsp
                        <asp:Button ID="Button2" runat="server" Text="取消" onclick="Button2_Click" />
                    </td>
                    
                </tr>
            </table>
    </div>
    </form>
</body>
</html>
