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
    [Route("api/GarmentService")]
    public class GarmentServiceController : Controller
    {
        #region Get All GarmentService
        [HttpGet]
        public IActionResult Get()
        {
            List<GarmentServiceMetaData> garmentServiceMetaDatas = null;
            GarmentServiceDLL garmentServiceDLL = null;
            int tID = 0;
            try
            {
                garmentServiceDLL = new GarmentServiceDLL();

                garmentServiceMetaDatas = garmentServiceDLL.GetAllGarmentService(tID);
                if (garmentServiceMetaDatas.Count >= 0)
                {
                    return Ok(garmentServiceMetaDatas);
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

        #region Get GarmentService Data By Id
        // GET: api/GarmentService/5
        [HttpGet("{tID}")]
        public IActionResult Get(int tID = 0)
        {
            GarmentServiceDLL garmentServiceDLL = null;
            GarmentServiceMetaData garmentServiceMetaDatas = null;
            try
            {
                garmentServiceDLL = new GarmentServiceDLL();

                garmentServiceMetaDatas = garmentServiceDLL.GetGarmentServicebyId(tID);
                if (garmentServiceMetaDatas != null)
                {
                    return Ok(garmentServiceMetaDatas);
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

        #region Add New GarmentService
        [HttpPost]
        public IActionResult Post([FromBody] GarmentServiceMetaData garmentServiceMetaDatas)
        {
            DataSet result = null;
            GarmentServiceDLL garmentServiceDLL = null;
            try
            {
                garmentServiceDLL = new GarmentServiceDLL();
                result = new DataSet();

                garmentServiceMetaDatas.Mode = 1;
                result = garmentServiceDLL.GarmentServiceDML(garmentServiceMetaDatas);

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

        #region Update GarmentService data
        // PUT: api/GarmentService/5
        [HttpPut]
        public IActionResult Put([FromBody] GarmentServiceMetaData garmentServiceMetaDatas)
        {
            DataSet result = null;
            GarmentServiceDLL garmentServiceDLL = null;
            try
            {
                garmentServiceDLL = new GarmentServiceDLL();
                result = new DataSet();

                garmentServiceMetaDatas.Mode = 2;
                result = garmentServiceDLL.GarmentServiceDML(garmentServiceMetaDatas);

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

        #region Delete GarmentService
        [HttpDelete]
        public IActionResult Delete(int tID = 0)
        {
            DataSet result = null;
            GarmentServiceDLL garmentServiceDLL = null;
            GarmentServiceMetaData garmentServiceMetaDatas = null;
            try
            {
                garmentServiceDLL = new GarmentServiceDLL();
                result = new DataSet();
                garmentServiceMetaDatas = new GarmentServiceMetaData();

                garmentServiceMetaDatas.TID = tID;
                garmentServiceMetaDatas.Mode = 3;
                result = garmentServiceDLL.GarmentServiceDML(garmentServiceMetaDatas);

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