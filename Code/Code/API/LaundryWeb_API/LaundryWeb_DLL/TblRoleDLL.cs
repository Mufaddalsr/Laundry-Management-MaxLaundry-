using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LaundryWeb_DLL
{
    public class TblRoleDLL
    {
        /// <summary>
        /// Get ALL tblRole
        /// </summary>
        /// <param name="roleId"></param>
        /// <returns></returns>
        public List<TblRoleMetaData> GetAlltblRole(int roleId = 0)
        {
            DataSet result = null;
			List<TblRoleMetaData> tblroleMetaDatas = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("RoleID", roleId));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_tblRole_GetAll", prms.ToArray());
				if (result.Tables.Count > 0)
                {
                    tblroleMetaDatas = result.Tables[0].ToListNullableTypes<TblRoleMetaData>();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return tblroleMetaDatas;
        }

        /// <summary>
        /// Get tblRole by RoleID
        /// </summary>
        /// <param name="roleId"></param>
        /// <returns></returns>
        public TblRoleMetaData GettblRolebyId(int roleId = 0)
        {
            TblRoleMetaData tblroleMetaDatas = null;
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("RoleID", roleId));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_tblRole_GetAll", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    tblroleMetaDatas = result.Tables[0].ToListNullableTypes<TblRoleMetaData>().FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return tblroleMetaDatas;
        }

        /// <summary>
        /// tblRole DML Opearation
        /// </summary>
        /// <param name="tblroleMetaDatas"></param>
        /// <returns></returns>
        public DataSet tblRoleDML(TblRoleMetaData tblroleMetaDatas)
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

				prms.Add(new SqlParameter("RoleID", tblroleMetaDatas.RoleID));
				prms.Add(new SqlParameter("RoleDesc", tblroleMetaDatas.RoleDesc));
				prms.Add(new SqlParameter("isActive", tblroleMetaDatas.isActive));
				prms.Add(new SqlParameter("Mode", tblroleMetaDatas.Mode));

                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_tblRole_DML", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
	}
}

