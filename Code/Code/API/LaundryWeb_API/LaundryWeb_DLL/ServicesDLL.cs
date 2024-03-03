using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LaundryWeb_DLL
{
    public class ServicesDLL
    {
        /// <summary>
        /// Get ALL Services
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public List<ServicesMetaData> GetAllServices(int id = 0)
        {
            DataSet result = null;
			List<ServicesMetaData> servicesMetaDatas = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_Services_GetAll", prms.ToArray());
				if (result.Tables.Count > 0)
                {
                    servicesMetaDatas = result.Tables[0].ToListNullableTypes<ServicesMetaData>();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return servicesMetaDatas;
        }

        /// <summary>
        /// Get Services by ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ServicesMetaData GetServicesbyId(int id = 0)
        {
            ServicesMetaData servicesMetaDatas = null;
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_Services_GetAll", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    servicesMetaDatas = result.Tables[0].ToListNullableTypes<ServicesMetaData>().FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return servicesMetaDatas;
        }

        /// <summary>
        /// Services DML Opearation
        /// </summary>
        /// <param name="servicesMetaDatas"></param>
        /// <returns></returns>
        public DataSet ServicesDML(ServicesMetaData servicesMetaDatas)
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

				prms.Add(new SqlParameter("ID", servicesMetaDatas.ID));
				prms.Add(new SqlParameter("ServiceType", servicesMetaDatas.ServiceType));
				prms.Add(new SqlParameter("isActive", servicesMetaDatas.isActive));
				prms.Add(new SqlParameter("CompanyID", servicesMetaDatas.CompanyID));
				prms.Add(new SqlParameter("Mode", servicesMetaDatas.Mode));

                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_Services_DML", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
	}
}

