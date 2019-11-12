<%@ Page Language="C#" AutoEventWireup="true" CodeFile="登陆新.aspx.cs" Inherits="登陆新" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <style type="text/css">
        .style1
        {
            width: 392px;
        }
        .style2
        {
            width: 740px;
        }
        .style3
        {
            width: 1142px;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
    <div align=center>
    
        <table >
            <tr>
                <td class="style3">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/IMAGES/top_副本.jpg" 
                        Width="100%" /><br><br><br><br>
                </td>
            </tr>
            <tr>
                <td class="style3">
                   <p> 
                  <table><tr><td align=left class="style2">
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/IMAGES/济南大学.jpg" /> &nbsp&nbsp&nbsp
                    </td><td align=right class="style1">
                    <p align=center>
                        <asp:Label ID="Label3" runat="server" Text="后台登陆" Font-Names="微软雅黑" 
                            Font-Size="XX-Large" Font-Bold="True"></asp:Label></p><br>
                    <asp:Image ID="Image2" runat="server" Height="33px" ImageUrl="~/IMAGES/用户名.jpg" 
                        Width="36px" />
                    <asp:Label ID="Label1" runat="server" Text="用户名：" Font-Names="微软雅黑" 
                        Font-Size="XX-Large"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" Height="33px" Width="188px" 
                              Font-Size="X-Large"></asp:TextBox><p>
                    <asp:Image ID="Image3" runat="server" Height="33px" ImageUrl="~/IMAGES/密码.jpg" 
                        Width="36px" />
                    <asp:Label ID="Label2" runat="server" Text="密&amp;nbsp&amp;nbsp&amp;nbsp码：" Font-Names="微软雅黑" 
                        Font-Size="XX-Large"></asp:Label>
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Height="33px" Width="188px" 
                                  Font-Size="X-Large"></asp:TextBox></p>
                        <asp:Button ID="Button1" runat="server" Text="登陆" Font-Names="微软雅黑" 
                              Font-Size="X-Large" Height="47px" Width="117px" Font-Bold="True" 
                              onclick="Button1_Click" />&nbsp&nbsp<asp:Button ID="Button2"
                            runat="server" Text="取消" Font-Names="微软雅黑" Font-Size="X-Large" Height="47px" 
                              Width="117px" Font-Bold="True" onclick="Button2_Click" /></td></tr></table>
                </td>
            </tr>
            <tr>
                <td class="style3">
                </td></p>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
