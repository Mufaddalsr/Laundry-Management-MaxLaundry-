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
    [Route("api/TblUser")]
    public class TblUserController : Controller
    {
        #region Get All TblUser
        [HttpGet]
        public IActionResult Get()
        {
            List<TblUserMetaData> tblUserMetaDatas = null;
            TblUserDLL tblUserDLL = null;
            int uID = 0;
            try
            {
                tblUserDLL = new TblUserDLL();

                tblUserMetaDatas = tblUserDLL.GetAlltblUser(uID);
                if (tblUserMetaDatas.Count >= 0)
                {
                    return Ok(tblUserMetaDatas);
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

        #region Get TblUser Data By Id
        // GET: api/TblUser/5
        [HttpGet("{uID}")]
        public IActionResult Get(int uID = 0)
        {
            TblUserDLL tblUserDLL = null;
            TblUserMetaData tblUserMetaDatas = null;
            try
            {
                tblUserDLL = new TblUserDLL();

                tblUserMetaDatas = tblUserDLL.GettblUserbyId(uID);
                if (tblUserMetaDatas != null)
                {
                    return Ok(tblUserMetaDatas);
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

        #region Add New TblUser
        [HttpPost]
        public IActionResult Post([FromBody] TblUserMetaData tblUserMetaDatas)
        {
            DataSet result = null;
            TblUserDLL tblUserDLL = null;
            try
            {
                tblUserDLL = new TblUserDLL();
                result = new DataSet();

                tblUserMetaDatas.Mode = 1;
                result = tblUserDLL.tblUserDML(tblUserMetaDatas);

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

        #region Update TblUser data
        // PUT: api/TblUser/5
        [HttpPut]
        public IActionResult Put([FromBody] TblUserMetaData tblUserMetaDatas)
        {
            DataSet result = null;
            TblUserDLL tblUserDLL = null;
            try
            {
                tblUserDLL = new TblUserDLL();
                result = new DataSet();

                tblUserMetaDatas.Mode = 2;
                result = tblUserDLL.tblUserDML(tblUserMetaDatas);

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

        #region Delete TblUser
        [HttpDelete]
        public IActionResult Delete(int uID = 0)
        {
            DataSet result = null;
            TblUserDLL tblUserDLL = null;
            TblUserMetaData tblUserMetaDatas = null;
            try
            {
                tblUserDLL = new TblUserDLL();
                result = new DataSet();
                tblUserMetaDatas = new TblUserMetaData();

                tblUserMetaDatas.UID = uID;
                tblUserMetaDatas.Mode = 3;
                result = tblUserDLL.tblUserDML(tblUserMetaDatas);

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