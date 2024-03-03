using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LaundryWeb_DLL
{
    public class AuditLogDLL
    {
        /// <summary>
        /// Get ALL AuditLog
        /// </summary>
        /// <param name="tID"></param>
        /// <returns></returns>
        public List<AuditLogMetaData> GetAllAuditLog(int tID = 0)
        {
            DataSet result = null;
			List<AuditLogMetaData> auditlogMetaDatas = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("TID", tID));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_AuditLog_GetAll", prms.ToArray());
				if (result.Tables.Count > 0)
                {
                    auditlogMetaDatas = result.Tables[0].ToListNullableTypes<AuditLogMetaData>();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return auditlogMetaDatas;
        }

        /// <summary>
        /// Get AuditLog by TID
        /// </summary>
        /// <param name="tID"></param>
        /// <returns></returns>
        public AuditLogMetaData GetAuditLogbyId(int tID = 0)
        {
            AuditLogMetaData auditlogMetaDatas = null;
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("TID", tID));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_AuditLog_GetAll", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    auditlogMetaDatas = result.Tables[0].ToListNullableTypes<AuditLogMetaData>().FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return auditlogMetaDatas;
        }

        /// <summary>
        /// AuditLog DML Opearation
        /// </summary>
        /// <param name="auditlogMetaDatas"></param>
        /// <returns></returns>
        public DataSet AuditLogDML(AuditLogMetaData auditlogMetaDatas)
        {
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				SqlParameter sqlParameter = new SqlParameter("@responsemessage", 0);
                sqlParameter.Direction = ParameterDirection.Output;
                sqlParameter.DbType = DbType.Int32;
                prms.Add(sqlParameter);

				prms.Add(new SqlParameter("TID", auditlogMetaDatas.TID));
				prms.Add(new SqlParameter("OrderID", auditlogMetaDatas.OrderID));
				prms.Add(new SqlParameter("TStamp", auditlogMetaDatas.TStamp));
				prms.Add(new SqlParameter("EventType", auditlogMetaDatas.EventType));
				prms.Add(new SqlParameter("EventDesc", auditlogMetaDatas.EventDesc));
				prms.Add(new SqlParameter("UserID", auditlogMetaDatas.UserID));
				prms.Add(new SqlParameter("isSync", auditlogMetaDatas.isSync));
				prms.Add(new SqlParameter("Mode", auditlogMetaDatas.Mode));

                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_AuditLog_DML", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
	}
}

