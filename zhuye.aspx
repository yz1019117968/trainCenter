<%@ Page Language="C#" AutoEventWireup="true" CodeFile="zhuye.aspx.cs" Inherits="mainweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <script language =javascript >
                               var curIndex = 0;
                               //时间间隔 单位毫秒
                               var timeInterval = 5000;
                               var arr = new Array();
                               arr[0] = "1.jpg";
                               arr[1] = "2.jpg";
                               arr[2] = "3.jpg";
                               arr[3] = "4.jpg";
                               arr[4] = "5.jpg";
                               //arr[5]="6.jpg";
                               //arr[6]="7.jpg";
                               setInterval(changeImg, timeInterval);
                               function changeImg() {
                                   var obj = document.getElementById("showpic");
                                   if (curIndex == arr.length - 1) {
                                       curIndex = 0;
                                   }
                                   else {
                                       curIndex += 1;
                                   }
                                   obj.src = "rollnewsimages/" + arr[curIndex];
                               }
</script>
    <style type="text/css">
        .style1
        {
            width: 60%;
        }
        .style2
        {
            height: 34px;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">

    
    <div align="center">
   
                           

        <table class="style1">
            <tr>
                <td>        
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/IMAGES/top1.jpg" 
                        Width="100%" />
                    </td>
            </tr>
            <tr>
                <td><br><br>
                    <table class="style1">
                        <tr>
                            <td valign=top align=center><br><br><p>
                                <asp:Image ID="Image2" runat="server" Height="81px" 
                                    ImageUrl="~/IMAGES/menu.jpg" Width="209px" /></p>
                                 <p>
                                     <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="微软雅黑" 
                                         Font-Size="X-Large">关于我们</asp:HyperLink></p><p><asp:HyperLink ID="HyperLink2" runat="server" Font-Names="微软雅黑" 
                                         Font-Size="X-Large">专家团队</asp:HyperLink></p><p>
                                    <asp:HyperLink ID="HyperLink3" runat="server" Font-Names="微软雅黑" 
                                         Font-Size="X-Large" NavigateUrl="~/培训动态总览.aspx">培训动态</asp:HyperLink></p><p>
                                    <asp:HyperLink ID="HyperLink4" runat="server" Font-Names="微软雅黑" 
                                         Font-Size="X-Large" NavigateUrl="~/培训项目总览.aspx">培训项目</asp:HyperLink></p><p>
                                             <asp:HyperLink ID="HyperLink12" runat="server" Font-Names="微软雅黑" 
                                         Font-Size="X-Large" NavigateUrl="~/他山之石总览.aspx">他山之石</asp:HyperLink></p><p>
                                    <asp:HyperLink ID="HyperLink5" runat="server" Font-Names="微软雅黑" 
                                         Font-Size="X-Large" NavigateUrl="~/下载中心总览.aspx">下载中心</asp:HyperLink></p><p><asp:HyperLink ID="HyperLink6" runat="server" Font-Names="微软雅黑" 
                                         Font-Size="X-Large">友情链接</asp:HyperLink></p><br><p>
                                             <asp:HyperLink ID="HyperLink10" runat="server" Font-Names="微软雅黑 Light" 
                                                 Font-Size="Large" NavigateUrl="http://www.ujn.edu.cn/" Target="_blank">魅力济大>></asp:HyperLink></p><p>
                                    <asp:HyperLink ID="HyperLink11" runat="server" Font-Names="微软雅黑 Light" 
                                        Font-Size="Large" NavigateUrl="http://sxy.ujn.edu.cn/" Target="_blank">弦歌商院>></asp:HyperLink></p><br>
                                        <br><br><br><br><p>
      <asp:ImageButton ID="ImageButton3" runat="server" Height="30px" 
          ImageUrl="~/IMAGES/user.jpg" Width="40px" />
      <asp:HyperLink ID="HyperLink9" runat="server" Font-Names="微软雅黑" 
          Font-Size="Large" NavigateUrl="~/登陆新.aspx">后台登陆</asp:HyperLink>
    </p></td>
                            <td>
                                <table >
                                    <tr>
                                        <td align=center valign=middle><br>
                                          &nbsp&nbsp<img src="rollnewsimages/1.jpg" width="90%" height="320px" id="showpic" /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table><tr><td>&nbsp</td><td align=left class="style2"><p><asp:HyperLink ID="HyperLink7" runat="server" 
                                                    Font-Names="微软雅黑" Font-Size="Large">培训项目>></asp:HyperLink>
                                               </p></td><td>&nbsp&nbsp&nbsp</td><td align=left class="style2"> 
                                                   <p> <asp:HyperLink ID="HyperLink8" runat="server" Font-Names="微软雅黑" 
                                                           Font-Size="Large">培训动态>></asp:HyperLink><tr>
                                                   </p></td></tr><tr> <td>&nbsp</td><td align=center>
                                                       
                             <asp:GridView ID="GridView1" runat="server" Width="430px" 
                                AutoGenerateColumns="False" DataKeyNames="编号" 
                                DataSourceID="SqlDataSource1" Font-Names="微软雅黑" BackColor="White" 
                                BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                                GridLines="Horizontal" onselectedindexchanged="GridView1_SelectedIndexChanged">
                                <AlternatingRowStyle BackColor="#F7F7F7" />
                                <Columns>
                                    <asp:BoundField DataField="项目标题" HeaderText="项目标题" SortExpression="项目标题">
                                    <HeaderStyle Height="20px" />
                                    <ItemStyle HorizontalAlign="Center" Width="300px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="日期" HeaderText="日期" SortExpression="日期" >
                                    </asp:BoundField>
                                    <asp:CommandField HeaderText="查看" SelectText="查看" ShowSelectButton="True" >
                                    <HeaderStyle HorizontalAlign="Center" Width="100px" />
                                    <ItemStyle HorizontalAlign="Center" Width="100px" />
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
                                ConnectionString="<%$ ConnectionStrings:培训中心1ConnectionString7 %>" 
                                
                        SelectCommand="SELECT TOP 10 [编号],[项目标题], [日期] FROM [培训项目] ORDER BY [编号] DESC">
                            </asp:SqlDataSource>
                                                   </td><td></td>
                                                    <td align=center>
                            <asp:GridView ID="GridView2" runat="server" Width="430px" 
                                AutoGenerateColumns="False" DataKeyNames="编号" 
                                DataSourceID="SqlDataSource2" Font-Names="微软雅黑" BackColor="White" 
                                BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                                GridLines="Horizontal" onselectedindexchanged="GridView2_SelectedIndexChanged">
                                <AlternatingRowStyle BackColor="#F7F7F7" />
                                <Columns>
                                    <asp:BoundField DataField="标题" HeaderText="标题" SortExpression="标题" >
                                    <HeaderStyle Height="20px" />
                                    <ItemStyle HorizontalAlign="Center" Width="300px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="日期" HeaderText="日期" SortExpression="日期" />
                                    <asp:CommandField HeaderText="查看" SelectText="查看" ShowSelectButton="True" >
                                    <HeaderStyle HorizontalAlign="Center" Width="100px" />
                                    <ItemStyle HorizontalAlign="Center" Width="100px" />
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
                                ConnectionString="<%$ ConnectionStrings:培训中心1ConnectionString4 %>" 
                                
                                SelectCommand="SELECT TOP 10 [编号], [标题], [日期] FROM [培训动态] ORDER BY [编号] DESC" 
                                onselecting="SqlDataSource2_Selecting">
                            </asp:SqlDataSource>
                                                    </td>
                                                </tr><tr><td>&nbsp&nbsp</td><td align=right>
                            <asp:ImageButton ID="ImageButton2" runat="server" Height="19px" 
                                    ImageUrl="~/IMAGES/more.jpg" Width="66px" 
                                onclick="ImageButton2_Click" />
                                                    </td><td></td><td  align=right>
                            <asp:ImageButton ID="ImageButton1" runat="server" Height="19px" 
                                    ImageUrl="~/IMAGES/more.jpg" Width="66px" onclick="ImageButton1_Click" />

    
                                                    </td></tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                               </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    </td>
            </tr>
        </table>
   
                           

  </div>
  
    </form>
</body>
</html>
