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
using DeviceInfoManage.DataAccessHelper;
using DeviceInfoManage.DataAccessLayer;

namespace DeviceInfoManage.BusinessLogicLayer
{
   
    public class LendInfo
    {
        private int lendId;             
        private int deviceId;           
        private int lendDepartmentId;  
        private string lendPerson;     
        private DateTime lendDate;     
        private int lendDays;           
        private DateTime returnDate;    
        private int isReturn;          
        private string errMessage;     

        
        #region MyRegion
        public int LendId
        {
            set { this.lendId = value; }
            get { return this.lendId; }
        }
        public int DeviceId
        {
            set { this.deviceId = value; }
            get { return this.deviceId; }
        }
        public int LendDepartmentId
        {
            set { this.lendDepartmentId = value; }
            get { return this.lendDepartmentId; }
        }
        public string LendPerson
        {
            set { this.lendPerson = value; }
            get { return this.lendPerson; }
        }
        public DateTime LendDate
        {
            set { this.lendDate = value; }
            get { return this.lendDate; }
        }
        public int LendDays
        {
            set { this.lendDays = value; }
            get { return this.lendDays; }
        }
        public DateTime ReturnDate
        {
            set { this.returnDate = value; }
            get { return this.returnDate; }
        }
        public int IsReturn
        {
            set { this.isReturn = value; }
            get { return this.isReturn; }
        }
        public string ErrMessage
        {
            set { this.errMessage = value; }
            get { return this.errMessage; }
        }
        #endregion
        
       
        public LendInfo()
        {
            lendId = 0;
            deviceId = 0;
            lendDepartmentId = 0;
            lendPerson = "";
            lendDate = DateTime.MinValue;
            lendDays = 0;
            returnDate = DateTime.MaxValue;
            isReturn = 0;
        }

        public bool AddLendInfo()
        {
            if (this.deviceId == 0)
            {
                this.errMessage = "请选择借用的设备";
                return false;
            }
            if (!(new DeviceInfo()).IsExist(deviceId))
            {
                this.errMessage = "该设备不存在";
                return false;
            }
            if ((new DeviceInfo()).GetDeviceState(deviceId) != 1)
            {
                this.errMessage = "该设备未处于空闲状态，不得外借!";
                return false;
            }
            string insertString = "insert into lendInfo(deviceId,lendDepartmentId,lendPerson,lendDate,lendDays,isReturn) values (";
            insertString += deviceId + ",";
            insertString += lendDepartmentId + ",";
            insertString += SqlString.GetQuotedString(lendPerson) + ",'";
            insertString += lendDate + "',";
            insertString += lendDays + ",";
            insertString += isReturn + ")";
            string updateString = "update deviceInfo set deviceState=2 where deviceId=" + deviceId;
            string[] sqlStrings = new string[]{insertString,updateString};
            DataBase db = new DataBase();
            if (db.ExecuteSQL(sqlStrings) == false)
            {
                this.errMessage = "设备外借操作失败!";
                return false;
            }
            return true;
        }

        public DataSet QueryLendInfo(string deviceName, string deviceType, string startTime, string endTime)
        {
            string queryString = "select * from lendInfoView where deviceName like '%" + deviceName;
            queryString += "%' and deviceTypeName like '%" + deviceType + "%'";
            if (startTime != "")
                queryString += " and lendDate > '" + Convert.ToDateTime(startTime) + "'";
            if (endTime != "")
                queryString += " and lendDate <'" + Convert.ToDateTime(endTime) + "'";
            queryString += " and isReturn=0";
            DataBase db = new DataBase();
            return db.GetDataSet(queryString);
        }
   
        public bool GetLendInfo(int lendId)
        {
            string queryString = "select * from lendInfo where lendId = " + lendId;
            DataSet ds = (new DataBase()).GetDataSet(queryString);
            if (ds.Tables[0].Rows.Count == 0)
            {
                this.ErrMessage = "该设备借用信息记录不存在";
                return false;
            }
            DataRow dr = ds.Tables[0].Rows[0];
            this.lendId = lendId;
            this.deviceId = Int32.Parse(dr["deviceId"].ToString());
            this.lendDepartmentId = Int32.Parse(dr["lendDepartmentId"].ToString());
            this.lendPerson = dr["lendPerson"].ToString();
            this.lendDate = Convert.ToDateTime(dr["lendDate"]);
            this.lendDays = Int32.Parse(dr["lendDays"].ToString());
            if(!dr["returnDate"].Equals(System.DBNull.Value))
                this.returnDate = Convert.ToDateTime(dr["returnDate"]);

            this.isReturn = Convert.ToInt16(dr["isReturn"]);
            return true;
        }

        public bool UpdateLendInfo(int lendId, DateTime returnDate)
        {
            string lendInfoUpdateString = "update lendInfo set returnDate = '" + returnDate;
            lendInfoUpdateString += "',isReturn = 1 where lendId = " + lendId;
            int deviceId = this.GetDeviceId(lendId);
            string deviceStateUpdateString = "update deviceInfo set deviceState = 1 where deviceId = " + deviceId;
            string[] updateStrings = new string[] {lendInfoUpdateString,deviceStateUpdateString};
            DataBase db = new DataBase();
            if (!db.ExecuteSQL(updateStrings))
            {
                this.errMessage = "设备归还失败!";
                return false;
            }
            return true;
        }

        public int GetDeviceId(int lendId)
        {
            string queryString = "select deviceId from lendInfo where lendId = " + lendId;
            DataSet ds = (new DataBase()).GetDataSet(queryString);
            return Int32.Parse(ds.Tables[0].Rows[0]["deviceId"].ToString());
        }

        
    }

}

