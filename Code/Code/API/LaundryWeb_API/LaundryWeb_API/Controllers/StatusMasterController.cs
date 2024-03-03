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
    [Route("api/StatusMaster")]
    public class StatusMasterController : Controller
    {
        #region Get All StatusMaster
        [HttpGet]
        public IActionResult Get()
        {
            List<StatusMasterMetaData> statusMasterMetaDatas = null;
            StatusMasterDLL statusMasterDLL = null;
            int id = 0;
            try
            {
                statusMasterDLL = new StatusMasterDLL();

                statusMasterMetaDatas = statusMasterDLL.GetAllStatusMaster(id);
                if (statusMasterMetaDatas.Count >= 0)
                {
                    return Ok(statusMasterMetaDatas);
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

        #region Get StatusMaster Data By Id
        // GET: api/StatusMaster/5
        [HttpGet("{id}")]
        public IActionResult Get(int id = 0)
        {
            StatusMasterDLL statusMasterDLL = null;
            StatusMasterMetaData statusMasterMetaDatas = null;
            try
            {
                statusMasterDLL = new StatusMasterDLL();

                statusMasterMetaDatas = statusMasterDLL.GetStatusMasterbyId(id);
                if (statusMasterMetaDatas != null)
                {
                    return Ok(statusMasterMetaDatas);
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

        #region Add New StatusMaster
        [HttpPost]
        public IActionResult Post([FromBody] StatusMasterMetaData statusMasterMetaDatas)
        {
            DataSet result = null;
            StatusMasterDLL statusMasterDLL = null;
            try
            {
                statusMasterDLL = new StatusMasterDLL();
                result = new DataSet();

                statusMasterMetaDatas.Mode = 1;
                result = statusMasterDLL.StatusMasterDML(statusMasterMetaDatas);

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

        #region Update StatusMaster data
        // PUT: api/StatusMaster/5
        [HttpPut]
        public IActionResult Put([FromBody] StatusMasterMetaData statusMasterMetaDatas)
        {
            DataSet result = null;
            StatusMasterDLL statusMasterDLL = null;
            try
            {
                statusMasterDLL = new StatusMasterDLL();
                result = new DataSet();

                statusMasterMetaDatas.Mode = 2;
                result = statusMasterDLL.StatusMasterDML(statusMasterMetaDatas);

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

        #region Delete StatusMaster
        [HttpDelete]
        public IActionResult Delete(int id = 0)
        {
            DataSet result = null;
            StatusMasterDLL statusMasterDLL = null;
            StatusMasterMetaData statusMasterMetaDatas = null;
            try
            {
                statusMasterDLL = new StatusMasterDLL();
                result = new DataSet();
                statusMasterMetaDatas = new StatusMasterMetaData();

                statusMasterMetaDatas.ID = id;
                statusMasterMetaDatas.Mode = 3;
                result = statusMasterDLL.StatusMasterDML(statusMasterMetaDatas);

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