using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
namespace LaundryWeb_DLL
{
    public class ChangePasswordDLL
    {
        /// <summary>
        /// Role DML Opearation
        /// </summary>
        /// <param name="changePasswordMetaDatas"></param>
        /// <returns></returns>
        public DataSet ChangePassword(ChangePasswordMetaData changePasswordMetaDatas)
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
                prms.Add(new SqlParameter("ID", changePasswordMetaDatas.ID));
                prms.Add(new SqlParameter("NewPassword", changePasswordMetaDatas.NewPassword));
                prms.Add(new SqlParameter("OldPassword", changePasswordMetaDatas.OldPassword));
                prms.Add(new SqlParameter("CreatedBy", changePasswordMetaDatas.CreatedBy));
                prms.Add(new SqlParameter("CreatedOn", DateTime.Now));
                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_ChangePassword", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
