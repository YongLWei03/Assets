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

namespace DeviceInfoManage.BusinessLogicLayer
{
   
    public class DeviceType
    {
        private int deviceTypeId;           
        private string deviceTypeName;      
        private string errMessage;          
        #region MyRegion
        public int DeviceTypeId
        {
            set
            {
                this.deviceTypeId = value;
            }
            get
            {
                return this.deviceTypeId;
            }
        }
        public string DeviceTypeName
        {
            set
            {
                this.deviceTypeName = value;
            }
            get
            {
                return this.deviceTypeName;
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

        public DeviceType()
        {
            this.deviceTypeId = 0;
            this.deviceTypeName = "";
        }

        public bool AddDeviceType(string deviceTypeName)
        {
            DataBase db = new DataBase();
            string queryString = "select * from deviceType where deviceTypeName=" + SqlString.GetQuotedString(deviceTypeName);
            if (db.GetRecord(queryString))
            {
                this.errMessage = "该类型名称已存在!";
                return false;
            }
            string insertString = "insert into deviceType(deviceTypeName) values(" + SqlString.GetQuotedString(deviceTypeName) + ")";
            if (db.InsertOrUpdate(insertString) < 0)
            {
                this.errMessage = "添加设备类型失败！";
                return false;
            }
            return true;
        }

        public bool UpdateDeviceType(int deviceTypeId,string deviceTypeName)
        {
            DataBase db = new DataBase();
            string queryString = "select * from deviceType where deviceTypeName=" + SqlString.GetQuotedString(deviceTypeName);
            if (db.GetRecord(queryString))
            {
                this.errMessage = "该设备类型已存在!";
                return false;
            }
            string updateString = "update deviceType set deviceTypeName=" + SqlString.GetQuotedString(deviceTypeName);
            updateString += " where deviceTypeId=" + deviceTypeId.ToString();
            if (db.InsertOrUpdate(updateString) < 0)
            {
                this.errMessage = "修改类型名称失败！";
                return false;
            }
            return true;
        }

        public bool DeleteDeviceType(int deviceTypeId)
        {
            DataBase db = new DataBase();
            string queryString = "select * from deviceInfo where deviceTypeId=" + deviceTypeId;
            if(db.GetRecord(queryString))
            {
                this.errMessage = "该类型下还存在设备，不可以删除!";
                return false;
            }

            string deleteString = "delete from deviceType where deviceTypeId=" + deviceTypeId;
            if (db.InsertOrUpdate(deleteString) < 0)
            {
                this.errMessage = "删除设备类型失败!";
                return false;
            }
            return true;
        }

        public string GetDeviceTypeName(int deviceTypeId)
        {
            string queryString = "select deviceTypeName from deviceType where deviceTypeId=" + deviceTypeId;
            DataBase db = new DataBase();
            DataSet ds = db.GetDataSet(queryString);
            if (ds.Tables[0].Rows.Count == 0) return String.Empty;
            return ds.Tables[0].Rows[0]["deviceTypeName"].ToString();
        }

        public DataSet GetDeviceType()
        {
            string queryString = "select * from deviceType";
            DataBase db = new DataBase();
            return db.GetDataSet(queryString);
        }

        public string GetDeviceType(int deviceId)
        {
            string queryString = "select deviceTypeName from deviceType,deviceInfo where deviceInfo.deviceTypeId = deviceType.deviceTypeId and deviceInfo.deviceId=" + deviceId;
            DataBase db = new DataBase();
            DataSet ds = db.GetDataSet(queryString);
            return ds.Tables[0].Rows[0]["deviceTypeName"].ToString();
        }
    }

}
