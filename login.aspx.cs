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

namespace DeviceInfoManage
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!Object.Equals(Request.Cookies["adminUserName"], null))
                {
                    HttpCookie adminUserNameCookie = Request.Cookies["adminUserName"];
                    this.adminUserName.Text = adminUserNameCookie.Value;
                    this.Menu1.Visible = true;
                    this.Operator.Text = adminUserNameCookie.Value;
                    this.LoginTime.Text = DateTime.Now.ToString();
                }
                else
                {
                    this.Menu1.Visible = false;

                }

            }
        }

        protected void ChangeCode_Click(object sender, ImageClickEventArgs e)
        {
            this.ChangeCode.ImageUrl = "RandomImage.aspx";
        }

        protected void Btn_Login_Click(object sender, EventArgs e)
        {
            if (String.Compare(Session["Code"].ToString(), this.Validator.Text, true) != 0)
            {
                Response.Write("<script>alert('抱歉,输入的验证码不正确!');</script>");
                return;
            }
      
            Admin admin = new Admin();
            admin.AdminUserName = this.adminUserName.Text.Trim();
            admin.AdminPassword = this.adminPassword.Text.Trim();
            if (admin.checkAdmin())
            {
                CreateCookie();
                Session["adminUserName"] = admin.AdminUserName;
                Session.Timeout = 10;
                Response.Redirect("MainPage.aspx");
            }
            else 
            {
                Response.Write("<script>alert('" + admin.ErrMessage + "');</script>");
            }
           
        }
        protected void Btn_Cancle_Click(object sender, EventArgs e)
        {
            this.adminUserName.Text = "";
            this.adminPassword.Text = "";
            this.Validator.Text = "";
            this.ChangeCode.ImageUrl = "RandomImage.aspx";
        }

        private void CreateCookie()
        {
            HttpCookie adminUserNameCookie = new HttpCookie("adminUserName");
            adminUserNameCookie.Value = this.adminUserName.Text;
            adminUserNameCookie.Expires = DateTime.MaxValue;
            Response.AppendCookie(adminUserNameCookie);
        }
}

}
