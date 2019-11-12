<%@ Page Language="C#" AutoEventWireup="true" CodeFile="下载中心总览.aspx.cs" Inherits="下载中心总览" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   
</head>
<body>
    <form id="form1" runat="server">

    <table width=60% align=center>
        <tr>
            <td align=center>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/IMAGES/top1.jpg" 
                    Width="100%" />
            </td>
        </tr>
        <tr>
            <td align=left>
                <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="微软雅黑" 
                    Font-Size="X-Large" NavigateUrl="~/zhuye.aspx">首页&gt;&gt;</asp:HyperLink>
                <asp:Label ID="Label1" runat="server" Font-Names="微软雅黑" Font-Size="X-Large" 
                    Text="下载中心&gt;&gt;"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align=center>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" DataKeyNames="编号" 
                DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#E7E7FF" 
                BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" 
                onselectedindexchanged="GridView1_SelectedIndexChanged" Width="550px">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="编号" HeaderText="编号" InsertVisible="False" 
                        ReadOnly="True" SortExpression="编号" >
                    <HeaderStyle HorizontalAlign="Center" Width="0px" />
                    <ItemStyle HorizontalAlign="Center" Width="0px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="文件名" HeaderText="文件名" SortExpression="文件名" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="日期" HeaderText="日期" SortExpression="日期" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:CommandField HeaderText="下载" SelectText="下载" ShowSelectButton="True" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:CommandField>
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConflictDetection="CompareAllValues" 
                ConnectionString="<%$ ConnectionStrings:bds272082662_dbConnectionString4 %>" 
                DeleteCommand="DELETE FROM [下载中心] WHERE [编号] = @original_编号 AND (([文件名] = @original_文件名) OR ([文件名] IS NULL AND @original_文件名 IS NULL)) AND (([日期] = @original_日期) OR ([日期] IS NULL AND @original_日期 IS NULL))" 
                InsertCommand="INSERT INTO [下载中心] ([文件名], [日期]) VALUES (@文件名, @日期)" 
                OldValuesParameterFormatString="original_{0}" 
                SelectCommand="SELECT [编号], [文件名], [日期] FROM [下载中心]" 
                UpdateCommand="UPDATE [下载中心] SET [文件名] = @文件名, [日期] = @日期 WHERE [编号] = @original_编号 AND (([文件名] = @original_文件名) OR ([文件名] IS NULL AND @original_文件名 IS NULL)) AND (([日期] = @original_日期) OR ([日期] IS NULL AND @original_日期 IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_编号" Type="Int32" />
                    <asp:Parameter Name="original_文件名" Type="String" />
                    <asp:Parameter Name="original_日期" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="文件名" Type="String" />
                    <asp:Parameter Name="日期" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="文件名" Type="String" />
                    <asp:Parameter Name="日期" Type="String" />
                    <asp:Parameter Name="original_编号" Type="Int32" />
                    <asp:Parameter Name="original_文件名" Type="String" />
                    <asp:Parameter Name="original_日期" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <p align=center>
            &nbsp;</p>
    </form>
</body>
</html>
