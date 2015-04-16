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
public partial class DeviceTypeDelete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["adminUserName"] == null)
        //{
        //    Response.Redirect("MainPage.aspx");
        //}
        int deviceTypeId = Convert.ToInt32(Request.QueryString["deviceTypeId"]);
        DataClassesDataContext dc = new DataClassesDataContext();
        var rusult = from s in dc.deviceType
                     where s.deviceTypeId == deviceTypeId
                     select s;
        foreach (deviceType d in rusult)
        {
            dc.deviceType.DeleteOnSubmit(d);
        }
        dc.SubmitChanges(); 
        //DeviceType deviceType = new DeviceType();
        //if (deviceType.DeleteDeviceType(Int32.Parse(deviceTypeId)))
           Response.Write("<script>alert('设备类型删除成功!');location.href='DeviceTypeManage.aspx';</script>");
        //else
        //    Response.Write("<script>alert('" + deviceType.ErrMessage + "');location.href='DeviceTypeManage.aspx';</script>");
    }
}
