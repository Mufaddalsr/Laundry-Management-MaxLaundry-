using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LaundryWeb_DLL
{
    public class GarmentServiceDLL
    {
        /// <summary>
        /// Get ALL GarmentService
        /// </summary>
        /// <param name="tID"></param>
        /// <returns></returns>
        public List<GarmentServiceMetaData> GetAllGarmentService(int tID = 0)
        {
            DataSet result = null;
			List<GarmentServiceMetaData> garmentserviceMetaDatas = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("TID", tID));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_GarmentService_GetAll", prms.ToArray());
				if (result.Tables.Count > 0)
                {
                    garmentserviceMetaDatas = result.Tables[0].ToListNullableTypes<GarmentServiceMetaData>();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return garmentserviceMetaDatas;
        }

        /// <summary>
        /// Get GarmentService by TID
        /// </summary>
        /// <param name="tID"></param>
        /// <returns></returns>
        public GarmentServiceMetaData GetGarmentServicebyId(int tID = 0)
        {
            GarmentServiceMetaData garmentserviceMetaDatas = null;
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("TID", tID));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_GarmentService_GetAll", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    garmentserviceMetaDatas = result.Tables[0].ToListNullableTypes<GarmentServiceMetaData>().FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return garmentserviceMetaDatas;
        }

        /// <summary>
        /// GarmentService DML Opearation
        /// </summary>
        /// <param name="garmentserviceMetaDatas"></param>
        /// <returns></returns>
        public DataSet GarmentServiceDML(GarmentServiceMetaData garmentserviceMetaDatas)
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

				prms.Add(new SqlParameter("TID", garmentserviceMetaDatas.TID));
				prms.Add(new SqlParameter("GarmentID", garmentserviceMetaDatas.GarmentID));
				prms.Add(new SqlParameter("ServiceID", garmentserviceMetaDatas.ServiceID));
				prms.Add(new SqlParameter("Price", garmentserviceMetaDatas.Price));
				prms.Add(new SqlParameter("isOffered", garmentserviceMetaDatas.isOffered));
				prms.Add(new SqlParameter("CorpID", garmentserviceMetaDatas.CorpID));
				prms.Add(new SqlParameter("Mode", garmentserviceMetaDatas.Mode));

                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_GarmentService_DML", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
	}
}

