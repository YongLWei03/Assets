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

public partial class DeviceLend : System.Web.UI.Page
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
                string deviceImagePath = (new DeviceInfo()).GetDeviceImagePath(Int32.Parse(deviceId)); 
                if (deviceImagePath == "")
                    this.DeviceImage.ImageUrl = "images/noImage.jpg";
                else
                    this.DeviceImage.ImageUrl = deviceImagePath;
            }

        }
    }

    protected void Device_SelectedIndexChanged(object sender, EventArgs e)
    {
        string deviceId = this.Device.SelectedValue;
        string deviceImagePath = (new DeviceInfo()).GetDeviceImagePath(Int32.Parse(deviceId)); 
        if (deviceImagePath == "")
            this.DeviceImage.ImageUrl = "images/noImage.jpg";
        else
            this.DeviceImage.ImageUrl = deviceImagePath;
    }

    protected void BtnLend_Click(object sender, EventArgs e)
    {
        LendInfo lendInfo = new LendInfo();
        if (this.Device.SelectedValue == "")
        {
            Response.Write("<script>alert('抱歉，请选择设备!');</script>");
            return;
        }
        lendInfo.DeviceId = Int32.Parse(this.Device.SelectedValue);
        lendInfo.LendDepartmentId = Int32.Parse(this.LendDepartment.SelectedValue);
        lendInfo.LendPerson = this.LendPerson.Text;
        lendInfo.LendDate = Convert.ToDateTime(LendDate.Text);
        lendInfo.LendDays = Convert.ToInt32(this.LendDays.Text);
        if (!lendInfo.AddLendInfo())
            Response.Write("<script>alert('" + lendInfo.ErrMessage + "');</script>");
        else
            Response.Write("<script>alert('借用设备成功!');location.href='DeviceLend.aspx';</script>");
    }
    
    protected void BtnCancle_Click(object sender, EventArgs e)
    {
        this.LendPerson.Text = ""; 
        this.LendDate.Text = "";   
        this.LendDays.Text = "";   
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


    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        LendDate.Text = Calendar1.SelectedDate.ToString();
        Calendar1.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
    }
}
