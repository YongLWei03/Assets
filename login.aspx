<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="DeviceInfoManage.login" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>�豸����ϵͳ</title>
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
                        <asp:MenuItem Text="��ҳ" Value="��ҳ"></asp:MenuItem>
                        <asp:MenuItem Text="�豸����" Value="�豸����">
                            <asp:MenuItem NavigateUrl="~/NewDeviceAdd.aspx" Text="������豸" Value="������豸"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/DeviceManage.aspx" Text="�����豸��Ϣ" Value="�����豸��Ϣ"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/DeviceTypeManage.aspx" Text="�����豸����" Value="�����豸����">
                            </asp:MenuItem>
                        </asp:MenuItem>
                        <asp:MenuItem Text="�����豸ά��" Value="�����豸ά��">
                            <asp:MenuItem NavigateUrl="~/DeviceRepair.aspx" Text="�豸ά�޵Ǽ�" Value="�豸���޵Ǽ�"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/DeviceRepairManage.aspx" Text="��ѯ�豸ά��" Value="�½���">
                            </asp:MenuItem>
                        </asp:MenuItem>
                        <asp:MenuItem Text="�����豸����" Value="�����豸����">
                            <asp:MenuItem NavigateUrl="~/DeviceRejectQuery.aspx" Text="��ѯ�豸����" Value="��ѯ�豸����">
                            </asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/DeviceRejecthAdd.aspx" Text="�豸���ϵǼ�" Value="�豸���ϵǼ�">
                            </asp:MenuItem>
                        </asp:MenuItem>
                        <asp:MenuItem Text="�豸�軹����" Value="�豸�軹����">
                            <asp:MenuItem NavigateUrl="~/DeviceLend.aspx" Text="�Ǽ��豸���" Value="�Ǽ��豸���"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/DeviceLendManage.aspx" Text="�Ǽ��豸�黹" Value="�Ǽ��豸�黹">
                            </asp:MenuItem>
                        </asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/ChangePassword.aspx" Text="�޸�����" Value="�޸�����"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/login.aspx" Text="�˳�" Value="�˳�"></asp:MenuItem>
                    </Items>
                </asp:Menu>
            </td>
        </tr>
        <tr>
            <td bgcolor="#e5f6cf" style="font-size :small ; color :#73ab29 " height="27">
               <div style =" float :left  ;  margin-left :15px">
                ����Ա��<asp:Label ID="Operator" runat="server" Text="�ο�"></asp:Label></div> 
                <div style =" float :right ; margin-right :15px">
                ��¼ʱ�䣺<asp:Label ID="LoginTime" runat="server" Text="Label"></asp:Label></div> 
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
                                                        <span class="STYLE3">�� ��</span></div>
                                                </td>
                                                <td width="81%" class="style1"  >
                                                    <asp:TextBox ID="adminUserName" runat="server" Style=" width: 110px;height: 18px;
                                                        border: solid 1px #cadcb2; font-size: 12px;"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="adminUserName"
                                                 Font-Size="X-Small"       ErrorMessage=" �ʺű���!"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td   height="30">
                                                    <div align="center">
                                                        <span class="STYLE3">�� ��</span></div>
                                                </td>
                                                <td >
                                                    <asp:TextBox ID="adminPassword" runat="server" TextMode="Password" Style="height: 18px;
                                                        width: 110px; border: solid 1px #cadcb2; font-size: 12px; "></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="adminPassword"
                                                        ErrorMessage="�������!" Font-Size="X-Small"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="30">
                                                    <div align="center">
                                                        <span class="STYLE3">��֤��</span></div>
                                                </td>
                                                <td >
                                                    <asp:TextBox ID="Validator" runat="server" Width="62px" Style="height: 18px;
                                                        width: 62px; border: solid 1px #cadcb2; font-size: 12px;"></asp:TextBox>
                                                    <asp:ImageButton ID="ChangeCode" runat="server" CausesValidation="False" Height="20px"
                                                        ImageUrl="RandomImage.aspx" OnClick="ChangeCode_Click" ToolTip="������������ͼƬ��һ����֤��"
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
                                                 
                                                    <asp:Button ID="Btn_Login" runat="server" Enabled="false"  OnClick="Btn_Login_Click" Text="��¼" Width="61" />
                                                </td>
                                                <td width="56%" >
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:Button ID="Btn_Cancle" runat="server"  Enabled="false" OnClick="Btn_Cancle_Click" Text="ȡ��" Width="61"
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
