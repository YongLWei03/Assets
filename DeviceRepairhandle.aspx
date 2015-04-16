<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DeviceRepairhandle.aspx.cs" Inherits="DeviceRepairhandle" %>

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
            font-weight: 700;
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
    <td background="images/main_40.gif" style="width:3px;"></td>
    <td  style="border-right:solid 1px #9ad452;">
      <table border=0 cellpadding=0 cellspacing=0 align="center" style="width: 699px">
        <tr >
	  <td class="style5" colspan ="4"></td>
        </tr>
        <tr >
	  <td class="style5" colspan ="4">设备维修处理</td>
        </tr>
        <tr >
	  <td class="style5" colspan ="4"></td>
        </tr>
        <tr>
        <td style="height: 87px">
            设备名称:
            <asp:Literal ID="DeviceName" runat="server"></asp:Literal>
                     <br />
            </td>
        <td style="height: 87px" colspan="2">
               设备类型 :
            <asp:Literal ID="DeviceTypeName" runat="server"></asp:Literal></td>
       <td style="width: 99px; height: 87px;">
           <asp:Image ID="DeviceImage" runat="server" Height="87px" Width="96px" /></td>
       </tr>
        <tr>
        <td class="style6">
            送修地点: <asp:Literal ID="RepairPlace" runat="server"></asp:Literal>
              </td>
        <td colspan="2" class="style6">
            维修人员:<asp:TextBox
                ID="RepairMan" runat="server" Width="106px"></asp:TextBox></td>
       <td class="style7">
           </td>
       </tr>
       <tr><td class="style8">
           故障原因:<asp:TextBox ID="RepairReason" runat="server" Width="106px"></asp:TextBox>
           <br />
           <br />
           <br />
           <br />
           </td><td class="style8">
               维修日期:<asp:TextBox
               ID="RepairEndTime" runat="server" Width="106px"></asp:TextBox>
           </td><td colspan=2 class="style8">
               
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
           <asp:Button ID="Button2" runat="server" Text="选择" onclick="Button2_Click" />
           </td></tr>
       <tr><td class="style9">
           维修费用:<asp:TextBox
               ID="RepairMoney" runat="server" Width="106px"></asp:TextBox>元  </td>
                             <td class="style9">
                                 维修费时:<asp:TextBox ID="RepairTime" runat="server" Width="106px"></asp:TextBox>工时</td>
           <td colspan=2 class="style9">
                                 </td></tr>
       <tr><td colspan=4 style="height: 119px">
           备&nbsp;&nbsp; 注:<asp:TextBox ID="RepairNotes" runat="server" 
               Height="57px" Width="356px"></asp:TextBox><br />
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RepairMan"
               ErrorMessage="维修人员必填!" ValidationGroup="BtnRepair"></asp:RequiredFieldValidator>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RepairReason"
               ErrorMessage="故障原因必填!" ValidationGroup="BtnRepair"></asp:RequiredFieldValidator>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RepairEndTime"
               ErrorMessage="维修日期必填!" ValidationGroup="BtnRepair"></asp:RequiredFieldValidator>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="RepairTime"
               ErrorMessage="维修费时必填!" ValidationGroup="BtnRepair"></asp:RequiredFieldValidator>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="RepairMoney"
               ErrorMessage="维修费用必填!" ValidationGroup="BtnRepair"></asp:RequiredFieldValidator>
           <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="RepairEndTime"
               ErrorMessage="维修日期格式不正确!" Operator="DataTypeCheck" Type="Date" 
               ValidationGroup="BtnRepair"></asp:CompareValidator></td></tr>
       <tr><td align=center colspan=4 style="height: 18px">
           <asp:Button ID="BtnRepair" runat="server" Text="提交" OnClick="BtnRepair_Click" 
               Width="74px" />
           
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           
           <asp:Button ID="Button1" runat="server" Text="返回" onclick="Button1_Click" 
               Width="74px" />
            </td></tr>


       <tr><td align=center colspan=4 style="height: 18px">
           &nbsp;</td></tr>


     </table>
     </td>
    <td background="images/main_42.gif" style="width:3px;"></td>
  </tr>
</table>
    </form>
</body>
</html>
