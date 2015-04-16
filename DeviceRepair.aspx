<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DeviceRepair.aspx.cs" Inherits="DeviceRepair" %>

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
     <form method="post" runat="server" id="from1">
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
      <table border=0 cellpadding=0 cellspacing=0 align="center" style="width: 763px">
        <tr>
	  <td colspan ="7" class="style5">&nbsp;</td>
        </tr>
        <tr>
	  <td colspan ="7" class="style5">添加设备维修记录</td>
        </tr>
        <tr>
	  <td colspan ="7" class="style5">&nbsp;</td>
        </tr>
        <tr>
        <td style="height: 18px" colspan="3">
            
                选择设备:<asp:DropDownList ID="Device" runat="server" 
                AutoPostBack="True" OnSelectedIndexChanged="Device_SelectedIndexChanged" 
                Width="114px" >
            </asp:DropDownList>
            
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
            
             &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; </td>
        <td colspan="2">
            设备类型:<asp:DropDownList 
                ID="DeviceType" runat="server" AutoPostBack="True" 
                OnSelectedIndexChanged="DeviceType_SelectedIndexChanged" 
                Width="114px">
            </asp:DropDownList>&nbsp;</td>
        <td rowspan="2">
            &nbsp;</td>
       <td style="width: 99px" rowspan="2">
           <asp:Image ID="DeviceImage" runat="server" Height="87px" Width="96px" /></td>
       </tr>
        <tr>
        <td>
             维修人员:<asp:TextBox
                ID="RepairMan" runat="server" Width="114px"></asp:TextBox>
           
            &nbsp;</td>
        <td colspan="2">
            &nbsp; </td>
        <td colspan="2">
            维修地点:<asp:TextBox 
                ID="RepairPlace" runat="server" Width="114px"></asp:TextBox></td>
       </tr>
       <tr><td colspan=2 style="height: 120px">
      
           故障原因:<asp:TextBox ID="RepairReason" runat="server" Width="114px"></asp:TextBox>
           &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
           
           </td><td colspan=2 style="height: 120px">
      
               维修日期:<asp:TextBox
               ID="RepairStartTime" runat="server" Width="114px"></asp:TextBox>
           <asp:Button ID="Button1" runat="server" Text="选择" onclick="Button1_Click" />
           </td><td colspan=3 style="height: 120px">
      
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
           </td></tr>
       <tr><td colspan=7 style="height: 120px">
      
           备&nbsp;&nbsp;&nbsp; 注:<asp:TextBox ID="RepairNotes" runat="server" 
               Height="73px" Width="380px"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RepairPlace"
                ErrorMessage="维修地点必填!" ValidationGroup="BtnRepair"></asp:RequiredFieldValidator><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator2" runat="server" 
               ControlToValidate="RepairMan" ErrorMessage="维修人员必填" ValidationGroup="BtnRepair"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RepairReason"
                ErrorMessage="故障原因必填!" ValidationGroup="BtnRepair"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
               ErrorMessage="请选择维修时间!" ControlToValidate="RepairStartTime" 
               ValidationGroup="BtnRepair"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="RepairStartTime"
                ErrorMessage="维修日期格式不正确!" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
           </td></tr>
       <tr><td align=center colspan=7 style="height: 18px">
           
           
           <asp:Button ID="BtnRepair" runat="server" Text="提交" OnClick="BtnRepair_Click" 
               Width="74px" />
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button ID="Button2" runat="server" Text="返回" 
               onclick="Button2_Click"   Width="74px"/>
           </td></tr>


     </table>
     
     </td>
    <td background="images/main_42.gif" style="width:3px;">&nbsp;</td>
  </tr>
</table>
    </form>
</body>
</html>
