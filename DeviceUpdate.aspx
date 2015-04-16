<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DeviceUpdate.aspx.cs" Inherits="DeviceUpdate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title> 
 <style type="text/css">
.STYLE1 {color: #FF0000}
body,td,th {
	font-size: 9pt;
}
body {
	margin-left: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	margin-top: 0px;
	  background-color :#e5f6cf;
}
        .style5
     {
         font-weight: bold;
         font-size: large;
         text-align: center;
         color: #000000;
         height: 29px;
     }
    </style>
</head>
<body >
    <form method="post" runat="server" id="form1">
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
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed">
  <tr>
    <td background="images/main_40.gif" style="width:3px;">&nbsp;</td>
    <td  style="border-right:solid 1px #9ad452;">
      <table width=600 border=0 cellpadding=0 cellspacing=0 align="center">
        <tr>
	    <td class="style5" colspan="2"> &nbsp;</td>
        </tr>
        <tr>
	    <td class="style5" colspan="2"> 更新设备信息</td>
        </tr>
        <tr>
	    <td class="style5" colspan="2"> &nbsp;</td>
        </tr>
        <tr font-size:14px;">
	  <td style="height: 14px; width: 600px;" class="style6">
          <br />
          设备名称：&nbsp; <asp:TextBox ID="DeviceName" runat="server" Width="117px"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="设备名称必填!"
              Width="79px" ControlToValidate="DeviceName" ValidationGroup="BtnAdd"></asp:RequiredFieldValidator>
          <br />
          <br />
                                          </td>
	  <td style="height: 14px; width: 600px;" class="style6">
          设备类型：<asp:DropDownList ID="DeviceType" runat="server" width=117px
              DataTextField="deviceTypeName" DataValueField="deviceTypeId">
          </asp:DropDownList>&nbsp;
          </td>
        </tr>
        <tr font-size:14px;">
	  <td style="height: 14px; width: 600px;" class="style6">
          设备型号：&nbsp; <asp:TextBox ID="DeviceModel" runat="server" Width="115px"></asp:TextBox>
         
          &nbsp; </td>
	  <td style="height: 14px; width: 600px;" class="style6">
          设备牌名：<asp:TextBox ID="DeviceSign" runat="server" Width="117px"></asp:TextBox> &nbsp; </td>
        </tr>
        <tr font-size:14px;">
	  <td style="height: 14px; width: 600px;" class="style6">
          设备序列号：<asp:TextBox ID="DeviceSerialNumber" runat="server" Width="117px"></asp:TextBox>&nbsp;<br />
            </td>
	  <td style="height: 14px; width: 600px;" class="style6">
          生产厂家：<asp:TextBox ID="DeviceMadePlace" runat="server" Width="117px"></asp:TextBox>
          &nbsp; &nbsp;&nbsp; </td>
        </tr>
        <tr font-size:14px;">
	  <td style="height: 14px; width: 600px;" class="style6">
          出厂时间：&nbsp; <asp:TextBox ID="DeviceOutDate" runat="server" Width="117px"></asp:TextBox>
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
          <asp:Button ID="Button1" runat="server" Text="选择" onclick="Button1_Click" 
              style="height: 26px" />
&nbsp;&nbsp; &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="DeviceOutDate"
              ErrorMessage="出厂日期格式不正确!" Operator="DataTypeCheck" Type="Date" 
              ValidationGroup="BtnAdd"></asp:CompareValidator><br />
          <br />
                                          </td>
	  <td style="height: 14px; width: 600px;" class="style6">
          购买时间：<asp:TextBox ID="DevicePurchaseTime" runat="server" Width="117px"></asp:TextBox>
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
&nbsp;<asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="DevicePurchaseTime"
              ErrorMessage="购买时间格式不正确!" Operator="DataTypeCheck" Type="Date" 
              ValidationGroup="BtnAdd"></asp:CompareValidator>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DevicePurchaseTime"
              ErrorMessage="购买时间必填!" Width="107px" ValidationGroup="BtnAdd"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
         <td class="style6">
          上传图片： <asp:FileUpload ID="DeviceImageUpload" runat="server" Width="207px" />&nbsp;<asp:Button ID="BtnUpload" runat="server" Text="上传" OnClick="BtnUpload_Click" />
          &nbsp; &nbsp; &nbsp;
             <br />
             <br />
             图片路径： <asp:TextBox ID="DeviceImagePath" runat="server" ReadOnly="True" 
                 Width="248px" Enabled="False"></asp:TextBox>
             </td><td width=100px>
    <asp:Image ID="DeviceImage" runat="server" Height="90px" Width="99px" /></td>
        </tr>
       <tr font-size:14px;">
        <td colspan=2 style="height: 61px" valign="top">
            备&nbsp;&nbsp;&nbsp;&nbsp;注： <asp:TextBox ID="deviceNotes" runat="server" Height="53px" Width="373px" TextMode="MultiLine"></asp:TextBox>
           <tr style="color:blue;font-size:14px;">
         <td colspan=2 style="height: 18px" align=center>
             &nbsp;</td>
       </tr>
           <tr style="color:blue;font-size:14px;">
         <td colspan=2 style="height: 18px" align=center>
             <asp:Button ID="BtnUpdate" runat="server" Text="提交" OnClick="BtnUpdate_Click" 
                 Width="74px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Button ID="BtnBack" runat="server" Text="取消" OnClick="BtnBack_Click" 
                 Width="74px" />&nbsp;
             <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">返回首页</asp:HyperLink>
               </td>
       </tr>
           <tr style="color:blue;font-size:14px;">
         <td colspan=2 style="height: 18px" align=center>
             &nbsp;</td>
       </tr>
      </table>
      </td>
    
    <td background="images/main_42.gif" style="width:3px;">&nbsp;</td>
  </tr>
</table>
</td>
    <td background="images/main_42.gif" style="width:3px;">&nbsp;</td>
  </tr>
</table>
    </form>
</body>
</html>
