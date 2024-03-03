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
    [Route("api/TblAccess")]
    public class TblAccessController : Controller
    {
        #region Get All TblAccess
        [HttpGet]
        public IActionResult Get()
        {
            List<TblAccessMetaData> tblAccessMetaDatas = null;
            TblAccessDLL tblAccessDLL = null;
            int accessID = 0;
            try
            {
                tblAccessDLL = new TblAccessDLL();

                tblAccessMetaDatas = tblAccessDLL.GetAlltblAccess(accessID);
                if (tblAccessMetaDatas.Count >= 0)
                {
                    return Ok(tblAccessMetaDatas);
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

        #region Get TblAccess Data By Id
        // GET: api/TblAccess/5
        [HttpGet("{accessID}")]
        public IActionResult Get(int accessID = 0)
        {
            TblAccessDLL tblAccessDLL = null;
            TblAccessMetaData tblAccessMetaDatas = null;
            try
            {
                tblAccessDLL = new TblAccessDLL();

                tblAccessMetaDatas = tblAccessDLL.GettblAccessbyId(accessID);
                if (tblAccessMetaDatas != null)
                {
                    return Ok(tblAccessMetaDatas);
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

        #region Add New TblAccess
        [HttpPost]
        public IActionResult Post([FromBody] TblAccessMetaData tblAccessMetaDatas)
        {
            DataSet result = null;
            TblAccessDLL tblAccessDLL = null;
            try
            {
                tblAccessDLL = new TblAccessDLL();
                result = new DataSet();

                tblAccessMetaDatas.Mode = 1;
                result = tblAccessDLL.tblAccessDML(tblAccessMetaDatas);

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

        #region Update TblAccess data
        // PUT: api/TblAccess/5
        [HttpPut]
        public IActionResult Put([FromBody] TblAccessMetaData tblAccessMetaDatas)
        {
            DataSet result = null;
            TblAccessDLL tblAccessDLL = null;
            try
            {
                tblAccessDLL = new TblAccessDLL();
                result = new DataSet();

                tblAccessMetaDatas.Mode = 2;
                result = tblAccessDLL.tblAccessDML(tblAccessMetaDatas);

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

        #region Delete TblAccess
        [HttpDelete]
        public IActionResult Delete(int accessID = 0)
        {
            DataSet result = null;
            TblAccessDLL tblAccessDLL = null;
            TblAccessMetaData tblAccessMetaDatas = null;
            try
            {
                tblAccessDLL = new TblAccessDLL();
                result = new DataSet();
                tblAccessMetaDatas = new TblAccessMetaData();

                tblAccessMetaDatas.AccessID = accessID;
                tblAccessMetaDatas.Mode = 3;
                result = tblAccessDLL.tblAccessDML(tblAccessMetaDatas);

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