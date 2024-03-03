using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LaundryWeb_DLL
{
    public class TblAppPrefsDLL
    {
        /// <summary>
        /// Get ALL tblAppPrefs
        /// </summary>
        /// <param name="appSettingId"></param>
        /// <returns></returns>
        public List<TblAppPrefsMetaData> GetAlltblAppPrefs(string appSettingId = null)
        {
            DataSet result = null;
			List<TblAppPrefsMetaData> tblappprefsMetaDatas = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("AppSetting", appSettingId));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_tblAppPrefs_GetAll", prms.ToArray());
				if (result.Tables.Count > 0)
                {
                    tblappprefsMetaDatas = result.Tables[0].ToListNullableTypes<TblAppPrefsMetaData>();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return tblappprefsMetaDatas;
        }

        /// <summary>
        /// Get tblAppPrefs by AppSetting
        /// </summary>
        /// <param name="appSettingId"></param>
        /// <returns></returns>
        public TblAppPrefsMetaData GettblAppPrefsbyId(string appSettingId = null)
        {
            TblAppPrefsMetaData tblappprefsMetaDatas = null;
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("AppSetting", appSettingId));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_tblAppPrefs_GetAll", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    tblappprefsMetaDatas = result.Tables[0].ToListNullableTypes<TblAppPrefsMetaData>().FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return tblappprefsMetaDatas;
        }

        /// <summary>
        /// tblAppPrefs DML Opearation
        /// </summary>
        /// <param name="tblappprefsMetaDatas"></param>
        /// <returns></returns>
        public DataSet tblAppPrefsDML(TblAppPrefsMetaData tblappprefsMetaDatas)
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

				prms.Add(new SqlParameter("AppSetting", tblappprefsMetaDatas.AppSetting));
				prms.Add(new SqlParameter("AppValue", tblappprefsMetaDatas.AppValue));
				prms.Add(new SqlParameter("Mode", tblappprefsMetaDatas.Mode));

                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_tblAppPrefs_DML", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
	}
}

