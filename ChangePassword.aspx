<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
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
        .style1
        {
            font-weight: bold;
            font-size: large;
            text-align: center;
            color: #000000;
        }
        .style2
        {
            text-align: center;
        }
        .style3
        {
            font-weight: bold;
            font-size: large;
            text-align: center;
            color: #000000;
            height: 53px;
        }
        .style4
        {
            width: 305px;
        }
    </style>
</head>
<body >
     <form id="Form1" name="form1" method="post" runat="server">
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="97" height="9" background="images/main_01.gif">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
     
         <table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed;">
  <tr>
    <td height="9" style="line-height:9px; background-image:url(images/main_04.gif)">&nbsp;</td>
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
   <table  cellpadding="0" cellspacing="2" align="center" 
         style="height: 111px; width: 55%;">
<tr> 
    <td class="style3" ></td>
  </tr>
<tr> 
    <td class="style1" >修改密码</td>
  </tr>
<tr> 
    <td class="style1" ></td>
  </tr>
</table>
<table width="55%"  cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td>
	  <table width="487" border="1" cellspacing="1" cellpadding="2" align="center">
	
      <tr>
        <td class="style2">输入修改的密码:</td>
		    <td class="style4">
                <asp:TextBox ID="NewPassword" runat="server" TextMode="Password" Width="144px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NewPassword"
                    ErrorMessage="密码输入不能为空！"></asp:RequiredFieldValidator>
				</td>
      </tr>
		  <tr>
		    <td class="style2">确认修改的密码:</td>
			  <td class="style4">
                  <asp:TextBox ID="NewPasswordAgain" runat="server" TextMode="Password" Width="145px"></asp:TextBox>
                  <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="NewPassword"
                      ControlToValidate="NewPasswordAgain" ErrorMessage="两次密码输入不一致！"></asp:CompareValidator></td>
			</tr>
      <tr>
        <td height="30" colspan="4" class="style2" >
            <asp:Button ID="BtnChangePassword" runat="server" OnClick="BtnChangePassword_Click"
                Text="提交" Width="55px" />
            
            <asp:HyperLink ID="HyperLink1" runat="server" 
                NavigateUrl="Login.aspx">返回首页</asp:HyperLink>
            <br />
            <asp:Literal ID="ErrMessage" runat="server"></asp:Literal></td>
      </tr> 
	  </table>
	</td>
  </tr>	  	    
</table>
</td>
    <td background="images/main_42.gif" style="width:3px;">&nbsp;</td>
  </tr>
 </form>
</body>
</html>
