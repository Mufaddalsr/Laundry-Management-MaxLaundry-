using LaundryWeb_DLL.DBHelper;
using LaundryWeb_MetaData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LaundryWeb_DLL
{
    public class CategoryDLL
    {
        /// <summary>
        /// Get ALL Category
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public List<CategoryMetaData> GetAllCategory(int id = 0)
        {
            DataSet result = null;
			List<CategoryMetaData> categoryMetaDatas = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_Category_GetAll", prms.ToArray());
				if (result.Tables.Count > 0)
                {
                    categoryMetaDatas = result.Tables[0].ToListNullableTypes<CategoryMetaData>();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return categoryMetaDatas;
        }

        /// <summary>
        /// Get Category by ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public CategoryMetaData GetCategorybyId(int id = 0)
        {
            CategoryMetaData categoryMetaDatas = null;
            DataSet result = null;
            List<SqlParameter> prms = null;
            try
            {
                result = new DataSet();
                prms = new List<SqlParameter>();
				prms.Add(new SqlParameter("ID", id));

                result = new DBHelper.DBHelper().GetDatasetFromSP("sp_Category_GetAll", prms.ToArray());
                if (result.Tables.Count > 0)
                {
                    categoryMetaDatas = result.Tables[0].ToListNullableTypes<CategoryMetaData>().FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return categoryMetaDatas;
        }

        /// <summary>
        /// Category DML Opearation
        /// </summary>
        /// <param name="categoryMetaDatas"></param>
        /// <returns></returns>
        public DataSet CategoryDML(CategoryMetaData categoryMetaDatas)
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

				prms.Add(new SqlParameter("ID", categoryMetaDatas.ID));
				prms.Add(new SqlParameter("Category", categoryMetaDatas.Category));
				prms.Add(new SqlParameter("isActive", categoryMetaDatas.isActive));
				prms.Add(new SqlParameter("CompanyID", categoryMetaDatas.CompanyID));
				prms.Add(new SqlParameter("Mode", categoryMetaDatas.Mode));

                result = new DBHelper.DBHelper().GetDatasetFromSPWithResult("sp_Category_DML", prms.ToArray());
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
	}
}

