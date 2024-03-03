using LaundryWeb_DLL;
using LaundryWeb_MetaData;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Data;
using System.Net;

namespace LaundryWeb_API.Controllers
{
    [Produces("application/json")]
    [Route("api/Category")]
    public class CategoryController : Controller
    {
        #region Get All Category
        [HttpGet]
        public IActionResult Get()
        {
            List<CategoryMetaData> categoryMetaDatas = null;
            CategoryDLL categoryDLL = null;
            int id = 0;
            try
            {
                categoryDLL = new CategoryDLL();

                categoryMetaDatas = categoryDLL.GetAllCategory(id);
                if (categoryMetaDatas.Count >= 0)
                {
                    return Ok(categoryMetaDatas);
                }
                else
                {
                    return NoContent();
                }
            }
            catch (Exception ex)
            {
                return Ok(new
                {
                    statusCode = HttpStatusCode.InternalServerError,
                    success = false,
                    errorMessage = ex.Message
                });
            }
        }
        #endregion

        #region Get Category Data By Id
        // GET: api/Category/5
        [HttpGet("{id}")]
        public IActionResult Get(int id = 0)
        {
            CategoryDLL categoryDLL = null;
            CategoryMetaData categoryMetaDatas = null;
            try
            {
                categoryDLL = new CategoryDLL();

                categoryMetaDatas = categoryDLL.GetCategorybyId(id);
                if (categoryMetaDatas != null)
                {
                    return Ok(categoryMetaDatas);
                }
                else
                {
                    return NoContent();
                }
            }
            catch (Exception ex)
            {
                return Ok(new
                {
                    statusCode = HttpStatusCode.InternalServerError,
                    success = false,
                    errorMessage = ex.Message
                });
            }
        }
        #endregion

        #region Add New Category
        [HttpPost]
        public IActionResult Post([FromBody] CategoryMetaData categoryMetaDatas)
        {
            DataSet result = null;
            CategoryDLL categoryDLL = null;
            try
            {
                categoryDLL = new CategoryDLL();
                result = new DataSet();

                categoryMetaDatas.Mode = 1;
                result = categoryDLL.CategoryDML(categoryMetaDatas);

                if (Convert.ToInt32(result.Tables[1].Rows[0][1]) > 0)
                {
                    return Ok(new
                    {
                        statusCode = HttpStatusCode.OK,
                        success = true,
                        data = Convert.ToInt32(result.Tables[1].Rows[0][1])
                    });
                }
                else
                {
                    return Ok(new
                    {
                        statusCode = HttpStatusCode.InternalServerError,
                        success = false,
                        data = 0
                    });
                }
            }
            catch (Exception ex)
            {
                return Ok(new
                {
                    statusCode = HttpStatusCode.InternalServerError,
                    success = false,
                    errorMessage = ex.Message
                });
            }
        }
        #endregion

        #region Update Category data
        // PUT: api/Category/5
        [HttpPut]
        public IActionResult Put([FromBody] CategoryMetaData categoryMetaDatas)
        {
            DataSet result = null;
            CategoryDLL categoryDLL = null;
            try
            {
                categoryDLL = new CategoryDLL();
                result = new DataSet();

                categoryMetaDatas.Mode = 2;
                result = categoryDLL.CategoryDML(categoryMetaDatas);

                if (Convert.ToInt32(result.Tables[1].Rows[0][1]) > 0)
                {
                    return Ok(new
                    {
                        statusCode = HttpStatusCode.OK,
                        success = true,
                        data = Convert.ToInt32(result.Tables[1].Rows[0][1])
                    });
                }
                else
                {
                    return Ok(new
                    {
                        statusCode = HttpStatusCode.InternalServerError,
                        success = false,
                        data = 0
                    });
                }
            }
            catch (Exception ex)
            {
                return Ok(new
                {
                    statusCode = HttpStatusCode.InternalServerError,
                    success = false,
                    errorMessage = ex.Message
                });
            }
        }
        #endregion

        #region Delete Category
        [HttpDelete]
        public IActionResult Delete(int id = 0)
        {
            DataSet result = null;
            CategoryDLL categoryDLL = null;
            CategoryMetaData categoryMetaDatas = null;
            try
            {
                categoryDLL = new CategoryDLL();
                result = new DataSet();
                categoryMetaDatas = new CategoryMetaData();

                categoryMetaDatas.ID = id;
                categoryMetaDatas.Mode = 3;
                result = categoryDLL.CategoryDML(categoryMetaDatas);

                if (Convert.ToInt32(result.Tables[1].Rows[0][1]) > 0)
                {
                    return Ok(new
                    {
                        statusCode = HttpStatusCode.OK,
                        success = true
                    });
                }
                else
                {
                    return Ok(new
                    {
                        statusCode = HttpStatusCode.InternalServerError,
                        success = false,
                        data = 0
                    });
                }
            }
            catch (Exception ex)
            {
                return Ok(new
                {
                    statusCode = HttpStatusCode.InternalServerError,
                    success = false,
                    errorMessage = ex.Message
                });
            }
        }
        #endregion
    }
}