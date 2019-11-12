<%@ Page Language="C#" AutoEventWireup="true" CodeFile="培训动态总览.aspx.cs" Inherits="培训动态总览" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div align=center>
    <table><tr><td align=center>
    
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <asp:Image ID="Image1" runat="server" ImageUrl="~/IMAGES/top1.jpg" 
            Width="100%" /></td></tr><tr><td align=left>
                <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="微软雅黑" 
                    Font-Size="X-Large" NavigateUrl="~/zhuye.aspx">首页>></asp:HyperLink>
                <asp:Label ID="Label2" runat="server" Text="培训动态>>" Font-Names="微软雅黑" 
                    Font-Size="X-Large"></asp:Label></td></tr><tr><td align=center>
            <p>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="编号" 
                    DataSourceID="SqlDataSource1" GridLines="Horizontal" Height="585px" 
                    PageSize="25" Width="1102px" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="标题" HeaderText="标题" SortExpression="标题">
                        <ControlStyle Height="20px" />
                        <FooterStyle Height="20px" />
                        <HeaderStyle Height="20px" HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="900px" Height="20px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="日期" HeaderText="日期" SortExpression="日期">
                        <HeaderStyle HorizontalAlign="Center" Height="20px" />
                        <ItemStyle HorizontalAlign="Center" Height="20px" />
                        </asp:BoundField>
                        <asp:CommandField HeaderText="查看" SelectText="查看" ShowSelectButton="True" >
                        <HeaderStyle Height="20px" />
                        <ItemStyle Height="20px" />
                        </asp:CommandField>
                    </Columns>
                    <EmptyDataRowStyle Height="20px" />
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" Height="20px" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" 
                        Height="20px" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:培训中心1ConnectionString5 %>" 
                    SelectCommand="SELECT [标题], [日期], [编号] FROM [培训动态] ORDER BY [编号] DESC">
                </asp:SqlDataSource>
        </p></td></tr></table>
   </div>
    </form>
</body>
</html>
