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
using System.Collections;

namespace DeviceInfoManage.DataAccessHelper
{
    public class SqlString
    {
        public static String GetSafeSqlString(String Str)
        {
            return Str.Replace("'", "''");
        }

        public static String GetQuotedString(String Str)
        {
            return ("'" + GetSafeSqlString(Str) + "'");
        }
    }

}

