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

public partial class DeviceRejectQuery : System.Web.UI.Page
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
    protected void BtnQuery_Click(object sender, EventArgs e)
    {
        string deviceName = this.DeviceName.Text;
        string deviceType = this.DeviceType.Text;
        string startTime = this.StartTime.Text;
        string endTime = this.EndTime.Text;

        this.GridView1.DataSourceID = null;
        this.GridView1.DataSource = (new RejectInfo()).QueryRejectInfo(deviceName, deviceType, startTime, endTime);
        this.GridView1.DataBind();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "color=this.style.backgroundColor;this.style.backgroundColor='#51b2f6';");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=color;");
            e.Row.Cells[2].Text = Convert.ToDateTime(e.Row.Cells[2].Text).ToShortDateString();
        }
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        StartTime.Text = Calendar1.SelectedDate.ToString();
        Calendar1.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
    }
    protected void Calendar2_SelectionChanged(object sender, EventArgs e)
    {
        EndTime.Text = Calendar2.SelectedDate.ToString();
        Calendar2.Visible = false ;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Calendar2.Visible = true;
    }
}
