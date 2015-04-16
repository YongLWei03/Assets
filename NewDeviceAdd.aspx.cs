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

public partial class NewDeviceAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["adminUserName"] == null)
            {
                Response.Redirect("MainPage.aspx");
            }
            this.DeviceImage.ImageUrl = "Images\\noImage.jpg";
        }
    }

    protected void BtnUpload_Click(object sender, EventArgs e)
    {
        if(this.DeviceImageUpload.PostedFile.ContentLength > 0)
        {
            string type = this.DeviceImageUpload.PostedFile.ContentType;
            if(String.Compare(type,"image/gif",true) == 0 || String.Compare(type,"image/pjpeg",true) == 0)
            {
                this.DeviceImagePath.Text = "文件上传中....";
                string extFileString = System.IO.Path.GetExtension(this.DeviceImageUpload.PostedFile.FileName); 
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

    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        DeviceInfo device = new DeviceInfo();
        device.DeviceName = this.DeviceName.Text;
        device.DeviceTypeId = Int32.Parse(this.DeviceType.SelectedValue);
        device.DeviceSign = this.DeviceSign.Text;
        device.DeviceModel = this.DeviceModel.Text;
        device.DeviceSerialNumber = this.DeviceSerialNumber.Text;
        device.DeviceImagePath = this.DeviceImagePath.Text;
        device.DeviceMadePlace = this.DeviceMadePlace.Text;
        if(this.DeviceOutDate.Text != "")
            device.DeviceOutDate = Convert.ToDateTime(this.DeviceOutDate.Text);
        device.DevicePurchaseTime = Convert.ToDateTime(this.DevicePurchaseTime.Text);
        device.DeviceNotes = this.deviceNotes.Text;

        if (device.NewDeviceAdd())
            Response.Write("<script>alert('设备添加成功!')</script>");
        else
            Response.Write("<script>alert('" + device.ErrMessage + "');</script>");

    }

    private string MakeFileName(string exeFileString)
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

        string fileName = yearString + monthString + dayString + hourString + minuteString + secondString + exeFileString;
        return fileName;
    }

    protected void BtnCancle_Click(object sender, EventArgs e)
    {
        this.DeviceName.Text = "";
        this.DeviceSign.Text = "";
        this.DeviceModel.Text = "";
        this.DeviceSerialNumber.Text = "";
        this.DeviceImagePath.Text = "";
        this.DeviceMadePlace.Text = "";
        this.deviceNotes.Text = "";
        this.DeviceOutDate.Text = "";
        this.DevicePurchaseTime.Text = "";
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
