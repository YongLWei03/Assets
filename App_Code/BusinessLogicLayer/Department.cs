using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Linq;
using DeviceInfoManage.DataAccessHelper;
using DeviceInfoManage.DataAccessLayer;

public class Department
{
	public Department()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public string GetDepartmentName(int departmentId)
    {
        string str = "select departmentName from departmentInfo where departmentId = " + departmentId;
        DataSet ds = (new DataBase()).GetDataSet(str);
        return ds.Tables[0].Rows[0]["departmentName"].ToString();
    }
}
