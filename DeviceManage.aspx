<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DeviceManage.aspx.cs" Inherits="DeviceManage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
   <style type="text/css">
.STYLE1 {color: #FF0000}

body {
	margin-left: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	margin-top: 0px;
	font-size :12px;
	  background-color :#e5f6cf;
}
        .style5
       {
           font-size: large;
           font-weight: 700;
           text-align: center;
           color: #000000;
           height: 26px;
       }
       .style6
       {
           text-align: center;
       }
    </style>
</head>
<body >
    <form method="post" id="form1" runat="server">
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
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
    <td background="images/main_40.gif" style="width:3px;  height :500px">&nbsp;</td>
    <td  style="border-right:solid 1px #9ad452;">
      <table width=100% border=0 cellpadding=0 cellspacing=0 align="center">
        <tr >
	  <td class="style5">查询设备信息</td>
        </tr>
        <tr >
	  <td class="style5">&nbsp;</td>
        </tr>
        <tr >
          <td style="height: 18px" class="style6" >
              <div class="style6">
              设备名称:<asp:TextBox ID="DeviceName" runat="server" Width="62px"></asp:TextBox>设备类别:<asp:DropDownList
                  ID="DeviceType" runat="server" Width="63px">
              </asp:DropDownList>开始日期:<asp:TextBox ID="StartTime" runat="server" Width="65px"></asp:TextBox>
                  <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="StartTime" Format ="yyyy-MM-dd">
                  </cc1:CalendarExtender>
                  结束日期:<asp:TextBox ID="EndTime" runat="server" Width="64px"></asp:TextBox>
                  <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="EndTime" Format ="yyyy-MM-dd">
                  </cc1:CalendarExtender>
&nbsp;<asp:Button ID="BtnQuery" runat="server" OnClick="BtnQuery_Click" Text="查询" />&nbsp;
                  <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">返回首页</asp:HyperLink>
                  <br />
                  <br />
              </div>
              <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                  BackColor="#eafcd5" BorderColor="White" 
                  CellPadding="3" DataSourceID="DeviceInfoDataSource" OnRowDataBound="GridView1_RowDataBound"
                  Width="800" PageSize="20" CellSpacing="1" GridLines="None">
                  <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                  <RowStyle ForeColor="Black" />
                  <SelectedRowStyle BackColor="#51b2f6" Font-Bold="True" ForeColor="White" />
                  <PagerStyle ForeColor="Black" HorizontalAlign="Right" BackColor="#C6C3C6" />
                  <HeaderStyle width="6%" height="26"  forecolor=white  BackColor ="#42870a" />
                  <Columns>
                      <asp:BoundField DataField="deviceName" HeaderText="设备名称" SortExpression="deviceName" />
                      <asp:BoundField DataField="deviceTypeName" HeaderText="设备类型" SortExpression="deviceTypeName" />
                      <asp:BoundField DataField="deviceStateName" HeaderText="设备状态" SortExpression="deviceStateName" />
                      <asp:BoundField DataField="deviceSign" HeaderText="设备品牌" SortExpression="deviceSign" />
                      <asp:BoundField DataField="deviceModel" HeaderText="设备型号" SortExpression="deviceModel" />
                      <asp:BoundField DataField="devicePurchaseTime" HeaderText="购买时间" SortExpression="devicePurchaseTime" />
                      <asp:HyperLinkField DataNavigateUrlFields="deviceId" DataNavigateUrlFormatString="DeviceUpdate.aspx?deviceId={0}"
                          HeaderText="操作" Text="详情" />
                  </Columns>
                  <RowStyle ForeColor="#000066" />
                  <EmptyDataTemplate>
                      抱歉，您要查询的信息不存在!
                  </EmptyDataTemplate>
              </asp:GridView>
              &nbsp; &nbsp;
              <br />
              <asp:SqlDataSource ID="DeviceInfoDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                  SelectCommand="SELECT [deviceStateName], [deviceName], [deviceTypeName], [deviceSign], [deviceModel], [devicePurchaseTime], [deviceId] FROM [deviceInfoView]"></asp:SqlDataSource>
          </td>
        </tr>
     </table>
     
     </td>
    <td background="images/main_42.gif" style="width:3px;height :500px"">&nbsp;</td>
  </tr>
</table>
    </form>
</body>
</html>
