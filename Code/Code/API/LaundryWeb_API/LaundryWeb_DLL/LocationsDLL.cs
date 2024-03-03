using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LaundryWeb_DLL
{
    public class LocationsDLL
    {
        /// <summary>
        /// Get ALL Locations
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public List<LocationsMetaData> GetAllLocations(int id = 0)
        {
            DataSet result = null;
			List<LocationsMetaData> locationsMetaDatas = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_Locations_GetAll", prms.ToArray());
				if (result.Tables.Count > 0)
                {
                    locationsMetaDatas = result.Tables[0].ToListNullableTypes<LocationsMetaData>();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return locationsMetaDatas;
        }

        /// <summary>
        /// Get Locations by ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public LocationsMetaData GetLocationsbyId(int id = 0)
        {
            LocationsMetaData locationsMetaDatas = null;
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_Locations_GetAll", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    locationsMetaDatas = result.Tables[0].ToListNullableTypes<LocationsMetaData>().FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return locationsMetaDatas;
        }

        /// <summary>
        /// Locations DML Opearation
        /// </summary>
        /// <param name="locationsMetaDatas"></param>
        /// <returns></returns>
        public DataSet LocationsDML(LocationsMetaData locationsMetaDatas)
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

				prms.Add(new SqlParameter("ID", locationsMetaDatas.ID));
				prms.Add(new SqlParameter("LocationCode", locationsMetaDatas.LocationCode));
				prms.Add(new SqlParameter("LocationName", locationsMetaDatas.LocationName));
				prms.Add(new SqlParameter("LocationType", locationsMetaDatas.LocationType));
				prms.Add(new SqlParameter("isActive", locationsMetaDatas.isActive));
				prms.Add(new SqlParameter("CompanyID", locationsMetaDatas.CompanyID));
				prms.Add(new SqlParameter("LastOrderID", locationsMetaDatas.LastOrderID));
				prms.Add(new SqlParameter("Mode", locationsMetaDatas.Mode));

                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_Locations_DML", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
	}
}

