<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewDeviceAdd.aspx.cs" Inherits="NewDeviceAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .STYLE1
        {
            color: #FF0000;
        }
        body, td, th
        {
            font-size: 9pt;
        }
        body
        {
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
       
      
       
        .style6
        {
            width: 545px;
            text-align: right;
        }
       
      
       
        .style7
        {
            width: 398px;
        }
        .style8
        {
        }
        .style9
        {
            width: 435px;
            text-align: right;
        }
       
      
       
    </style>
</head>
<body>
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
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" 
       >
        <tr>
            <td background="images/main_40.gif" style="width: 3px;">
            </td>
            <td style="border-right: solid 1px #9ad452;">
                <table border="0" cellpadding="0" cellspacing="0" align="center" 
                    style="width: 963px">
                    <tr>
                        <td class="style5" colspan="2">
                        </td>
                    </tr>
                    <tr>
                        <td class="style5" colspan="2">
                            添加新设备
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 14px; width: 800px;" colspan="2">
                            <table width ="900">
                                <tr>
                                    <td class="style9">
                                        设备名称：
                                    </td>
                                    <td class="style7">
                                        <asp:TextBox ID="DeviceName" runat="server" Width="117px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="设备名称必填!"
                                            Width="79px" ControlToValidate="DeviceName" ValidationGroup="BtnAdd"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="style6" >
                                        设备类型：
                                    </td>
                                    <td class="style8">
                                        <asp:DropDownList ID="DeviceType" runat="server" DataSourceID="DeviceTypeDataSource" Width="117px"
                                            DataTextField="deviceTypeName" DataValueField="deviceTypeId">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style9">
                                        设备型号：
                                    </td>
                                    <td class="style7">
                                        <asp:TextBox ID="DeviceModel" runat="server" Width="117px"></asp:TextBox>
                                    </td>
                                    <td class="style6">
                                        设备牌名：
                                    </td>
                                    <td class="style8">
                                        <asp:TextBox ID="DeviceSign" runat="server" Width="117px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style9">
                                        设备序列号：
                                    </td>
                                    <td class="style7">
                                        <asp:TextBox ID="DeviceSerialNumber" runat="server" Width="117px"></asp:TextBox>
                                    </td>
                                    <td class="style6">
                                        生产厂家：
                                    </td>
                                    <td class="style8">
                                        <asp:TextBox ID="DeviceMadePlace" runat="server" Width="117px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style9">
                                        出厂时间：
                                    </td>
                                    <td class="style7">
                                        <asp:TextBox ID="DeviceOutDate" runat="server" Width="117px"></asp:TextBox>
                                        <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66"
                                            BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                                            ForeColor="#663399" Height="200px" OnSelectionChanged="Calendar1_SelectionChanged"
                                            ShowGridLines="True" Visible="False" Width="220px">
                                            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                                            <SelectorStyle BackColor="#FFCC66" />
                                            <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                                            <OtherMonthDayStyle ForeColor="#CC9966" />
                                            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                                            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                                            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                                        </asp:Calendar>
                                        <asp:Button ID="Button1" runat="server" Text="选择" OnClick="Button1_Click" Style="height: 26px" />
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="DeviceOutDate"
                                            ErrorMessage="出厂日期格式不正确!" Operator="DataTypeCheck" Type="Date" ValidationGroup="BtnAdd"></asp:CompareValidator>
                                    </td>
                                    <td class="style6">
                                        购买时间：
                                    </td>
                                    <td class="style8">
                                        <asp:TextBox ID="DevicePurchaseTime" runat="server" Width="117px"></asp:TextBox>
                                        <asp:Calendar ID="Calendar2" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66"
                                            BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                                            ForeColor="#663399" Height="200px" OnSelectionChanged="Calendar2_SelectionChanged"
                                            ShowGridLines="True" Visible="False" Width="220px">
                                            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                                            <SelectorStyle BackColor="#FFCC66" />
                                            <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                                            <OtherMonthDayStyle ForeColor="#CC9966" />
                                            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                                            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                                            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                                        </asp:Calendar>
                                        <asp:Button ID="Button2" runat="server" Text="选择" OnClick="Button2_Click" />
                                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="DevicePurchaseTime"
                                            ErrorMessage="购买时间格式不正确!" Operator="DataTypeCheck" Type="Date" ValidationGroup="BtnAdd"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DevicePurchaseTime"
                                            ErrorMessage="购买时间必填!" Width="107px" ValidationGroup="BtnAdd"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style9" >
                                        上传图片：</td><td class="style7"><asp:FileUpload ID="DeviceImageUpload" runat="server" Width="207px" /><asp:Button
                                            ID="BtnUpload" runat="server" Text="上传" OnClick="BtnUpload_Click" /></td>
                                    <td class="style6">
                                        图片路径：</td><td class="style8"><asp:TextBox ID="DeviceImagePath" runat="server" ReadOnly="True" Width="248px"
                                            Enabled="False"></asp:TextBox>
                                        <asp:Image ID="DeviceImage" runat="server" Height="90px" Width="99px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td  style="height: 61px; text-align: right;" valign="top">
                                        备&nbsp;&nbsp;&nbsp;&nbsp; 注：</td><td colspan="3">
                                        <asp:TextBox ID="deviceNotes" runat="server" Height="76px" Width="333px" 
                                            TextMode="MultiLine"></asp:TextBox></td> </tr> 
                                        <tr style="color: blue; font-size: 14px;">
                                            <td colspan="4" style="height: 18px" align="center">
                                                &nbsp;</td>
                                        </tr>
                                        <tr style="color: blue; font-size: 14px;">
                                            <td colspan="4" style="height: 18px" align="center">
                                                <asp:Button ID="BtnAdd" runat="server" Text="提交" OnClick="BtnAdd_Click"  
                                                    Width ="73" style="height: 26px"/>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:Button ID="BtnCancle" runat="server" Text="取消" OnClick="BtnCancle_Click" Width ="73" />
                                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">返回首页</asp:HyperLink>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </td>
                                        </tr>
                            </table>
                        </td>
                        </tr>
                </table>
            </td>
            <td background="images/main_42.gif" style="width: 3px;">
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="DeviceTypeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT [deviceTypeId], [deviceTypeName] FROM [deviceType]"></asp:SqlDataSource>
    </form>
</body>
</html>
