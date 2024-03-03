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
    [Route("api/GarmentType")]
    public class GarmentTypeController : Controller
    {
        #region Get All GarmentType
        [HttpGet]
        public IActionResult Get()
        {
            List<GarmentTypeMetaData> garmentTypeMetaDatas = null;
            GarmentTypeDLL garmentTypeDLL = null;
            int id = 0;
            try
            {
                garmentTypeDLL = new GarmentTypeDLL();

                garmentTypeMetaDatas = garmentTypeDLL.GetAllGarmentType(id);
                if (garmentTypeMetaDatas.Count >= 0)
                {
                    return Ok(garmentTypeMetaDatas);
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

        #region Get GarmentType Data By Id
        // GET: api/GarmentType/5
        [HttpGet("{id}")]
        public IActionResult Get(int id = 0)
        {
            GarmentTypeDLL garmentTypeDLL = null;
            GarmentTypeMetaData garmentTypeMetaDatas = null;
            try
            {
                garmentTypeDLL = new GarmentTypeDLL();

                garmentTypeMetaDatas = garmentTypeDLL.GetGarmentTypebyId(id);
                if (garmentTypeMetaDatas != null)
                {
                    return Ok(garmentTypeMetaDatas);
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

        #region Add New GarmentType
        [HttpPost]
        public IActionResult Post([FromBody] GarmentTypeMetaData garmentTypeMetaDatas)
        {
            DataSet result = null;
            GarmentTypeDLL garmentTypeDLL = null;
            try
            {
                garmentTypeDLL = new GarmentTypeDLL();
                result = new DataSet();

                garmentTypeMetaDatas.Mode = 1;
                result = garmentTypeDLL.GarmentTypeDML(garmentTypeMetaDatas);

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

        #region Update GarmentType data
        // PUT: api/GarmentType/5
        [HttpPut]
        public IActionResult Put([FromBody] GarmentTypeMetaData garmentTypeMetaDatas)
        {
            DataSet result = null;
            GarmentTypeDLL garmentTypeDLL = null;
            try
            {
                garmentTypeDLL = new GarmentTypeDLL();
                result = new DataSet();

                garmentTypeMetaDatas.Mode = 2;
                result = garmentTypeDLL.GarmentTypeDML(garmentTypeMetaDatas);

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

        #region Delete GarmentType
        [HttpDelete]
        public IActionResult Delete(int id = 0)
        {
            DataSet result = null;
            GarmentTypeDLL garmentTypeDLL = null;
            GarmentTypeMetaData garmentTypeMetaDatas = null;
            try
            {
                garmentTypeDLL = new GarmentTypeDLL();
                result = new DataSet();
                garmentTypeMetaDatas = new GarmentTypeMetaData();

                garmentTypeMetaDatas.ID = id;
                garmentTypeMetaDatas.Mode = 3;
                result = garmentTypeDLL.GarmentTypeDML(garmentTypeMetaDatas);

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