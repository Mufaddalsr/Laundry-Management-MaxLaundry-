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
    [Route("api/ReportLog")]
    public class ReportLogController : Controller
    {
        #region Get All ReportLog
        [HttpGet]
        public IActionResult Get()
        {
            List<ReportLogMetaData> reportLogMetaDatas = null;
            ReportLogDLL reportLogDLL = null;
            int id = 0;
            try
            {
                reportLogDLL = new ReportLogDLL();

                reportLogMetaDatas = reportLogDLL.GetAllReportLog(id);
                if (reportLogMetaDatas.Count >= 0)
                {
                    return Ok(reportLogMetaDatas);
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

        #region Get ReportLog Data By Id
        // GET: api/ReportLog/5
        [HttpGet("{id}")]
        public IActionResult Get(int id = 0)
        {
            ReportLogDLL reportLogDLL = null;
            ReportLogMetaData reportLogMetaDatas = null;
            try
            {
                reportLogDLL = new ReportLogDLL();

                reportLogMetaDatas = reportLogDLL.GetReportLogbyId(id);
                if (reportLogMetaDatas != null)
                {
                    return Ok(reportLogMetaDatas);
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

        #region Add New ReportLog
        [HttpPost]
        public IActionResult Post([FromBody] ReportLogMetaData reportLogMetaDatas)
        {
            DataSet result = null;
            ReportLogDLL reportLogDLL = null;
            try
            {
                reportLogDLL = new ReportLogDLL();
                result = new DataSet();

                reportLogMetaDatas.Mode = 1;
                result = reportLogDLL.ReportLogDML(reportLogMetaDatas);

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

        #region Update ReportLog data
        // PUT: api/ReportLog/5
        [HttpPut]
        public IActionResult Put([FromBody] ReportLogMetaData reportLogMetaDatas)
        {
            DataSet result = null;
            ReportLogDLL reportLogDLL = null;
            try
            {
                reportLogDLL = new ReportLogDLL();
                result = new DataSet();

                reportLogMetaDatas.Mode = 2;
                result = reportLogDLL.ReportLogDML(reportLogMetaDatas);

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

        #region Delete ReportLog
        [HttpDelete]
        public IActionResult Delete(int id = 0)
        {
            DataSet result = null;
            ReportLogDLL reportLogDLL = null;
            ReportLogMetaData reportLogMetaDatas = null;
            try
            {
                reportLogDLL = new ReportLogDLL();
                result = new DataSet();
                reportLogMetaDatas = new ReportLogMetaData();

                reportLogMetaDatas.ID = id;
                reportLogMetaDatas.Mode = 3;
                result = reportLogDLL.ReportLogDML(reportLogMetaDatas);

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