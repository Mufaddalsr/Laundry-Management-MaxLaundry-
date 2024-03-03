using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LaundryWeb_DLL
{
    public class TblUserDLL
    {
        /// <summary>
        /// Get ALL tblUser
        /// </summary>
        /// <param name="uID"></param>
        /// <returns></returns>
        public List<TblUserMetaData> GetAlltblUser(int uID = 0)
        {
            DataSet result = null;
			List<TblUserMetaData> tbluserMetaDatas = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("UID", uID));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_tblUser_GetAll", prms.ToArray());
				if (result.Tables.Count > 0)
                {
                    tbluserMetaDatas = result.Tables[0].ToListNullableTypes<TblUserMetaData>();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return tbluserMetaDatas;
        }

        /// <summary>
        /// Get tblUser by UID
        /// </summary>
        /// <param name="uID"></param>
        /// <returns></returns>
        public TblUserMetaData GettblUserbyId(int uID = 0)
        {
            TblUserMetaData tbluserMetaDatas = null;
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("UID", uID));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_tblUser_GetAll", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    tbluserMetaDatas = result.Tables[0].ToListNullableTypes<TblUserMetaData>().FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return tbluserMetaDatas;
        }

        /// <summary>
        /// tblUser DML Opearation
        /// </summary>
        /// <param name="tbluserMetaDatas"></param>
        /// <returns></returns>
        public DataSet tblUserDML(TblUserMetaData tbluserMetaDatas)
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

				prms.Add(new SqlParameter("UID", tbluserMetaDatas.UID));
				prms.Add(new SqlParameter("UserID", tbluserMetaDatas.UserID));
				prms.Add(new SqlParameter("iPassword", tbluserMetaDatas.iPassword));
				prms.Add(new SqlParameter("RoleID", tbluserMetaDatas.RoleID));
				prms.Add(new SqlParameter("DisplayName", tbluserMetaDatas.DisplayName));
				prms.Add(new SqlParameter("RFID", tbluserMetaDatas.RFID));
				prms.Add(new SqlParameter("isActive", tbluserMetaDatas.isActive));
				prms.Add(new SqlParameter("BS", tbluserMetaDatas.BS));
				prms.Add(new SqlParameter("Mode", tbluserMetaDatas.Mode));

                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_tblUser_DML", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
	}
}

