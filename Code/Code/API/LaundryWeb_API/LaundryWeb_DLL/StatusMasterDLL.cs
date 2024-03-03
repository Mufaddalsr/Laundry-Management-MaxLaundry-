using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LaundryWeb_DLL
{
    public class StatusMasterDLL
    {
        /// <summary>
        /// Get ALL StatusMaster
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public List<StatusMasterMetaData> GetAllStatusMaster(int id = 0)
        {
            DataSet result = null;
			List<StatusMasterMetaData> statusmasterMetaDatas = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_StatusMaster_GetAll", prms.ToArray());
				if (result.Tables.Count > 0)
                {
                    statusmasterMetaDatas = result.Tables[0].ToListNullableTypes<StatusMasterMetaData>();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return statusmasterMetaDatas;
        }

        /// <summary>
        /// Get StatusMaster by ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public StatusMasterMetaData GetStatusMasterbyId(int id = 0)
        {
            StatusMasterMetaData statusmasterMetaDatas = null;
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_StatusMaster_GetAll", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    statusmasterMetaDatas = result.Tables[0].ToListNullableTypes<StatusMasterMetaData>().FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return statusmasterMetaDatas;
        }

        /// <summary>
        /// StatusMaster DML Opearation
        /// </summary>
        /// <param name="statusmasterMetaDatas"></param>
        /// <returns></returns>
        public DataSet StatusMasterDML(StatusMasterMetaData statusmasterMetaDatas)
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

				prms.Add(new SqlParameter("ID", statusmasterMetaDatas.ID));
				prms.Add(new SqlParameter("StatusDesc", statusmasterMetaDatas.StatusDesc));
				prms.Add(new SqlParameter("HoursMax", statusmasterMetaDatas.HoursMax));
				prms.Add(new SqlParameter("Mode", statusmasterMetaDatas.Mode));

                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_StatusMaster_DML", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
	}
}

