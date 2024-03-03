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
    [Route("api/TblRoleDetails")]
    public class TblRoleDetailsController : Controller
    {
        #region Get All TblRoleDetails
        [HttpGet]
        public IActionResult Get()
        {
            List<TblRoleDetailsMetaData> tblRoleDetailMetaDatas = null;
            TblRoleDetailsDLL tblRoleDetailDLL = null;
            int tID = 0;
            try
            {
                tblRoleDetailDLL = new TblRoleDetailsDLL();

                tblRoleDetailMetaDatas = tblRoleDetailDLL.GetAlltblRoleDetails(tID);
                if (tblRoleDetailMetaDatas.Count >= 0)
                {
                    return Ok(tblRoleDetailMetaDatas);
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

        #region Get TblRoleDetails Data By Id
        // GET: api/TblRoleDetails/5
        [HttpGet("{tID}")]
        public IActionResult Get(int tID = 0)
        {
            TblRoleDetailsDLL tblRoleDetailDLL = null;
            TblRoleDetailsMetaData tblRoleDetailMetaDatas = null;
            try
            {
                tblRoleDetailDLL = new TblRoleDetailsDLL();

                tblRoleDetailMetaDatas = tblRoleDetailDLL.GettblRoleDetailsbyId(tID);
                if (tblRoleDetailMetaDatas != null)
                {
                    return Ok(tblRoleDetailMetaDatas);
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

        #region Add New TblRoleDetails
        [HttpPost]
        public IActionResult Post([FromBody] TblRoleDetailsMetaData tblRoleDetailMetaDatas)
        {
            DataSet result = null;
            TblRoleDetailsDLL tblRoleDetailDLL = null;
            try
            {
                tblRoleDetailDLL = new TblRoleDetailsDLL();
                result = new DataSet();

                tblRoleDetailMetaDatas.Mode = 1;
                result = tblRoleDetailDLL.tblRoleDetailsDML(tblRoleDetailMetaDatas);

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

        #region Update TblRoleDetails data
        // PUT: api/TblRoleDetails/5
        [HttpPut]
        public IActionResult Put([FromBody] TblRoleDetailsMetaData tblRoleDetailMetaDatas)
        {
            DataSet result = null;
            TblRoleDetailsDLL tblRoleDetailDLL = null;
            try
            {
                tblRoleDetailDLL = new TblRoleDetailsDLL();
                result = new DataSet();

                tblRoleDetailMetaDatas.Mode = 2;
                result = tblRoleDetailDLL.tblRoleDetailsDML(tblRoleDetailMetaDatas);

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

        #region Delete TblRoleDetails
        [HttpDelete]
        public IActionResult Delete(int tID = 0)
        {
            DataSet result = null;
            TblRoleDetailsDLL tblRoleDetailDLL = null;
            TblRoleDetailsMetaData tblRoleDetailMetaDatas = null;
            try
            {
                tblRoleDetailDLL = new TblRoleDetailsDLL();
                result = new DataSet();
                tblRoleDetailMetaDatas = new TblRoleDetailsMetaData();

                tblRoleDetailMetaDatas.TID = tID;
                tblRoleDetailMetaDatas.Mode = 3;
                result = tblRoleDetailDLL.tblRoleDetailsDML(tblRoleDetailMetaDatas);

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