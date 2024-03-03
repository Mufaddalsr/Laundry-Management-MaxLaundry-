using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LaundryWeb_DLL
{
    public class UserLocationDLL
    {
        /// <summary>
        /// Get ALL UserLocation
        /// </summary>
        /// <param name="userID, locationID"></param>
        /// <returns></returns>
        public List<UserLocationMetaData> GetAllUserLocation(int userID = 0, int locationID = 0)
        {
            DataSet result = null;
			List<UserLocationMetaData> userlocationMetaDatas = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("UserID", userID)); 
				prms.Add(new SqlParameter("LocationID", locationID));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_UserLocation_GetAll", prms.ToArray());
				if (result.Tables.Count > 0)
                {
                    userlocationMetaDatas = result.Tables[0].ToListNullableTypes<UserLocationMetaData>();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return userlocationMetaDatas;
        }

        /// <summary>
        /// Get UserLocation by UserID, LocationID
        /// </summary>
        /// <param name="userID, locationID"></param>
        /// <returns></returns>
        public UserLocationMetaData GetUserLocationbyId(int userID = 0, int locationID = 0)
        {
            UserLocationMetaData userlocationMetaDatas = null;
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("UserID", userID)); 
				prms.Add(new SqlParameter("LocationID", locationID));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_UserLocation_GetAll", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    userlocationMetaDatas = result.Tables[0].ToListNullableTypes<UserLocationMetaData>().FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return userlocationMetaDatas;
        }

        /// <summary>
        /// UserLocation DML Opearation
        /// </summary>
        /// <param name="userlocationMetaDatas"></param>
        /// <returns></returns>
        public DataSet UserLocationDML(UserLocationMetaData userlocationMetaDatas)
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

				prms.Add(new SqlParameter("UserID", userlocationMetaDatas.UserID));
				prms.Add(new SqlParameter("LocationID", userlocationMetaDatas.LocationID));
				prms.Add(new SqlParameter("Mode", userlocationMetaDatas.Mode));

                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_UserLocation_DML", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
	}
}

