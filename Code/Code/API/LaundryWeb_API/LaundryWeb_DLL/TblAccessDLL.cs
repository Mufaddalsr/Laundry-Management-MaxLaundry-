using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LaundryWeb_DLL
{
    public class TblAccessDLL
    {
        /// <summary>
        /// Get ALL tblAccess
        /// </summary>
        /// <param name="accessID"></param>
        /// <returns></returns>
        public List<TblAccessMetaData> GetAlltblAccess(int accessID = 0)
        {
            DataSet result = null;
			List<TblAccessMetaData> tblaccessMetaDatas = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("AccessID", accessID));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_tblAccess_GetAll", prms.ToArray());
				if (result.Tables.Count > 0)
                {
                    tblaccessMetaDatas = result.Tables[0].ToListNullableTypes<TblAccessMetaData>();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return tblaccessMetaDatas;
        }

        /// <summary>
        /// Get tblAccess by AccessID
        /// </summary>
        /// <param name="accessID"></param>
        /// <returns></returns>
        public TblAccessMetaData GettblAccessbyId(int accessID = 0)
        {
            TblAccessMetaData tblaccessMetaDatas = null;
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("AccessID", accessID));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_tblAccess_GetAll", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    tblaccessMetaDatas = result.Tables[0].ToListNullableTypes<TblAccessMetaData>().FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return tblaccessMetaDatas;
        }

        /// <summary>
        /// tblAccess DML Opearation
        /// </summary>
        /// <param name="tblaccessMetaDatas"></param>
        /// <returns></returns>
        public DataSet tblAccessDML(TblAccessMetaData tblaccessMetaDatas)
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

				prms.Add(new SqlParameter("AccessID", tblaccessMetaDatas.AccessID));
				prms.Add(new SqlParameter("AccessDesc", tblaccessMetaDatas.AccessDesc));
				prms.Add(new SqlParameter("Mode", tblaccessMetaDatas.Mode));

                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_tblAccess_DML", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
	}
}

