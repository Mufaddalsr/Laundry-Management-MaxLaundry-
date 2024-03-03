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
    [Route("api/AuditLog")]
    public class AuditLogController : Controller
    {
        #region Get All AuditLog
        [HttpGet]
        public IActionResult Get()
        {
            List<AuditLogMetaData> auditLogMetaDatas = null;
            AuditLogDLL auditLogDLL = null;
            int tID = 0;
            try
            {
                auditLogDLL = new AuditLogDLL();

                auditLogMetaDatas = auditLogDLL.GetAllAuditLog(tID);
                if (auditLogMetaDatas.Count >= 0)
                {
                    return Ok(auditLogMetaDatas);
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

        #region Get AuditLog Data By Id
        // GET: api/AuditLog/5
        [HttpGet("{tID}")]
        public IActionResult Get(int tID = 0)
        {
            AuditLogDLL auditLogDLL = null;
            AuditLogMetaData auditLogMetaDatas = null;
            try
            {
                auditLogDLL = new AuditLogDLL();

                auditLogMetaDatas = auditLogDLL.GetAuditLogbyId(tID);
                if (auditLogMetaDatas != null)
                {
                    return Ok(auditLogMetaDatas);
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

        #region Add New AuditLog
        [HttpPost]
        public IActionResult Post([FromBody] AuditLogMetaData auditLogMetaDatas)
        {
            DataSet result = null;
            AuditLogDLL auditLogDLL = null;
            try
            {
                auditLogDLL = new AuditLogDLL();
                result = new DataSet();

                auditLogMetaDatas.Mode = 1;
                result = auditLogDLL.AuditLogDML(auditLogMetaDatas);

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

        #region Update AuditLog data
        // PUT: api/AuditLog/5
        [HttpPut]
        public IActionResult Put([FromBody] AuditLogMetaData auditLogMetaDatas)
        {
            DataSet result = null;
            AuditLogDLL auditLogDLL = null;
            try
            {
                auditLogDLL = new AuditLogDLL();
                result = new DataSet();

                auditLogMetaDatas.Mode = 2;
                result = auditLogDLL.AuditLogDML(auditLogMetaDatas);

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

        #region Delete AuditLog
        [HttpDelete]
        public IActionResult Delete(int tID = 0)
        {
            DataSet result = null;
            AuditLogDLL auditLogDLL = null;
            AuditLogMetaData auditLogMetaDatas = null;
            try
            {
                auditLogDLL = new AuditLogDLL();
                result = new DataSet();
                auditLogMetaDatas = new AuditLogMetaData();

                auditLogMetaDatas.TID = tID;
                auditLogMetaDatas.Mode = 3;
                result = auditLogDLL.AuditLogDML(auditLogMetaDatas);

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