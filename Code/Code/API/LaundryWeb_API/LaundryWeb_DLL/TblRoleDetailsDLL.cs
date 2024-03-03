using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LaundryWeb_DLL
{
    public class TblRoleDetailsDLL
    {
        /// <summary>
        /// Get ALL tblRoleDetails
        /// </summary>
        /// <param name="tID"></param>
        /// <returns></returns>
        public List<TblRoleDetailsMetaData> GetAlltblRoleDetails(int tID = 0)
        {
            DataSet result = null;
			List<TblRoleDetailsMetaData> tblroledetailsMetaDatas = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("TID", tID));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_tblRoleDetails_GetAll", prms.ToArray());
				if (result.Tables.Count > 0)
                {
                    tblroledetailsMetaDatas = result.Tables[0].ToListNullableTypes<TblRoleDetailsMetaData>();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return tblroledetailsMetaDatas;
        }

        /// <summary>
        /// Get tblRoleDetails by TID
        /// </summary>
        /// <param name="tID"></param>
        /// <returns></returns>
        public TblRoleDetailsMetaData GettblRoleDetailsbyId(int tID = 0)
        {
            TblRoleDetailsMetaData tblroledetailsMetaDatas = null;
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("TID", tID));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_tblRoleDetails_GetAll", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    tblroledetailsMetaDatas = result.Tables[0].ToListNullableTypes<TblRoleDetailsMetaData>().FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return tblroledetailsMetaDatas;
        }

        /// <summary>
        /// tblRoleDetails DML Opearation
        /// </summary>
        /// <param name="tblroledetailsMetaDatas"></param>
        /// <returns></returns>
        public DataSet tblRoleDetailsDML(TblRoleDetailsMetaData tblroledetailsMetaDatas)
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

				prms.Add(new SqlParameter("TID", tblroledetailsMetaDatas.TID));
				prms.Add(new SqlParameter("RoleID", tblroledetailsMetaDatas.RoleID));
				prms.Add(new SqlParameter("AccessID", tblroledetailsMetaDatas.AccessID));
				prms.Add(new SqlParameter("Mode", tblroledetailsMetaDatas.Mode));

                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_tblRoleDetails_DML", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
	}
}

