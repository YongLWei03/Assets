using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Linq; 
using DeviceInfoManage.BusinessLogicLayer;

public partial class DeviceRejecthAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["adminUserName"] == null)
            {
                Response.Redirect("MainPage.aspx");
            }
            this.DeviceType.DataSource = (new DeviceType()).GetDeviceType();
            this.DeviceType.DataValueField = "deviceTypeId";
            this.DeviceType.DataTextField = "deviceTypeName";
            this.DeviceType.DataBind();

            string deviceTypeId = this.DeviceType.Items[0].Value;
            DataSet ds = (new DeviceInfo()).QueryDevice(Int32.Parse(deviceTypeId));
            this.Device.DataSource = ds;
            this.Device.DataTextField = "deviceName";
            this.Device.DataValueField = "deviceId";
            this.Device.DataBind();
            if (this.Device.Items.Count == 0)
                this.DeviceImage.ImageUrl = "images/noImage.jpg";
            else
            {
                string deviceId = this.Device.Items[0].Value;
                string deviceImagePath = (new DeviceInfo()).GetDeviceImagePath(Int32.Parse(deviceId)); /*得到该设备的图片路径*/
                if (deviceImagePath == "")
                    this.DeviceImage.ImageUrl = "images/noImage.jpg";
                else
                    this.DeviceImage.ImageUrl = deviceImagePath;
            }
        }
    }
   
    protected void DeviceType_SelectedIndexChanged(object sender, EventArgs e)
    {

        string deviceTypeId = this.DeviceType.SelectedValue;
        DataSet ds = (new DeviceInfo()).QueryDevice(Int32.Parse(deviceTypeId));
        this.Device.DataSource = ds;
        this.Device.DataTextField = "deviceName";
        this.Device.DataValueField = "deviceId";
        this.Device.DataBind();
        if (this.Device.Items.Count == 0)
            this.DeviceImage.ImageUrl = "images/noImage.jpg";
        else
        {
            string deviceId = this.Device.Items[0].Value;
            string deviceImagePath = (new DeviceInfo()).GetDeviceImagePath(Int32.Parse(deviceId)); /*得到该设备的图片路径*/
            if (deviceImagePath == "")
                this.DeviceImage.ImageUrl = "images/noImage.jpg";
            else
                this.DeviceImage.ImageUrl = deviceImagePath;
        }

    }

    protected void Device_SelectedIndexChanged(object sender, EventArgs e)
    {
        string deviceId = this.Device.SelectedValue;
        string deviceImagePath = (new DeviceInfo()).GetDeviceImagePath(Int32.Parse(deviceId)); /*得到该设备的图片路径*/
        if (deviceImagePath == "")
            this.DeviceImage.ImageUrl = "images/noImage.jpg";
        else
            this.DeviceImage.ImageUrl = deviceImagePath;
    }
    protected void BtnRubbish_Click(object sender, EventArgs e)
    {
        RejectInfo rubbishInfo = new RejectInfo();
        if (this.Device.SelectedValue == "")
        {
            Response.Write("<script>alert('抱歉，请选择设备!');</script>");
            return;
        }
        rubbishInfo.DeviceId = Int32.Parse(this.Device.SelectedValue);
        rubbishInfo.DeviceRejectTime = Convert.ToDateTime(this.DeviceRejectTime.Text);
        rubbishInfo.DeviceRejectReason = this.DeviceRejectReason.Text;
        rubbishInfo.DepreciationMoney = Convert.ToSingle(this.DepreciationMoney.Text);
        if (rubbishInfo.AddDeviceRejectInfo())
            Response.Write("<script>alert('设备报废处理成功!')</script>");
        else
            Response.Write("<script>alert('" + rubbishInfo.ErrMessage + "');</script>");

    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        DeviceRejectTime.Text = Calendar1.SelectedDate.ToString();
        Calendar1.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
    }
}
