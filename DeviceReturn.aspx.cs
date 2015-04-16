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
public partial class DeviceReturn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["adminUserName"] == null)
            {
                Response.Redirect("MainPage.aspx");
            }
            string lendId = Request.QueryString["lendId"];
            LendInfo lendInfo = new LendInfo();
            lendInfo.GetLendInfo(Int32.Parse(lendId));
            this.DeviceType.Text = (new DeviceType()).GetDeviceType(lendInfo.DeviceId);
            this.DeviceName.Text = (new DeviceInfo()).GetDeviceName1(Convert.ToInt32(lendId));
            this.LendDepartment.Text = (new Department()).GetDepartmentName(lendInfo.LendDepartmentId);
            this.LendPerson.Text = lendInfo.LendPerson;
            this.LendDate.Text = lendInfo.LendDate.ToShortDateString();
            this.LendDays.Text = lendInfo.LendDays.ToString();

            string deviceImagePath = (new DeviceInfo()).GetDeviceImagePath(lendInfo.DeviceId);
            if (deviceImagePath != "")
                this.DeviceImage.ImageUrl = deviceImagePath;
            else
                this.DeviceImage.ImageUrl = "iamges\\noImage.jpg";
          
            
        }

    }

    protected void BtnReturnBack_Click(object sender, EventArgs e)
    {
        string lendId = Request.QueryString["lendId"];
        string returnDate = this.ReturnDate.Text;
        if (returnDate == "")
        {
            Response.Write("<script>alert('请选择归还日期!');</script>");
            return;
        }
        LendInfo lendInfo = new LendInfo();
        if (lendInfo.UpdateLendInfo(Int32.Parse(lendId), Convert.ToDateTime(returnDate)))
        {
            Response.Write("<script>alert('设备归还成功!');location.href='DeviceLendManage.aspx';</script>");
        }
    }
    protected void BtnCancle_Click(object sender, EventArgs e)
    {
        Response.Redirect("DeviceLendManage.aspx");
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        ReturnDate.Text = Calendar1.SelectedDate.ToString();
        Calendar1.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
    }
   


}
