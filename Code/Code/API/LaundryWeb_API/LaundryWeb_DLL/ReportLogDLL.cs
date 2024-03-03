using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LaundryWeb_DLL
{
    public class ReportLogDLL
    {
        /// <summary>
        /// Get ALL ReportLog
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public List<ReportLogMetaData> GetAllReportLog(int id = 0)
        {
            DataSet result = null;
			List<ReportLogMetaData> reportlogMetaDatas = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_ReportLog_GetAll", prms.ToArray());
				if (result.Tables.Count > 0)
                {
                    reportlogMetaDatas = result.Tables[0].ToListNullableTypes<ReportLogMetaData>();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return reportlogMetaDatas;
        }

        /// <summary>
        /// Get ReportLog by ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ReportLogMetaData GetReportLogbyId(int id = 0)
        {
            ReportLogMetaData reportlogMetaDatas = null;
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_ReportLog_GetAll", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    reportlogMetaDatas = result.Tables[0].ToListNullableTypes<ReportLogMetaData>().FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return reportlogMetaDatas;
        }

        /// <summary>
        /// ReportLog DML Opearation
        /// </summary>
        /// <param name="reportlogMetaDatas"></param>
        /// <returns></returns>
        public DataSet ReportLogDML(ReportLogMetaData reportlogMetaDatas)
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

				prms.Add(new SqlParameter("ID", reportlogMetaDatas.ID));
				prms.Add(new SqlParameter("ReportType", reportlogMetaDatas.ReportType));
				prms.Add(new SqlParameter("ReportDate", reportlogMetaDatas.ReportDate));
				prms.Add(new SqlParameter("ReportDoc", reportlogMetaDatas.ReportDoc));
				prms.Add(new SqlParameter("ReportBy", reportlogMetaDatas.ReportBy));
				prms.Add(new SqlParameter("ReportingTime", reportlogMetaDatas.ReportingTime));
				prms.Add(new SqlParameter("Mode", reportlogMetaDatas.Mode));

                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_ReportLog_DML", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
	}
}

