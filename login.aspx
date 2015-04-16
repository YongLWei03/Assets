<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="DeviceInfoManage.login" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>设备管理系统</title>
    <link rel="Stylesheet" type="text/css" href="css/style.css" />
    <style type="text/css">
        body
        {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
            overflow: hidden;
        }
      
    
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td bgcolor="#e5f6cf">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td bgcolor="#e5f6cf">
                <asp:Menu ID="Menu1" runat="server" Width="100%" BackColor="#73ab29 " DynamicHorizontalOffset="2"
                    Font-Names="Verdana" Font-Size="18px" Orientation="Horizontal" ForeColor="#ffffff"
                    StaticSubMenuIndent="10px" Height="28px" Visible="False">
                    <StaticSelectedStyle BackColor="#1C5E55" />
                    <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                    <DynamicHoverStyle BackColor="#666666" ForeColor="White" />
                    <DynamicMenuStyle BackColor="#96f618" />
                    <DynamicSelectedStyle BackColor="#1C5E55" />
                    <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                    <StaticHoverStyle BackColor="#666666" ForeColor="White" />
                    <Items>
                        <asp:MenuItem Text="首页" Value="首页"></asp:MenuItem>
                        <asp:MenuItem Text="设备管理" Value="设备管理">
                            <asp:MenuItem NavigateUrl="~/NewDeviceAdd.aspx" Text="添加新设备" Value="添加新设备"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/DeviceManage.aspx" Text="更新设备信息" Value="更新设备信息"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/DeviceTypeManage.aspx" Text="管理设备类型" Value="管理设备类型">
                            </asp:MenuItem>
                        </asp:MenuItem>
                        <asp:MenuItem Text="管理设备维修" Value="管理设备维修">
                            <asp:MenuItem NavigateUrl="~/DeviceRepair.aspx" Text="设备维修登记" Value="设备送修登记"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/DeviceRepairManage.aspx" Text="查询设备维修" Value="新建项">
                            </asp:MenuItem>
                        </asp:MenuItem>
                        <asp:MenuItem Text="管理设备报废" Value="管理设备报废">
                            <asp:MenuItem NavigateUrl="~/DeviceRejectQuery.aspx" Text="查询设备报废" Value="查询设备报废">
                            </asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/DeviceRejecthAdd.aspx" Text="设备报废登记" Value="设备报废登记">
                            </asp:MenuItem>
                        </asp:MenuItem>
                        <asp:MenuItem Text="设备借还管理" Value="设备借还管理">
                            <asp:MenuItem NavigateUrl="~/DeviceLend.aspx" Text="登记设备借出" Value="登记设备借出"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/DeviceLendManage.aspx" Text="登记设备归还" Value="登记设备归还">
                            </asp:MenuItem>
                        </asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/ChangePassword.aspx" Text="修改密码" Value="修改密码"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/login.aspx" Text="退出" Value="退出"></asp:MenuItem>
                    </Items>
                </asp:Menu>
            </td>
        </tr>
        <tr>
            <td bgcolor="#e5f6cf" style="font-size :small ; color :#73ab29 " height="27">
               <div style =" float :left  ;  margin-left :15px">
                操作员：<asp:Label ID="Operator" runat="server" Text="游客"></asp:Label></div> 
                <div style =" float :right ; margin-right :15px">
                登录时间：<asp:Label ID="LoginTime" runat="server" Text="Label"></asp:Label></div> 
            </td>
        </tr>
        <tr>
            <td height="608" background="images/login_03.gif">
                <table width="862" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td height="266" background="images/login_04.gif">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td height="95">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="424" height="95" background="images/login_06.gif">
                                        &nbsp;
                                    </td>
                                    <td width="183" background="images/login_07.gif">
                                        <table border="0" cellspacing="0" cellpadding="0" 
                                            style="width: 113%; height: 68px;">
                                            <tr>
                                                <td width="19%"   height="30">
                                                    <div align="center">
                                                        <span class="STYLE3">用 户</span></div>
                                                </td>
                                                <td width="81%" class="style1"  >
                                                    <asp:TextBox ID="adminUserName" runat="server" Style=" width: 110px;height: 18px;
                                                        border: solid 1px #cadcb2; font-size: 12px;"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="adminUserName"
                                                 Font-Size="X-Small"       ErrorMessage=" 帐号必填!"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td   height="30">
                                                    <div align="center">
                                                        <span class="STYLE3">密 码</span></div>
                                                </td>
                                                <td >
                                                    <asp:TextBox ID="adminPassword" runat="server" TextMode="Password" Style="height: 18px;
                                                        width: 110px; border: solid 1px #cadcb2; font-size: 12px; "></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="adminPassword"
                                                        ErrorMessage="密码必填!" Font-Size="X-Small"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="30">
                                                    <div align="center">
                                                        <span class="STYLE3">验证码</span></div>
                                                </td>
                                                <td >
                                                    <asp:TextBox ID="Validator" runat="server" Width="62px" Style="height: 18px;
                                                        width: 62px; border: solid 1px #cadcb2; font-size: 12px;"></asp:TextBox>
                                                    <asp:ImageButton ID="ChangeCode" runat="server" CausesValidation="False" Height="20px"
                                                        ImageUrl="RandomImage.aspx" OnClick="ChangeCode_Click" ToolTip="看不清楚？点击图片换一个验证码"
                                                        Width="55px" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="255" background="images/login_08.gif">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="247" valign="top" background="images/login_09.gif">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="22%" height="30">
                                        &nbsp;
                                    </td>
                                    <td width="56%">
                                        &nbsp;
                                    </td>
                                    <td width="22%">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td height="30">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="44%" height="20" style="text-align: right">
                                                 
                                                    <asp:Button ID="Btn_Login" runat="server" Enabled="false"  OnClick="Btn_Login_Click" Text="登录" Width="61" />
                                                </td>
                                                <td width="56%" >
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:Button ID="Btn_Cancle" runat="server"  Enabled="false" OnClick="Btn_Cancle_Click" Text="取消" Width="61"
                                                        />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td bgcolor="#a2d962">
                &nbsp;
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
