<%@ Page Language="C#" AutoEventWireup="true" CodeFile="修改信息他山之石.aspx.cs" Inherits="他山之石修改" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body background="IMAGES/00558PIC3t8_1024.jpg">
    <form id="form1" runat="server">
     <p align=center> <font size="6" face="黑体" >更改他山之石</font></p>
    <div>
    <table>
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
                    <td><asp:Label ID="Label1" runat="server" Text="下面超链接为已上传文件，如需更改，请重新上传所有需要的文件！" ForeColor="Red"></asp:Label>
                        <asp:Panel ID="Panel1" runat="server">
                        </asp:Panel>
                        <asp:FileUpload ID="FileUpload3" runat="server" />
                        <asp:Button ID="Button13" runat="server"
                            Text="上传" onclick="Button13_Click1"  /><asp:Label ID="Label10" runat="server" Text="已上传的文件："></asp:Label>
                        <asp:Label ID="Label11" runat="server" Text=""></asp:Label>
                        <asp:Label ID="Label12" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="Button14" runat="server" Text="确认" onclick="Button14_Click" />
                        &nbsp;<asp:Button ID="Button15" runat="server" 
                            Text="预览"  />
                        &nbsp;
                        <asp:Button ID="Button16" runat="server"  Text="取消" />
                    </td>
                </tr>
            </table>
    </div>
    </form>
</body>
</html>
