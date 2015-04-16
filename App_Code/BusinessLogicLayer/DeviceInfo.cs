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
    
    public class DeviceInfo
    {
        private int deviceId;              
        private string deviceName;          
        private int deviceTypeId;           
        private string deviceSign;          
        private string deviceModel;         
        private string deviceSerialNumber;  
        private string deviceImagePath;     
        private int deviceState;            
        private string deviceMadePlace;     
        private DateTime deviceOutDate;     
        private DateTime devicePurchaseTime;
        private string deviceNotes;          
        private string errMessage;          

        #region MyRegion
        public int DeviceId {
            set { this.deviceId = value; }
            get { return this.deviceId; }
        }
        public string DeviceName {
            set { this.deviceName = value; }
            get { return this.deviceName; }
        }
        public int DeviceTypeId {
            set { this.deviceTypeId = value; }
            get { return this.deviceTypeId; }
        }
        public string DeviceSign {
            set { this.deviceSign = value; }
            get { return this.deviceSign; }
        }
        public string DeviceModel {
            set { this.deviceModel = value; }
            get { return this.deviceModel; }
        }
        public string DeviceSerialNumber {
            set { this.deviceSerialNumber = value; }
            get { return this.deviceSerialNumber; }
        }
        public string DeviceImagePath {
            set { this.deviceImagePath = value; }
            get { return this.deviceImagePath; }
        }
        public int DeviceState
        {
            set { this.deviceState = value; }
            get { return this.deviceState; }
        }
        public string DeviceMadePlace {
            set { this.deviceMadePlace = value; }
            get { return this.deviceMadePlace; }
        }
        public DateTime DeviceOutDate {
            set { this.deviceOutDate = value; }
            get { return this.deviceOutDate; }
        }
        public DateTime DevicePurchaseTime
        {
            set { this.devicePurchaseTime = value; }
            get { return this.devicePurchaseTime; }
        }
        public string DeviceNotes
        {
            set { this.deviceNotes = value; }
            get { return this.deviceNotes; }
        }
        public string ErrMessage
        {
            set { this.errMessage = value; }
            get { return this.errMessage; }
        }
        #endregion
       
        public DeviceInfo()
        {
            deviceId = 0;
            deviceName = "";
            deviceTypeId = 0;
            deviceSign = "";
            deviceModel = "";
            deviceSerialNumber = "";
            deviceImagePath = "";
            deviceState = 1; /*1代表该设备处于空闲状态*/
            deviceMadePlace = "";
            deviceOutDate = DateTime.MinValue;
            devicePurchaseTime = DateTime.MinValue;
            deviceNotes = "";
            errMessage = "";
        }

        public bool NewDeviceAdd()
        {
            if(IsExist(this.deviceName))
            {
                this.errMessage = "该设备名称信息在系统中已经存在!";
                return false;
            }
            string insertString = "insert into deviceInfo(deviceName,deviceTypeId,deviceSign,deviceModel,deviceSerialNumber,deviceImagePath,deviceState,deviceMadePlace,deviceOutDate,devicePurchaseTime,deviceNotes) values (";
            insertString += SqlString.GetQuotedString(deviceName) + ",";
            insertString += deviceTypeId + ",";
            insertString += SqlString.GetQuotedString(deviceSign) + ",";
            insertString += SqlString.GetQuotedString(deviceModel) + ",";
            insertString += SqlString.GetQuotedString(deviceSerialNumber) + ",";
            insertString += SqlString.GetQuotedString(deviceImagePath) + ",";
            insertString += deviceState + ",";
            insertString += SqlString.GetQuotedString(deviceMadePlace) + ",'";
            insertString += deviceOutDate + "','";
            insertString += devicePurchaseTime + "',";
            insertString += SqlString.GetQuotedString(deviceNotes) + ")";
            DataBase db = new DataBase();
            if (db.InsertOrUpdate(insertString) < 0)
            {
                this.errMessage = "添加新设备失败!";
                return false;
            }
            return true;
        }

        public bool GetDeviceInfo(int deviceId)
        {
            string queryString = "select * from deviceInfo where deviceId =" + deviceId;
            DataBase db = new DataBase();
            DataSet ds = db.GetDataSet(queryString);
            if (ds.Tables[0].Rows.Count == 0)
            {
                this.errMessage = "该设备不存在！";
                return false;
            }
            DataRow dr = ds.Tables[0].Rows[0];
            this.deviceId = deviceId;
            this.deviceName = dr["deviceName"].ToString();
            this.deviceTypeId = Int32.Parse(dr["deviceTypeId"].ToString());
            this.deviceSign = dr["deviceSign"].ToString();
            this.deviceModel = dr["deviceModel"].ToString();
            this.deviceSerialNumber = dr["deviceSerialNumber"].ToString();
            this.deviceImagePath = dr["deviceImagePath"].ToString();
            this.deviceState = Int32.Parse(dr["deviceState"].ToString());
            this.deviceMadePlace = dr["deviceMadePlace"].ToString();
            this.deviceOutDate = Convert.ToDateTime(dr["deviceOutDate"].ToString());
            this.devicePurchaseTime = Convert.ToDateTime(dr["devicePurchaseTime"].ToString());
            this.deviceNotes = dr["deviceNotes"].ToString();

            return true;
        }

        public bool DeviceInfoUpdate(string rootPath)
        {
            string deviceOldImagePath = this.GetDeviceImagePath(this.deviceId);
            if (deviceOldImagePath != "")
            {
                if (String.Compare(deviceOldImagePath, this.deviceImagePath, true) != 0)
                    System.IO.File.Delete(rootPath + "\\" + deviceOldImagePath);
            }
            string updateString = "update deviceInfo set deviceName=" + SqlString.GetQuotedString(this.deviceName);
            updateString += ",deviceTypeId=" + this.deviceTypeId;
            updateString += ",deviceSign=" + SqlString.GetQuotedString(this.deviceSign);
            updateString += ",deviceModel=" + SqlString.GetQuotedString(this.deviceModel);
            updateString += ",deviceSerialNumber=" + SqlString.GetQuotedString(this.deviceSerialNumber);
            updateString += ",deviceImagePath=" + SqlString.GetQuotedString(this.deviceImagePath);
            updateString += ",deviceMadePlace=" + SqlString.GetQuotedString(this.deviceMadePlace);
            updateString += ",deviceOutDate='" + this.deviceOutDate;
            updateString += "',devicePurchaseTime='" + this.devicePurchaseTime;
            updateString += "',deviceNotes=" + SqlString.GetQuotedString(this.deviceNotes);
            updateString += " where deviceId=" + this.deviceId;
            DataBase db = new DataBase();
            if (db.InsertOrUpdate(updateString) < 0)
            {
                this.errMessage = "修改设备信息失败!";
                return false;
            }
            return true;  
        }

        public bool IsExist(string deviceSerialNumber)
        {
            DataBase db = new DataBase();
            string queryString = "select * from deviceInfo where deviceSerialNumber=" + SqlString.GetQuotedString(deviceSerialNumber);
            return db.GetRecord(queryString);
        }

        public bool IsExist(int deviceId)
        {
            DataBase db = new DataBase();
            string queryString = "select * from deviceInfo where deviceId=" + deviceId;
            return db.GetRecord(queryString);
        }

        public int GetDeviceState(int deviceId)
        {
            string queryString = "select deviceState from deviceInfo where deviceId=" + deviceId;
            DataSet ds = (new DataBase()).GetDataSet(queryString);
            if (ds.Tables[0].Rows.Count == 0) return 0;
            return Int32.Parse(ds.Tables[0].Rows[0]["deviceState"].ToString());
        }

        public string GetDeviceImagePath(int deviceId)
        {
            string queryString = "select deviceImagePath from deviceInfo where deviceId = " + deviceId;
            DataSet ds = (new DataBase()).GetDataSet(queryString);
            if (ds.Tables[0].Rows.Count == 0) return String.Empty;
            return ds.Tables[0].Rows[0]["deviceImagePath"].ToString();
        }

        public DataSet QueryDevice(string deviceName, string deviceType, string startTimeString, string endTimeString)
        {
            try
            {
                string queryString = "select * from deviceInfoView where deviceName like '%";
                queryString += deviceName + "%' and deviceTypeName like '%";
                queryString += deviceType + "%'";
                if (startTimeString != "")
                    queryString += " and devicePurchaseTime>'" + startTimeString + "'";
                if (endTimeString != "")
                    queryString += " and devicePurchaseTIme<'" + endTimeString + "'";
                DataBase db = new DataBase();
                return db.GetDataSet(queryString);
            }
            catch (Exception ex)
            {
                this.errMessage = ex.Message;
                return null;
            }
        }

        public DataSet QueryDevice(int deviceTypeId)
        {
            string queryString = "select deviceId,deviceName from deviceInfo where deviceState=1 and deviceTypeId=" + deviceTypeId ;
            DataSet ds = (new DataBase()).GetDataSet(queryString);
            return ds;
        }

        public string GetDeviceName(int deviceId)
        {
            string queryString = "select deviceName from deviceInfo where deviceId = " + deviceId;
            DataSet ds = (new DataBase()).GetDataSet(queryString);
            return ds.Tables[0].Rows[0]["deviceName"].ToString();
        }
        public string GetDeviceName1(int lendId)
        {
            string queryString="select deviceName from lendInfoView where lendId="+lendId;
            DataSet ds = (new DataBase()).GetDataSet(queryString);
            return ds.Tables[0].Rows[0]["deviceName"].ToString();
        }
    }
}

