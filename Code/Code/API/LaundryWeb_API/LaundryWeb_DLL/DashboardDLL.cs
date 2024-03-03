using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LaundryWeb_DLL
{
    public class DashboardDLL
    {
        /// <summary>
        /// GetDashboard
        /// </summary>
        /// <param name="customerId"></param>
        /// <returns></returns>
        public DashboardMetaData GetDashboard(Int64 customerId)
        {
            DashboardMetaData dashboardMetaDatas = null;
            List<SqlParameter> prms = null;
            DataSet result = null;
            try
            {
                dashboardMetaDatas = new DashboardMetaData();
                prms = new List<SqlParameter>();
                result = new DataSet();
                prms.Add(new SqlParameter("CustomerId", customerId));
                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_CustomerDashboard", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    dashboardMetaDatas = result.Tables[0].ToListNullableTypes<DashboardMetaData>().FirstOrDefault();
                }
                return dashboardMetaDatas;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
