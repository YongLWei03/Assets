<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DeviceRejecthAdd.aspx.cs" Inherits="DeviceRejecthAdd" %>

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
            font-size: large;
            font-weight: bold;
            text-align: center;
            color: #000000;
            height: 24px;
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
      <table width=600 border=0 cellpadding=0 cellspacing=0 align="center">
        <tr >
	  <td  colspan ="3" class="style5">&nbsp;</td>
        </tr>
        <tr >
	  <td  colspan ="3" class="style5">报废设备登记</td>
        </tr>
        <tr >
	  <td  colspan ="3" class="style5">&nbsp;</td>
        </tr>
        <tr>
        <td style="height: 18px">
            选择设备:&nbsp;<asp:DropDownList ID="Device" runat="server" AutoPostBack="True" 
                OnSelectedIndexChanged="Device_SelectedIndexChanged"  Width="88px">
            </asp:DropDownList>
                       
            &nbsp;
           </td>
        <td rowspan="2">
           <asp:Image ID="DeviceImage" runat="server" Height="87px" Width="96px" />
           </td>
       <td style="width: 99px" rowspan="2">
           &nbsp;</td>
       </tr>
        <tr>
        <td style="height: 28px">
            <br />
            &nbsp;&nbsp;&nbsp;<br />
            <br />
            <br />
            设备类型:<asp:DropDownList ID="DeviceType" 
                runat="server" AutoPostBack="True" 
                OnSelectedIndexChanged="DeviceType_SelectedIndexChanged" 
                Width="88px">
            </asp:DropDownList> &nbsp;</td>
       </tr>
        <tr>
        <td style="height:28px">
            折旧金额:<asp:TextBox
                ID="DepreciationMoney" runat="server" Width="88px"></asp:TextBox>元 
            &nbsp;</td>
        <td style="height:28px">
            报废日期:<asp:TextBox ID="DeviceRejectTime" runat="server" Width="88px"></asp:TextBox>
&nbsp;
           </td>
       <td style="width: 99px">
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
            </td>
       </tr>
       <tr>
        <td colspan=3>
            报废原因:<asp:TextBox ID="DeviceRejectReason" runat="server" Height="61px" 
                Width="367px" TextMode="MultiLine"></asp:TextBox>
                <br />
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DeviceRejectTime"
                ErrorMessage="报废日期必填!" ValidationGroup="BtnRubbish"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DepreciationMoney"
                ErrorMessage="折旧金额必填！" ValidationGroup="BtnRubbish"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="DepreciationMoney"
                ErrorMessage="金额输入格式不正确!" Operator="DataTypeCheck" Type="Currency" 
                ValidationGroup="BtnRubbish"></asp:CompareValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DeviceRejectReason"
                ErrorMessage="报废原因必填!" ValidationGroup="BtnRubbish"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="DeviceRejectTime"
                ErrorMessage="报废日期格式不正确!" Operator="DataTypeCheck" Type="Date" 
                ValidationGroup="BtnRubbish"></asp:CompareValidator>
                </td>
       </tr>
       <tr>
       <td colspan=3 style="height: 28px" align="center">
           <asp:Button ID="BtnRubbish" runat="server" Text="报废" OnClick="BtnRubbish_Click" 
               ValidationGroup="BtnRubbish" Width="76px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">返回首页</asp:HyperLink>
           </td>
       </tr>
       <tr>
       <td colspan=3 style="height: 28px" align="center">
           &nbsp;</td>
       </tr>
     </table>
     
     </td>
    <td background="images/main_42.gif" style="width:3px;">&nbsp;</td>
  </tr>
</table>
         &nbsp;
         <asp:SqlDataSource ID="DepartmentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
             SelectCommand="SELECT [departmentName], [departmentId] FROM [departmentInfo]"></asp:SqlDataSource>
    </form>
</body>
</html>
