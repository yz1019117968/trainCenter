<%@ Page Language="C#" AutoEventWireup="true" CodeFile="他山之石查看.aspx.cs" Inherits="他山之石查看" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
  
    <p align=center>
    <asp:Image ID="Image1" runat="server" ImageUrl="~/IMAGES/top1.jpg" 
            Width="80%" /></p><p align=center>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <asp:HyperLink ID="HyperLink2" runat="server" Font-Names="微软雅黑" 
                    NavigateUrl="~/zhuye.aspx" Font-Size="X-Large">首页>></asp:HyperLink>
                <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="微软雅黑" 
                    NavigateUrl="~/他山之石总览.aspx" Font-Size="X-Large">他山之石</asp:HyperLink></p>
    <div align=center>
    
        <table width="50%"  >
            <tr>
                <td align=center>
                    <asp:Label ID="Label1" runat="server" Font-Names="微软雅黑"></asp:Label>
                </td>
            </tr>
            <tr>
                <td  align=center class="style2">
                    <asp:Label ID="Label2" runat="server" Text=""  Font-Names="微软雅黑"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server"  Font-Names="微软雅黑" Width=100%></asp:Label>
                </td>
            </tr>
            <tr><td>
                <asp:Panel ID="Panel1" runat="server">
                </asp:Panel>
            </td></tr>
        </table>
    
    </div>
   
    </form>
</body>
</html>
