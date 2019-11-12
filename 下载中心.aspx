<%@ Page Language="C#" AutoEventWireup="true" CodeFile="下载中心.aspx.cs" Inherits="下载中心" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body background="IMAGES/00558PIC3t8_1024.jpg">
    <form id="form1" runat="server">
    <div align=center>
        <asp:Label ID="Label1" runat="server" Text="编辑下载中心" Font-Names="微软雅黑" 
            Font-Size="XX-Large"></asp:Label>
    </div>
    <div align=center>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
            RepeatDirection="Horizontal" 
            onselectedindexchanged="RadioButtonList1_SelectedIndexChanged">
            <asp:ListItem>上传文件</asp:ListItem>
            <asp:ListItem>查看文件</asp:ListItem>
        </asp:RadioButtonList>
    </div><br><div align=center>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="1">
        <asp:View ID="View1" runat="server"><div align=center><table class="style1" align=center>
        <tr>
            <td>
                下载中心&gt;&gt;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                文件名：</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr><td>日期：</td>
        <td>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:ImageButton ID="ImageButton1" runat="server" Height="25px" 
                            ImageUrl="~/IMAGES/日历.jpg"  Width="34px" 
                onclick="ImageButton1_Click" />
                        <asp:Calendar ID="Calendar1" runat="server" 
                            onselectionchanged="Calendar1_SelectionChanged" Visible="False" 
                            BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" 
                            DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" 
                            ForeColor="#003399" Height="200px" Width="220px">
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
                上传：</td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="确定上传" Height="30px" 
                    onclick="Button1_Click" Width="100px" />&nbsp<asp:Button ID="Button2"
                    runat="server" Text="返回" Height="30px" Width="100px" 
                    onclick="Button2_Click" />
            </td>
        </tr>
    </table></div>
        </asp:View>
        <asp:View ID="View2" runat="server">
        <div align=center>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" DataKeyNames="编号" 
                DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#E7E7FF" 
                BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" 
                onselectedindexchanged="GridView1_SelectedIndexChanged" Width="550px">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="编号" HeaderText="编号" InsertVisible="False" 
                        ReadOnly="True" SortExpression="编号" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
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
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" >
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
                
                UpdateCommand="UPDATE [下载中心] SET [文件名] = @文件名, [日期] = @日期 WHERE [编号] = @original_编号 AND (([文件名] = @original_文件名) OR ([文件名] IS NULL AND @original_文件名 IS NULL)) AND (([日期] = @original_日期) OR ([日期] IS NULL AND @original_日期 IS NULL))" 
                onselecting="SqlDataSource1_Selecting">
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
            </div><p align=center>
                <asp:Button ID="Button3" runat="server" Text="返回" Height="39px" 
                    onclick="Button3_Click" Width="109px" /></p>
        </asp:View>
    </asp:MultiView></div>
    
    </form>
</body>
</html>
