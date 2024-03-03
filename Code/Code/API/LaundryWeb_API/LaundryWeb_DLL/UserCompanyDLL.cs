using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LaundryWeb_DLL
{
    public class UserCompanyDLL
    {
        /// <summary>
        /// Get ALL UserCompany
        /// </summary>
        /// <param name="tID"></param>
        /// <returns></returns>
        public List<UserCompanyMetaData> GetAllUserCompany(int tID = 0)
        {
            DataSet result = null;
			List<UserCompanyMetaData> usercompanyMetaDatas = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("TID", tID));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_UserCompany_GetAll", prms.ToArray());
				if (result.Tables.Count > 0)
                {
                    usercompanyMetaDatas = result.Tables[0].ToListNullableTypes<UserCompanyMetaData>();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return usercompanyMetaDatas;
        }

        /// <summary>
        /// Get UserCompany by TID
        /// </summary>
        /// <param name="tID"></param>
        /// <returns></returns>
        public UserCompanyMetaData GetUserCompanybyId(int tID = 0)
        {
            UserCompanyMetaData usercompanyMetaDatas = null;
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("TID", tID));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_UserCompany_GetAll", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    usercompanyMetaDatas = result.Tables[0].ToListNullableTypes<UserCompanyMetaData>().FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return usercompanyMetaDatas;
        }

        /// <summary>
        /// UserCompany DML Opearation
        /// </summary>
        /// <param name="usercompanyMetaDatas"></param>
        /// <returns></returns>
        public DataSet UserCompanyDML(UserCompanyMetaData usercompanyMetaDatas)
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

				prms.Add(new SqlParameter("TID", usercompanyMetaDatas.TID));
				prms.Add(new SqlParameter("UID", usercompanyMetaDatas.UID));
				prms.Add(new SqlParameter("CID", usercompanyMetaDatas.CID));
				prms.Add(new SqlParameter("Mode", usercompanyMetaDatas.Mode));

                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_UserCompany_DML", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
	}
}

