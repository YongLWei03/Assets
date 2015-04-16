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

public partial class DeviceManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["adminUserName"] == null)
            {
                Response.Redirect("MainPage.aspx");
            }
            ListItem item = new ListItem("请选择", ""); 
            DataSet ds = (new DeviceType()).GetDeviceType();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                item = new ListItem(dr["deviceTypeName"].ToString(), dr["deviceTypeName"].ToString());
                this.DeviceType.Items.Add(item);
            }

        }

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "color=this.style.backgroundColor;this.style.backgroundColor='#51b2f6';");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=color;");
            e.Row.Cells[5].Text = Convert.ToDateTime(e.Row.Cells[5].Text).ToShortDateString();
        }
    }

    protected void BtnQuery_Click(object sender, EventArgs e)
    {
        string deviceName = this.DeviceName.Text;
        string deviceType = this.DeviceType.Text;
        string starttime = this.StartTime.Text;
        string endtime = this.EndTime.Text;

        this.GridView1.DataSourceID = null;
        this.GridView1.DataSource = (new DeviceInfo()).QueryDevice(deviceName, deviceType, starttime, endtime);
        this.GridView1.DataBind();
    }
}
