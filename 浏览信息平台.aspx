<%@ Page Language="C#" AutoEventWireup="true" CodeFile="浏览信息平台.aspx.cs" Inherits="浏览信息平台" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body background="IMAGES/00558PIC3t8_1024.jpg">
    <form id="form1" runat="server">
    <p align=center ><font size="6" face="黑体" >济南大学商学院 </font></p>
    <p align=center ><font size="6" face="黑体" >培训中心管理后台</font></p>
    <p align=center ><font size="4">Welcome my lord!</font></p>
    <div align=center>
    <table ><tr><td>
    <p align=left>
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
            Width="29px" /> &nbsp<asp:HyperLink ID="HyperLink4" runat="server" Font-Bold="True" 
            Font-Names="微軟正黑體 Light" Font-Size="X-Large" Font-Underline="True" 
            NavigateUrl="~/ftb.imagegallery1.aspx" Target="_blank">修改顶图</asp:HyperLink>
        <asp:Image ID="Image4" runat="server" Height="25px" ImageUrl="~/IMAGES/图标.jpg" 
            Width="29px" />&nbsp<asp:HyperLink ID="HyperLink5" runat="server" Font-Bold="True" 
            Font-Names="微軟正黑體 Light" Font-Size="X-Large" Font-Underline="True" 
            NavigateUrl="~/下载中心.aspx" Target="_blank">下载中心</asp:HyperLink>
        <asp:Image ID="Image5" runat="server" Height="25px" ImageUrl="~/IMAGES/图标.jpg" 
            Width="29px" />
    </p></td></tr><tr><td>
    <p align=center>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
            RepeatDirection="Horizontal" 
            onselectedindexchanged="RadioButtonList1_SelectedIndexChanged">
            <asp:ListItem>培训动态</asp:ListItem>
            <asp:ListItem>培训项目</asp:ListItem>
            <asp:ListItem>他山之石</asp:ListItem>
        </asp:RadioButtonList>
    </p><p align=center>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
        <p align=left>
            <asp:Label ID="Label1" runat="server" Text="培训动态>>" Font-Names="微软雅黑" 
                Font-Size="Large"></asp:Label></p>
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" ItemStyle-HorizontalAlign="Center"
                AutoGenerateColumns="False" DataKeyNames="编号" DataSourceID="SqlDataSource2" 
                onselectedindexchanged="GridView2_SelectedIndexChanged" Width="1194px" 
                BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3" GridLines="Horizontal" PageSize="15">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="编号" HeaderText="编号" InsertVisible="False" 
                        ReadOnly="True" SortExpression="编号" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="标题" HeaderText="标题" SortExpression="标题" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="作者" HeaderText="作者" SortExpression="作者" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="编辑" HeaderText="编辑" SortExpression="编辑" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="日期" HeaderText="日期" SortExpression="日期" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:CommandField HeaderText="详情" SelectText="详情" ShowSelectButton="True">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:CommandField>
                    <asp:CommandField ShowDeleteButton="True" >
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConflictDetection="CompareAllValues" 
                ConnectionString="<%$ ConnectionStrings:培训中心1ConnectionString2 %>" 
                DeleteCommand="DELETE FROM [培训动态] WHERE [编号] = @original_编号 AND (([标题] = @original_标题) OR ([标题] IS NULL AND @original_标题 IS NULL)) AND (([作者] = @original_作者) OR ([作者] IS NULL AND @original_作者 IS NULL)) AND (([编辑] = @original_编辑) OR ([编辑] IS NULL AND @original_编辑 IS NULL)) AND (([日期] = @original_日期) OR ([日期] IS NULL AND @original_日期 IS NULL))" 
                InsertCommand="INSERT INTO [培训动态] ([标题], [作者], [编辑], [日期]) VALUES (@标题, @作者, @编辑, @日期)" 
                OldValuesParameterFormatString="original_{0}" 
                SelectCommand="SELECT [编号], [标题], [作者], [编辑], [日期] FROM [培训动态]" 
                UpdateCommand="UPDATE [培训动态] SET [标题] = @标题, [作者] = @作者, [编辑] = @编辑, [日期] = @日期 WHERE [编号] = @original_编号 AND (([标题] = @original_标题) OR ([标题] IS NULL AND @original_标题 IS NULL)) AND (([作者] = @original_作者) OR ([作者] IS NULL AND @original_作者 IS NULL)) AND (([编辑] = @original_编辑) OR ([编辑] IS NULL AND @original_编辑 IS NULL)) AND (([日期] = @original_日期) OR ([日期] IS NULL AND @original_日期 IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_编号" Type="Int32" />
                    <asp:Parameter Name="original_标题" Type="String" />
                    <asp:Parameter Name="original_作者" Type="String" />
                    <asp:Parameter Name="original_编辑" Type="String" />
                    <asp:Parameter Name="original_日期" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="标题" Type="String" />
                    <asp:Parameter Name="作者" Type="String" />
                    <asp:Parameter Name="编辑" Type="String" />
                    <asp:Parameter Name="日期" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="标题" Type="String" />
                    <asp:Parameter Name="作者" Type="String" />
                    <asp:Parameter Name="编辑" Type="String" />
                    <asp:Parameter Name="日期" Type="String" />
                    <asp:Parameter Name="original_编号" Type="Int32" />
                    <asp:Parameter Name="original_标题" Type="String" />
                    <asp:Parameter Name="original_作者" Type="String" />
                    <asp:Parameter Name="original_编辑" Type="String" />
                    <asp:Parameter Name="original_日期" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="View2" runat="server">
        <p align=left>
            <asp:Label ID="Label2" runat="server" Text="培训项目>>" Font-Names="微软雅黑" 
                Font-Size="Large"></asp:Label></p>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" DataKeyNames="编号" 
                DataSourceID="SqlDataSource1" 
                onselectedindexchanged="GridView1_SelectedIndexChanged" Width="1195px" 
                BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3" GridLines="Horizontal" PageSize="15">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="编号" HeaderText="编号" InsertVisible="False" 
                        ReadOnly="True" SortExpression="编号">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="项目标题" HeaderText="项目标题" SortExpression="项目标题">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="项目负责人" HeaderText="项目负责人" SortExpression="项目负责人">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="日期" HeaderText="日期" SortExpression="日期">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:CommandField HeaderText="详情" SelectText="详情" ShowSelectButton="True">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:CommandField>
                    <asp:CommandField ShowDeleteButton="True">
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
                ConnectionString="<%$ ConnectionStrings:培训中心1ConnectionString %>" 
                DeleteCommand="DELETE FROM [培训项目] WHERE [编号] = @original_编号 AND (([项目标题] = @original_项目标题) OR ([项目标题] IS NULL AND @original_项目标题 IS NULL)) AND (([项目负责人] = @original_项目负责人) OR ([项目负责人] IS NULL AND @original_项目负责人 IS NULL)) AND (([日期] = @original_日期) OR ([日期] IS NULL AND @original_日期 IS NULL))" 
                InsertCommand="INSERT INTO [培训项目] ([项目标题], [项目负责人], [日期]) VALUES (@项目标题, @项目负责人, @日期)" 
                OldValuesParameterFormatString="original_{0}" 
                SelectCommand="SELECT [编号], [项目标题], [项目负责人], [日期] FROM [培训项目]" 
                UpdateCommand="UPDATE [培训项目] SET [项目标题] = @项目标题, [项目负责人] = @项目负责人, [日期] = @日期 WHERE [编号] = @original_编号 AND (([项目标题] = @original_项目标题) OR ([项目标题] IS NULL AND @original_项目标题 IS NULL)) AND (([项目负责人] = @original_项目负责人) OR ([项目负责人] IS NULL AND @original_项目负责人 IS NULL)) AND (([日期] = @original_日期) OR ([日期] IS NULL AND @original_日期 IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_编号" Type="Int32" />
                    <asp:Parameter Name="original_项目标题" Type="String" />
                    <asp:Parameter Name="original_项目负责人" Type="String" />
                    <asp:Parameter DbType="Date" Name="original_日期" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="项目标题" Type="String" />
                    <asp:Parameter Name="项目负责人" Type="String" />
                    <asp:Parameter DbType="Date" Name="日期" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="项目标题" Type="String" />
                    <asp:Parameter Name="项目负责人" Type="String" />
                    <asp:Parameter DbType="Date" Name="日期" />
                    <asp:Parameter Name="original_编号" Type="Int32" />
                    <asp:Parameter Name="original_项目标题" Type="String" />
                    <asp:Parameter Name="original_项目负责人" Type="String" />
                    <asp:Parameter DbType="Date" Name="original_日期" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="View3" runat="server">
        <p align=left>
            <asp:Label ID="Label3" runat="server" Text="他山之石>>" Font-Names="微软雅黑" 
                Font-Size="Large"></asp:Label></p>
            <asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" 
                BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                DataSourceID="SqlDataSource3" GridLines="Horizontal" Width="1195px" 
                onselectedindexchanged="GridView3_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="编号" HeaderText="编号" InsertVisible="False" 
                        ReadOnly="True" SortExpression="编号" />
                    <asp:BoundField DataField="标题" HeaderText="标题" SortExpression="标题" />
                    <asp:BoundField DataField="日期" HeaderText="日期" SortExpression="日期" />
                    <asp:CommandField HeaderText="详情" SelectText="详情" ShowSelectButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
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
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:bds272082662_dbConnectionString2 %>" 
                SelectCommand="SELECT [编号], [标题], [日期] FROM [他山之石]" 
                ConflictDetection="CompareAllValues" 
                DeleteCommand="DELETE FROM [他山之石] WHERE [编号] = @original_编号 AND (([标题] = @original_标题) OR ([标题] IS NULL AND @original_标题 IS NULL)) AND (([日期] = @original_日期) OR ([日期] IS NULL AND @original_日期 IS NULL))" 
                InsertCommand="INSERT INTO [他山之石] ([标题], [日期]) VALUES (@标题, @日期)" 
                OldValuesParameterFormatString="original_{0}" 
                UpdateCommand="UPDATE [他山之石] SET [标题] = @标题, [日期] = @日期 WHERE [编号] = @original_编号 AND (([标题] = @original_标题) OR ([标题] IS NULL AND @original_标题 IS NULL)) AND (([日期] = @original_日期) OR ([日期] IS NULL AND @original_日期 IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_编号" Type="Int32" />
                    <asp:Parameter Name="original_标题" Type="String" />
                    <asp:Parameter Name="original_日期" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="标题" Type="String" />
                    <asp:Parameter Name="日期" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="标题" Type="String" />
                    <asp:Parameter Name="日期" Type="String" />
                    <asp:Parameter Name="original_编号" Type="Int32" />
                    <asp:Parameter Name="original_标题" Type="String" />
                    <asp:Parameter Name="original_日期" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:View>
    </asp:MultiView></p></td></tr><tr><td align=right>
        <asp:Image ID="Image3" runat="server" Height="26px" ImageUrl="~/IMAGES/user.jpg" 
                Width="36px" />
        <asp:HyperLink ID="HyperLink3" runat="server" Font-Names="微软雅黑" Font-Size="Large" 
                NavigateUrl="~/登陆新.aspx">退出登录</asp:HyperLink></td></tr></table></div>
    </form>
</body>
</html>
