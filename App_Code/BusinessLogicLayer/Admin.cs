using System;
using System.Data;
using System.Collections;
using System.Data.SqlClient;
using System.Linq;
using DeviceInfoManage.DataAccessLayer;
using DeviceInfoManage.DataAccessHelper;


namespace DeviceInfoManage.BusinessLogicLayer
{
   
    public class Admin
    {
        private string adminUserName; 
        private string adminPassword; 
        private string errMessage;   

        #region MyRegion
        public string AdminUserName
        {
            set
            {
                this.adminUserName = value;
            }
            get
            {
                return this.adminUserName;
            }
        }

        public string AdminPassword
        {
            set
            {
                this.adminPassword = value;
            }
            get
            {
                return this.adminPassword;
            }
        }

        public string ErrMessage
        {
            set
            {
                this.errMessage = value;
            }
            get
            {
                return this.errMessage;
            }
        }
        #endregion
        
        public bool checkAdmin() {
            string str;
            bool hasUser,isPasswordRight;
            //下载于51aspx.com
            str = "select * from admin where adminUserName = " + SqlString.GetQuotedString(this.adminUserName);
            DataBase db = new DataBase();
            hasUser = db.GetRecord(str);
            if (false == hasUser)
            {
                errMessage = "抱歉，用户名不存在!";
                return false;
            }
            //下载于51aspx.com
            str = "select * from admin where adminUserName = " + SqlString.GetQuotedString(this.adminUserName);
            str = str + " and adminPassword = " + SqlString.GetQuotedString(this.adminPassword);
            isPasswordRight = db.GetRecord(str);
            if (false == isPasswordRight)
            {
                errMessage = "抱歉，用户密码不正确!";
                return false;
            }

            return true;
        }

        public bool ChangePassword()
        {//下载于51aspx.com
            string str = "update admin set adminPassword=" + SqlString.GetQuotedString(adminPassword);
            str += " where adminUserName=" + SqlString.GetQuotedString(adminUserName);

            DataBase db = new DataBase();
            if (db.InsertOrUpdate(str) < 0)
                return false;
            return true;
        }
    }
}

