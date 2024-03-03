using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LaundryWeb_DLL
{
    public class GarmentTypeDLL
    {
		/// <summary>
        /// Get ALL GarmentType
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public List<GarmentTypeMetaData> GetAllGarmentType(int id = 0)
        {
            DataSet result = null;
			List<GarmentTypeMetaData> garmenttypeMetaDatas = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_GarmentType_GetAll", prms.ToArray());
				if (result.Tables.Count > 0)
                {
                    garmenttypeMetaDatas = result.Tables[0].ToListNullableTypes<GarmentTypeMetaData>();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return garmenttypeMetaDatas;
        }

        /// <summary>
        /// Get GarmentType by ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public GarmentTypeMetaData GetGarmentTypebyId(int id = 0)
        {
            GarmentTypeMetaData garmenttypeMetaDatas = null;
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_GarmentType_GetAll", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    garmenttypeMetaDatas = result.Tables[0].ToListNullableTypes<GarmentTypeMetaData>().FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return garmenttypeMetaDatas;
        }

        /// <summary>
        /// GarmentType DML Opearation
        /// </summary>
        /// <param name="garmenttypeMetaDatas"></param>
        /// <returns></returns>
        public DataSet GarmentTypeDML(GarmentTypeMetaData garmenttypeMetaDatas)
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

				prms.Add(new SqlParameter("ID", garmenttypeMetaDatas.ID));
				prms.Add(new SqlParameter("GarmetType", garmenttypeMetaDatas.GarmetType));
				prms.Add(new SqlParameter("isActive", garmenttypeMetaDatas.isActive));
				prms.Add(new SqlParameter("CreatedOn", garmenttypeMetaDatas.CreatedOn));
				prms.Add(new SqlParameter("CreatedBy", garmenttypeMetaDatas.CreatedBy));
				prms.Add(new SqlParameter("GImage", garmenttypeMetaDatas.GImage));
				prms.Add(new SqlParameter("CompanyID", garmenttypeMetaDatas.CompanyID));
				prms.Add(new SqlParameter("CategoryID", garmenttypeMetaDatas.CategoryID));
				prms.Add(new SqlParameter("TagCount", garmenttypeMetaDatas.TagCount));
				prms.Add(new SqlParameter("Weight", garmenttypeMetaDatas.Weight));
				prms.Add(new SqlParameter("Mode", garmenttypeMetaDatas.Mode));

                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_GarmentType_DML", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
	}
}

