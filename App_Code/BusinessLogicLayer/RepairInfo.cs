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
   
    public class RepairInfo
    {
        private int repairId;
        private int deviceId;
        private string repairPlace; 
        private string repairMan;
        private float repairTime; 
        private float repairMoney;
        private string repairReason; 
        private DateTime repairStartTime; 
        private DateTime repairEndTime;
        private int isReturn; 
        private string repairNotes;
        private string errMessage;
       
        #region MyRegion
        public int RepairId
        {
            set { this.repairId = value; }
            get { return this.repairId; }
        }
        public int DeviceId
        {
            set { this.deviceId = value; }
            get { return this.deviceId; }
        }
        public string RepairPlace
        {
            set { this.repairPlace = value; }
            get { return this.repairPlace; }
        }
        public string RepairMan
        {
            set { this.repairMan = value; }
            get { return this.repairMan; }
        }
        public float RepairTime
        {
            set { this.repairTime = value; }
            get { return this.repairTime; }
        }
        public float RepairMoney
        {
            set { this.repairMoney = value; }
            get { return this.repairMoney; }
        }
        public string RepairReason
        {
            set { this.repairReason = value; }
            get { return this.repairReason; }
        }
        public DateTime RepairStartTime
        {
            set { this.repairStartTime = value; }
            get { return this.repairStartTime; }
        }
        public DateTime RepairEndTime
        {
            set { this.repairEndTime = value; }
            get { return this.repairEndTime; }
        }
        public int IsReturn
        {
            set { this.isReturn = value; }
            get { return this.isReturn; }
        }
        public string RepairNotes
        {
            set { this.repairNotes = value; }
            get { return this.repairNotes; }
        }
        public string ErrMessage
        {
            set { this.errMessage = value; }
            get { return this.errMessage; }
        }
        #endregion
        
        public RepairInfo()
        {
            repairId = 0;
            deviceId = 0;
            repairPlace = "";
            repairMan = "";
            repairTime = 0.0f;
            repairMoney = 0.0f;
            repairReason = "";
            repairStartTime = DateTime.MinValue;
            repairEndTime = DateTime.MaxValue;
            repairNotes = "";
            errMessage = "";
        }

        public bool AddRepairInfo()
        {
            if (this.deviceId == 0)
            {
                this.errMessage = "请选择维修的设备";
                return false;
            }
            if (!(new DeviceInfo()).IsExist(deviceId))
            {
                this.errMessage = "该设备不存在";
                return false;
            }
            if ((new DeviceInfo()).GetDeviceState(deviceId) != 1)
            {
                this.errMessage = "该设备未在空闲状态，不得维修!";
                return false;
            }
            string insertString = "insert into repairInfo(deviceId,repairPlace,repairMan,repairReason,repairStartTime,isReturn,repairNotes) values(";
            insertString += deviceId + ",";
            insertString += SqlString.GetQuotedString(repairPlace) + ",";
            insertString += SqlString.GetQuotedString(repairMan) + ",";
            insertString += SqlString.GetQuotedString(repairReason) + ",'";
            insertString += repairStartTime + "',";
            insertString += isReturn + ",";
            insertString += SqlString.GetQuotedString(repairNotes) + ")";
            string updateString = "update deviceInfo set deviceState=3 where deviceId=" + deviceId;
            string[] sqlStrings = new string[] { insertString, updateString };
            DataBase db = new DataBase();
            if (db.ExecuteSQL(sqlStrings) == false)
            {
                this.errMessage = "设备维修信息登记失败!";
                return false;
            }
            return true;
        }

        public DataSet QueryRepairInfo(string deviceName, string deviceTypeName, string startTime, string endTime)
        {
            string queryString = "select * from repairInfoView where deviceName like '%";
            queryString += deviceName + "%' and deviceTypeName like '%" + deviceTypeName + "%'";
            if (startTime != "")
                queryString += " and repairStartTime>'" + Convert.ToDateTime(startTime) + "'";
            if (endTime != "")
                queryString += " and repairStartTime<'" + Convert.ToDateTime(endTime) + "'";
            queryString += " and isReturn=0";
            DataBase db = new DataBase();
            return db.GetDataSet(queryString);
        }

      
        public bool GetRepairInfo(int repairId)
        {
            string queryString = "select * from repairInfo where repairId = " + repairId;
            DataSet ds = (new DataBase()).GetDataSet(queryString);
            if (ds.Tables[0].Rows.Count == 0)
            {
                this.ErrMessage = "该设备维修信息不存在";
                return false;
            }
            DataRow dr = ds.Tables[0].Rows[0];
            this.repairId = repairId;
            this.deviceId = Int32.Parse(dr["deviceId"].ToString());
            this.repairPlace = dr["repairPlace"].ToString();
            this.repairMan = dr["repairMan"].ToString();
            if(!dr["repairTime"].Equals(System.DBNull.Value))
              this.repairTime = Convert.ToSingle(dr["repairTime"]);
            if(!dr["repairMoney"].Equals(System.DBNull.Value))
                this.repairMoney = Convert.ToSingle(dr["repairMoney"]);
            this.repairReason = dr["repairReason"].ToString();
            this.repairStartTime = Convert.ToDateTime(dr["repairStartTime"]);
            if(!dr["repairEndTime"].Equals(System.DBNull.Value))
                this.repairEndTime = Convert.ToDateTime(dr["repairEndTime"]);
            this.isReturn = Convert.ToInt16(dr["isReturn"]);
            this.repairNotes = dr["repairNotes"].ToString();

            return true;
        }

        public bool UpdateRepairInfo()
        {
            string repairInfoUpdateString = "update repairInfo set repairMan=";
            repairInfoUpdateString += SqlString.GetQuotedString(repairMan) + ",repairReason=";
            repairInfoUpdateString += SqlString.GetQuotedString(repairReason) + ",repairEndTime='";
            repairInfoUpdateString += repairEndTime + "',repairTime=";
            repairInfoUpdateString += repairTime + ",repairMoney=";
            repairInfoUpdateString += repairMoney + ",repairNotes=";
            repairInfoUpdateString += SqlString.GetQuotedString(repairNotes);
            repairInfoUpdateString += ",isReturn=1 where repairId=" + repairId;
            int deviceId = this.GetDeviceId(repairId);
            string deviceStateUpdateString = "update deviceInfo set deviceState = 1 where deviceId = " + deviceId;
            string[] updateStrings = new string[] { repairInfoUpdateString, deviceStateUpdateString };
            DataBase db = new DataBase();
            if (!db.ExecuteSQL(updateStrings))
            {
                this.errMessage = "执行设备维修失败!";
                return false;
            }
            return true;
        }

        public int GetDeviceId(int repairId)
        {
            string queryString = "select deviceId from repairInfo where repairId = " + repairId;
            DataSet ds = (new DataBase()).GetDataSet(queryString);
            return Int32.Parse(ds.Tables[0].Rows[0]["deviceId"].ToString());
        }
    }
}

