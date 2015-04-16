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

public partial class DeviceTypeUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Session["adminUserName"] == null)
            {
                Response.Redirect("MainPage.aspx");
            }
            string deviceTypeId = Request.QueryString["deviceTypeId"];
            this.DeviceTypeName.Text = (new DeviceType()).GetDeviceTypeName(Int32.Parse(deviceTypeId));
        }

    }
    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        int deviceTypeId =Convert .ToInt32(Request.QueryString["deviceTypeId"]);
        Response.Write(deviceTypeId);
        string deviceTypeName = this.DeviceTypeName.Text;
        DataClassesDataContext dc = new DataClassesDataContext();
        deviceType dt = dc.deviceType.Single(c => c.deviceTypeId == deviceTypeId);
        dt.deviceTypeName=deviceTypeName;
        dc.SubmitChanges();
        //var rusult = from s in dc.deviceType
        //             where s.deviceTypeId ==deviceTypeId
        //             select s;
        //foreach (deviceType d in rusult){
        //    d.deviceTypeName=deviceTypeName;
        //    
        //}
        
        //DeviceType deviceType = new DeviceType();
        //if (!deviceType.UpdateDeviceType(Int32.Parse(deviceTypeId), deviceTypeName))
        //    Response.Write("<script>alert('" + deviceType.ErrMessage + "');</script>");
        //else
        Response.Write("<script>alert('修改成功!');location.href='DeviceTypeManage.aspx';</script>");
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("DeviceTypeManage.aspx");
    }
}
