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
public partial class DeviceUpdate : System.Web.UI.Page
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
            this.DeviceType.DataTextField = "deviceTypeName";
            this.DeviceType.DataValueField = "deviceTypeId";
            this.DeviceType.DataBind(); ;
            string deviceId = Request.QueryString["deviceId"];
            DeviceInfo device = new DeviceInfo();
            device.GetDeviceInfo(Int32.Parse(deviceId));
            this.DeviceName.Text = device.DeviceName;
            this.DeviceType.Text = (new DeviceType()).GetDeviceTypeName(device.DeviceTypeId);
            this.DeviceSign.Text = device.DeviceSign;
            this.DeviceModel.Text = device.DeviceModel;
            this.DeviceSerialNumber.Text = device.DeviceSerialNumber;
            this.DeviceMadePlace.Text = device.DeviceMadePlace;
            this.DeviceOutDate.Text = device.DeviceOutDate.ToShortDateString();
            this.DevicePurchaseTime.Text = device.DevicePurchaseTime.ToShortDateString();
            if (device.DeviceImagePath != "")
            {
                this.DeviceImagePath.Text = device.DeviceImagePath;
                this.DeviceImage.ImageUrl = device.DeviceImagePath;
            }
            else
                this.DeviceImage.ImageUrl = "images\\noImage.jpg";

            this.deviceNotes.Text = device.DeviceNotes;
        }

    }
    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        DeviceInfo device = new DeviceInfo();
        device.DeviceId = Convert.ToInt32(Request.QueryString["deviceId"]);
        device.DeviceName = this.DeviceName.Text;
        device.DeviceTypeId = Int32.Parse(this.DeviceType.SelectedValue);
        device.DeviceSign = this.DeviceSign.Text;
        device.DeviceModel = this.DeviceModel.Text;
        device.DeviceSerialNumber = this.DeviceSerialNumber.Text;
        device.DeviceImagePath = this.DeviceImagePath.Text;
        device.DeviceMadePlace = this.DeviceMadePlace.Text;
        if (this.DeviceOutDate.Text != "")
            device.DeviceOutDate = Convert.ToDateTime(this.DeviceOutDate.Text);
        device.DevicePurchaseTime = Convert.ToDateTime(this.DevicePurchaseTime.Text);
        device.DeviceNotes = this.deviceNotes.Text;

        if (device.DeviceInfoUpdate(Server.MapPath("")))
            Response.Write("<script>alert('设备信息更新成功!');</script>");
        else
            Response.Write("<script>alert('" + device.ErrMessage + "');</script>");

        
    }
    protected void BtnUpload_Click(object sender, EventArgs e)
    {
        if (this.DeviceImageUpload.PostedFile.ContentLength > 0)
        {
            string type = this.DeviceImageUpload.PostedFile.ContentType;
            if (String.Compare(type, "image/gif", true) == 0 || String.Compare(type, "image/pjpeg", true) == 0)
            {
                this.DeviceImagePath.Text = "文件上传中....";
                string extFileString = System.IO.Path.GetExtension(this.DeviceImageUpload.PostedFile.FileName); /*获取文件扩展名*/
                string saveFileName = this.MakeFileName(extFileString); 
                string imagePath = "deviceImages\\" + saveFileName;
                this.DeviceImageUpload.PostedFile.SaveAs(Server.MapPath(imagePath));
                this.DeviceImage.ImageUrl = imagePath;
                this.DeviceImagePath.Text = imagePath;
            }
            else
            {
                Response.Write("<script>alert('上传的文件格式不正确!');</script>");
            }
        }
    }

    private string MakeFileName(string filestring)
    {
        System.DateTime now = System.DateTime.Now;
        int year = now.Year;
        int month = now.Month;
        int day = now.Day;
        int hour = now.Hour;
        int minute = now.Minute;
        int second = now.Second;

        string yearString = year.ToString();
        string monthString = month < 10 ? ("0" + month) : month.ToString();
        string dayString = day < 10 ? ("0" + day) : day.ToString();
        string hourString = hour < 10 ? ("0" + hour) : hour.ToString();
        string minuteString = minute < 10 ? ("0" + minute) : minute.ToString();
        string secondString = second < 10 ? ("0" + second) : second.ToString();

        string fileName = yearString + monthString + dayString + hourString + minuteString + secondString + filestring;
        return fileName;
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("DeviceManage.aspx");
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        DeviceOutDate.Text = Calendar1.SelectedDate.ToString();
        Calendar1.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
    }
    protected void Calendar2_SelectionChanged(object sender, EventArgs e)
    {
        DevicePurchaseTime.Text = Calendar2.SelectedDate.ToString();
        Calendar2.Visible = false;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Calendar2.Visible = true;
    }
}
