﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DeviceLend.aspx.cs" Inherits="DeviceLend" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
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
        height: 25px;
    }
    </style>
</head>
<body >
     <form method="post" runat="server" id="form1">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed;">
  <tr>
    <td height="9" style="line-height:9px; background-image:url(images/main_04.gif)"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="97" height="9" background="images/main_01.gif"></td>
        <td></td>
        <td></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="47" background="images/main_09.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="38" height="47" background="images/main_06.gif"></td>
        <td width="59"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="29" background="images/main_07.gif"></td>
          </tr>
          <tr>
            <td height="18" background="images/main_14.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed;">
              <tr>
                <td  style="width:1px;"></td>
                <td ><span class="STYLE1">Admin</span></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="155" background="images/main_08.gif"></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="23" valign="bottom"  width="367"></td>
          </tr>
        </table></td>
        <td width="200"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="11%" height="23"></td>
            <td width="89%" valign="bottom"><span class="STYLE1"></span></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="5" style="line-height:5px; background-image:url(images/main_18.gif)"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="180" background="images/main_16.gif"  style="line-height:5px;"></td>
        <td></td>
      </tr>
    </table></td>
  </tr>
</table>
    
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed">
  <tr>
    <td background="images/main_40.gif" style="width:3px;"></td>
    <td  style="border-right:solid 1px #9ad452;">
      <table width=600 border=0 cellpadding=0 cellspacing=0 align="center">
        <tr>
	  <td colspan ="3" class="style5"></td>
        </tr>
        <tr>
	  <td colspan ="3" class="style5">设备借出登记</td>
        </tr>
        <tr>
	  <td colspan ="3" class="style5"></td>
        </tr>
        <tr>
        <td style="height: 28px">
            <br />
                        选择设备:<asp:DropDownList ID="Device" runat="server" AutoPostBack="True" 
                OnSelectedIndexChanged="Device_SelectedIndexChanged" Height="18px" 
                Width="100px">
            </asp:DropDownList>
           
              
            <br />
            <br />
            <br />
            </td>
        <td style="height: 28px">
            设备类型:<asp:DropDownList 
                ID="DeviceType" runat="server" AutoPostBack="True" 
                OnSelectedIndexChanged="DeviceType_SelectedIndexChanged" 
                Width="100px">
            </asp:DropDownList>
            </td>
       <td style="width: 99px" rowspan="2">
           <asp:Image ID="DeviceImage" runat="server" Height="87px" Width="96px" /></td>
       </tr>
        <tr>
        <td style="height: 28px">
                       借 用 人:<asp:TextBox
                ID="LendPerson" runat="server" Width="100px"></asp:TextBox>
           
                </td>
        <td style="height: 28px">
             借用部门:<asp:DropDownList ID="LendDepartment" 
                runat="server" DataSourceID="DepartmentDataSource" 
                DataTextField="departmentName" DataValueField="departmentId" 
                Width="100px">
            </asp:DropDownList> 
            </td>
       </tr>
       <tr>
        <td colspan=3>
            借用日期:<asp:TextBox ID="LendDate" runat="server" Width="100px"></asp:TextBox>
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
            </asp:Calendar><asp:Button ID="Button1" runat="server" Text="选择" onclick="Button1_Click" />
            <br />
                </td>
       </tr>
       <tr>
        <td colspan=3>
 借用天数:<asp:TextBox
                ID="LendDays" runat="server" Width="100px"></asp:TextBox>天<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="LendPerson"
                ErrorMessage="外借人必填!" ValidationGroup="BtnLend"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="LendDate"
                ErrorMessage="外借日期必填!" ValidationGroup="BtnLend"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="LendDate"
                ErrorMessage="日期格式不正确!" Operator="DataTypeCheck" Type="Date" 
                ValidationGroup="BtnLend"></asp:CompareValidator>
            <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="LendDays"
                ErrorMessage="设备天数格式是正整数!" Operator="DataTypeCheck" Type="Integer" 
                ValidationGroup="BtnLend"></asp:CompareValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="LendDays"
                ErrorMessage="借用天数必填!" ValidationGroup="BtnLend"></asp:RequiredFieldValidator>
            </td>
       </tr>
       <tr>
       <td colspan=3 style="height: 28px" align="center">
           
           &nbsp;</td>
       </tr>
       <tr>
       <td colspan=3 style="height:28px" align="center">
           
           <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">返回首页</asp:HyperLink>

           <asp:Button ID="BtnLend" runat="server" Text="借出" OnClick="BtnLend_Click" 
               Width="74px" />
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <asp:Button ID="BtnCancle" runat="server" OnClick="BtnCancle_Click" Text="取消" 
               Width="74px" /></td>
       </tr>
       <tr>
       <td colspan=3 style="height: 28px" align="center">
           
           &nbsp;</td>
       </tr>
     </table>
     </td>
    <td background="images/main_42.gif" style="width:3px;"></td>
  </tr>
</table>
         
         <asp:SqlDataSource ID="DepartmentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
             SelectCommand="SELECT [departmentName], [departmentId] FROM [departmentInfo]"></asp:SqlDataSource>
    </form>
</body>
</html>
