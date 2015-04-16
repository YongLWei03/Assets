<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DeviceRejectQuery.aspx.cs" Inherits="DeviceRejectQuery" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
  <style type="text/css">


body {
	margin-left: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	margin-top: 0px;
	font-size: 12px;
	  background-color :#e5f6cf;
}
     .STYLE1 
     {
     	font-size: 14px; 
     
     	}
     	


a:link {
	font-size: 12px;
	color: #06482a;
	text-decoration: none;

}
a:visited {
	font-size: 12px;
	color: #06482a;
	text-decoration: none;
}
a:hover {
	font-size: 12px;
	color: #FF0000;
	text-decoration: underline;
}
a:active {
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}

      .style1
      {
          font-weight: bold;
          font-size: x-large;
          text-align: center;
      }

      .style6
      {
          text-align: center;
      }

    </style>  
</head>
<body >
    <form method="post" id="from" runat="server">
       <table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed;">
  <tr>
    <td height="9" style="line-height:9px; background-image:url(images/main_04.gif)"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="97" height="9" background="images/main_01.gif">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="47" background="images/main_09.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="38" height="47" background="images/main_06.gif">&nbsp;</td>
        <td width="59"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="29" background="images/main_07.gif">&nbsp;</td>
          </tr>
          <tr>
            <td height="18" background="images/main_14.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed;">
              <tr>
                <td  style="width:1px;">&nbsp;</td>
                <td ><span class="STYLE1">Admin</span></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="155" background="images/main_08.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="23" valign="bottom"  width="367"></td>
          </tr>
        </table></td>
        <td width="200" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="11%" height="23">&nbsp;</td>
            <td width="89%" valign="bottom"><span class="STYLE1"></span></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="5" style="line-height:5px; background-image:url(images/main_18.gif)"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="180" background="images/main_16.gif"  style="line-height:5px;">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
    
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed">
  <tr>
    <td background="images/main_40.gif" style="width:3px;">&nbsp;</td>
    <td   style="border-right:solid 1px #9ad452;">
      <table width=100% border=0 cellpadding=0 cellspacing=0 align="center" bgcolor="#c0de98">
        <tr>
	  <td class="style1">&nbsp;</td>
        </tr>
        <tr>
	  <td class="style1">查询设备报废信息</td>
        </tr>
        <tr>
	  <td class="style1">&nbsp;</td>
        </tr>
        <tr>
        <td style="width:100%;"　valign=top class="style6">
            <div class="style6">
            设备名称:<asp:TextBox ID="DeviceName" runat="server" Width="62px"></asp:TextBox>设备类别:<asp:DropDownList
                  ID="DeviceType" runat="server" Width="63px" DataSourceID="DeviceTypeNameDataSource" DataTextField="deviceTypeName" DataValueField="deviceTypeName">
              </asp:DropDownList>&nbsp; 开始日期:<asp:TextBox ID="StartTime" runat="server" Width="65px"></asp:TextBox>
                <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" 
                    BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" 
                    Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" 
                    onselectionchanged="Calendar1_SelectionChanged" ShowGridLines="True" 
                    Visible="False" Width="220px">
                    <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                    <SelectorStyle BackColor="#FFCC66" />
                    <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                    <OtherMonthDayStyle ForeColor="#CC9966" />
                    <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                    <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                    <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" 
                        ForeColor="#FFFFCC" />
                </asp:Calendar>
                <asp:Button ID="Button1" runat="server" Text="选择" onclick="Button1_Click" />
                结束日期:<asp:TextBox ID="EndTime" runat="server" Width="64px"></asp:TextBox>
                <asp:Calendar ID="Calendar2" runat="server" BackColor="#FFFFCC" 
                    BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" 
                    Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" 
                    onselectionchanged="Calendar2_SelectionChanged" ShowGridLines="True" 
                    Visible="False" Width="220px">
                    <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                    <SelectorStyle BackColor="#FFCC66" />
                    <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                    <OtherMonthDayStyle ForeColor="#CC9966" />
                    <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                    <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                    <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" 
                        ForeColor="#FFFFCC" />
                </asp:Calendar>
                <asp:Button ID="Button2" runat="server" Text="选择" onclick="Button2_Click" />
&nbsp;<asp:Button ID="BtnQuery" runat="server" OnClick="BtnQuery_Click" Text="查询" />&nbsp;<asp:HyperLink 
                    ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">返回首页</asp:HyperLink>
                <br />
                <br />
                      </div>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                 BorderColor="White"  BorderWidth="1px"
                CellPadding="3" DataSourceID="DeviceRejctDataSource"
                Width="800" OnRowDataBound="GridView1_RowDataBound" CellSpacing="1" 
                          GridLines="None">
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <Columns>
                    <asp:BoundField DataField="deviceName" HeaderText="设备名称" SortExpression="deviceName" />
                    <asp:BoundField DataField="deviceTypeName" HeaderText="设备类型" SortExpression="deviceTypeName" />
                    <asp:BoundField DataField="deviceRejectTime" HeaderText="报废日期" SortExpression="deviceRejectTime" />
                    <asp:BoundField DataField="deviceRejectReason" HeaderText="报废原由" SortExpression="deviceRejectReason" />
                    <asp:BoundField DataField="depreciationMoney" HeaderText="折旧金额" SortExpression="depreciationMoney" />
                </Columns>
                <RowStyle ForeColor="Black" BackColor="#eafcd5" CssClass =" STYLE1"  HorizontalAlign =Center />
                 <EmptyDataTemplate>
                      抱歉，您要查询的信息不存在!
                  </EmptyDataTemplate>
                <SelectedRowStyle BackColor="#51b2f6" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="Black" HorizontalAlign="Right"  />
                <HeaderStyle width="6%" height="26"  ForeColor=white  BackColor ="#42870a"/>
            </asp:GridView>
            <asp:SqlDataSource ID="DeviceRejctDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT * FROM [rejectInfoView]"></asp:SqlDataSource>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        </tr>
        <tr>
        <td style="width:100%;"　valign=top class="style6">
            &nbsp;</tr>
      </table>
      
      </td>
    <td background="images/main_42.gif" style="width:3px;">&nbsp;</td>
  </tr>
</table>
        <asp:SqlDataSource ID="DeviceTypeNameDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [deviceTypeName] FROM [deviceType]"></asp:SqlDataSource>
    </form>
</body>
</html>