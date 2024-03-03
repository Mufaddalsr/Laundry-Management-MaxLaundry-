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
    [Route("api/Services")]
    public class ServicesController : Controller
    {
        #region Get All Services
        [HttpGet]
        public IActionResult Get()
        {
            List<ServicesMetaData> serviceMetaDatas = null;
            ServicesDLL serviceDLL = null;
            int id = 0;
            try
            {
                serviceDLL = new ServicesDLL();

                serviceMetaDatas = serviceDLL.GetAllServices(id);
                if (serviceMetaDatas.Count >= 0)
                {
                    return Ok(serviceMetaDatas);
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

        #region Get Services Data By Id
        // GET: api/Services/5
        [HttpGet("{id}")]
        public IActionResult Get(int id = 0)
        {
            ServicesDLL serviceDLL = null;
            ServicesMetaData serviceMetaDatas = null;
            try
            {
                serviceDLL = new ServicesDLL();

                serviceMetaDatas = serviceDLL.GetServicesbyId(id);
                if (serviceMetaDatas != null)
                {
                    return Ok(serviceMetaDatas);
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

        #region Add New Services
        [HttpPost]
        public IActionResult Post([FromBody] ServicesMetaData serviceMetaDatas)
        {
            DataSet result = null;
            ServicesDLL serviceDLL = null;
            try
            {
                serviceDLL = new ServicesDLL();
                result = new DataSet();

                serviceMetaDatas.Mode = 1;
                result = serviceDLL.ServicesDML(serviceMetaDatas);

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

        #region Update Services data
        // PUT: api/Services/5
        [HttpPut]
        public IActionResult Put([FromBody] ServicesMetaData serviceMetaDatas)
        {
            DataSet result = null;
            ServicesDLL serviceDLL = null;
            try
            {
                serviceDLL = new ServicesDLL();
                result = new DataSet();

                serviceMetaDatas.Mode = 2;
                result = serviceDLL.ServicesDML(serviceMetaDatas);

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

        #region Delete Services
        [HttpDelete]
        public IActionResult Delete(int id = 0)
        {
            DataSet result = null;
            ServicesDLL serviceDLL = null;
            ServicesMetaData serviceMetaDatas = null;
            try
            {
                serviceDLL = new ServicesDLL();
                result = new DataSet();
                serviceMetaDatas = new ServicesMetaData();

                serviceMetaDatas.ID = id;
                serviceMetaDatas.Mode = 3;
                result = serviceDLL.ServicesDML(serviceMetaDatas);

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