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

using DeviceInfoManage.BusinessLogicLayer;
public partial class DeviceTypeManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["adminUserName"] == null)
            {
                Response.Redirect("MainPage.aspx");
            }
        }    
    }
    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        string DeviceTypeName = this.DeviceTypeName.Text;
        DataClassesDataContext dc = new DataClassesDataContext();
        deviceType dt = new deviceType ();
        dt.deviceTypeName = DeviceTypeName;
        dc.deviceType.InsertOnSubmit(dt);
        dc.SubmitChanges();
        this.Page.DataBind();
        //DeviceType deviceType = new DeviceType();
        //if (deviceType.AddDeviceType(DeviceTypeName))
        //    Response.Write("<script>alert('设备新类别信息添加成功!');location.href='DeviceTypeManage.aspx';</script>");
        //else
        //    Response.Write("<script>alert('" + deviceType.ErrMessage + "');</script>");
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "color=this.style.backgroundColor;this.style.backgroundColor='#51b2f6';");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=color;");
        }
    }
}
