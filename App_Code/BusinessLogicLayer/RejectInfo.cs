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
    public class RejectInfo
    {
        private int deviceId; 
        private DateTime deviceRejectTime;
        private string deviceRejectReason;
        private float depreciationMoney;
        private string errMessage;
        #region MyRegion
        public int DeviceId
        {
            set { this.deviceId = value; }
            get { return this.deviceId; }
        }
        public DateTime DeviceRejectTime
        {
            set { this.deviceRejectTime = value; }
            get { return this.deviceRejectTime; }
        }
        public string DeviceRejectReason
        {
            set { this.deviceRejectReason = value; }
            get { return this.deviceRejectReason; }
        }
        public float DepreciationMoney
        {
            set { this.depreciationMoney = value; }
            get { return this.depreciationMoney; }
        }
        public string ErrMessage
        {
            set { this.errMessage = value; }
            get { return this.errMessage; }
        }
        #endregion
        public RejectInfo()
        {
            deviceId = 0;
            deviceRejectTime = DateTime.MinValue;
            deviceRejectReason = "";
            depreciationMoney = 0.0f;
            errMessage = "";
        }
        public bool AddDeviceRejectInfo()
        {
            if (this.deviceId == 0)
            {
                this.errMessage = "请选择报废设备";
                return false;
            }
            if (!(new DeviceInfo()).IsExist(deviceId))
            {
                this.errMessage = "该设备信息不存在";
                return false;
            }
            if ((new DeviceInfo()).GetDeviceState(deviceId) != 1)
            {
                this.errMessage = "该设备未在空闲状态，不得报废!";
                return false;
            }
            string insertString = "insert into rejectInfo(deviceId,deviceRejectTime,deviceRejectReason,depreciationMoney) values (";
            insertString += deviceId + ",'";
            insertString += deviceRejectTime + "',";
            insertString += SqlString.GetQuotedString(deviceRejectReason) + ",";
            insertString += depreciationMoney + ")";
            string updateString = "update deviceInfo set deviceState=4 where deviceId=" + deviceId;
            string[] sqlStrings = new string[] { insertString, updateString };
            DataBase db = new DataBase();
            if (db.ExecuteSQL(sqlStrings) == false)
            {
                this.errMessage = "设备报废失败!";
                return false;
            }
            return true;
        }

        public DataSet QueryRejectInfo(string deviceName, string deviceType, string startTime, string endTime)
        {
            string queryString = "select * from rejectInfoView where deviceName like '%" + deviceName;
            queryString += "%' and deviceTypeName like '%" + deviceType + "%'";
            if (startTime != "")
                queryString += " and deviceRejectTime > '" + Convert.ToDateTime(startTime) + "'";
            if (endTime != "")
                queryString += " and deviceRejectTime <'" + Convert.ToDateTime(endTime) + "'";
            DataBase db = new DataBase();
            return db.GetDataSet(queryString);
        }
    }

}
