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
public partial class DeviceRepairhandle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {   
        if(!IsPostBack)
        {
            if (Session["adminUserName"] == null)
            {
                Response.Redirect("MainPage.aspx");
            }
            string repairId = Request.QueryString["repairId"];
            RepairInfo repairinfo = new RepairInfo();
            repairinfo.GetRepairInfo(Int32.Parse(repairId));
            this.DeviceName.Text = (new DeviceInfo()).GetDeviceName(Convert.ToInt32(repairinfo.DeviceId));
            this.DeviceTypeName.Text = (new DeviceType()).GetDeviceType(Convert.ToInt32(repairinfo.DeviceId));
            this.RepairPlace.Text = repairinfo.RepairPlace;
            this.RepairMan.Text = repairinfo.RepairMan;
            this.RepairReason.Text = repairinfo.RepairReason;
            this.RepairNotes.Text = repairinfo.RepairNotes;
            string deviceImagePath = (new DeviceInfo()).GetDeviceImagePath(repairinfo.DeviceId);
            if (deviceImagePath != "")
                this.DeviceImage.ImageUrl = deviceImagePath;
            else
                this.DeviceImage.ImageUrl = "images\\noImage.jpg";
        }
    }

   
    protected void BtnRepair_Click(object sender, EventArgs e)
    {

        RepairInfo repairinfo = new RepairInfo();
        repairinfo.RepairId = Convert.ToInt32(Request.QueryString["repairId"]);
        repairinfo.RepairMan = this.RepairMan.Text;
        repairinfo.RepairReason = this.RepairReason.Text;
        repairinfo.RepairEndTime = Convert.ToDateTime(this.RepairEndTime.Text);
        repairinfo.RepairTime = Convert.ToSingle(this.RepairTime.Text);
        repairinfo.RepairMoney = Convert.ToSingle(this.RepairMoney.Text);
        repairinfo.RepairNotes = this.RepairNotes.Text;
        if (repairinfo.UpdateRepairInfo())
            Response.Write("<script>alert('设备维修成功!');location.href='DeviceRepairManage.aspx';</script>");

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("DeviceRepairManage.aspx");
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        RepairEndTime.Text = Calendar1.SelectedDate.ToString();
        Calendar1.Visible = false;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
    }
}
