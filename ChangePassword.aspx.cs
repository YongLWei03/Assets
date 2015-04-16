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

public partial class ChangePassword : System.Web.UI.Page
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
    protected void BtnChangePassword_Click(object sender, EventArgs e)
    {
        Admin admin = new Admin();
        admin.AdminUserName = Session["adminUserName"].ToString();
        admin.AdminPassword = this.NewPassword.Text.Trim();
        if (admin.ChangePassword())
            this.ErrMessage.Text = "修改密码成功!";
        else
            this.ErrMessage.Text = "修改密码失败!";
    }
}
