<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DeviceTypeUpdate.aspx.cs" Inherits="DeviceTypeUpdate" %>

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
        .style6
        {
            text-align: center;
        }
    </style>
</head>
<body >
    <form method="post" name=form1 runat="server">
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
      <table width=100% border=0 cellpadding=0 cellspacing=0 align="center">
        <tr>
	  <td class="style5">修改设备类型</td>
        </tr>
        <tr style="color:blue;font-size:14px;">
	  <td style="height: 14px" class="style6">
          <br />
          设备类型名称:<asp:TextBox ID="DeviceTypeName" runat="server" Width="124px"></asp:TextBox>
          <asp:Button ID="BtnUpdate" runat="server" OnClick="BtnUpdate_Click" Text="更新" />
          <asp:Button ID="BtnBack" runat="server" Text="返回" onclick="BtnBack_Click" />          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="设备类型名称必填!" ControlToValidate="DeviceTypeName"></asp:RequiredFieldValidator>

                  </td>
        </tr>
      </table>
      </td>
    <td background="images/main_42.gif" style="width:3px;">&nbsp;</td>
  </tr>
</table>
    </form>
</body>
</html>
