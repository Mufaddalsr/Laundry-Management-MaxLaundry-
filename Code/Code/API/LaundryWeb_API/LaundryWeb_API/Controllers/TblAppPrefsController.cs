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
    [Route("api/TblAppPrefs")]
    public class TblAppPrefsController : Controller
    {
        #region Get All TblAppPrefs
        [HttpGet]
        public IActionResult Get()
        {
            List<TblAppPrefsMetaData> tblAppPrefMetaDatas = null;
            TblAppPrefsDLL tblAppPrefDLL = null;
            string appSettingId = null;
            try
            {
                tblAppPrefDLL = new TblAppPrefsDLL();

                tblAppPrefMetaDatas = tblAppPrefDLL.GetAlltblAppPrefs(appSettingId);
                if (tblAppPrefMetaDatas.Count >= 0)
                {
                    return Ok(tblAppPrefMetaDatas);
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

        #region Get TblAppPrefs Data By Id
        // GET: api/TblAppPrefs/5
        [HttpGet("{appSettingId}")]
        public IActionResult Get(string appSettingId = null)
        {
            TblAppPrefsDLL tblAppPrefDLL = null;
            TblAppPrefsMetaData tblAppPrefMetaDatas = null;
            try
            {
                tblAppPrefDLL = new TblAppPrefsDLL();

                tblAppPrefMetaDatas = tblAppPrefDLL.GettblAppPrefsbyId(appSettingId);
                if (tblAppPrefMetaDatas != null)
                {
                    return Ok(tblAppPrefMetaDatas);
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

        #region Add New TblAppPrefs
        [HttpPost]
        public IActionResult Post([FromBody] TblAppPrefsMetaData tblAppPrefMetaDatas)
        {
            DataSet result = null;
            TblAppPrefsDLL tblAppPrefDLL = null;
            try
            {
                tblAppPrefDLL = new TblAppPrefsDLL();
                result = new DataSet();

                tblAppPrefMetaDatas.Mode = 1;
                result = tblAppPrefDLL.tblAppPrefsDML(tblAppPrefMetaDatas);

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

        #region Update TblAppPrefs data
        // PUT: api/TblAppPrefs/5
        [HttpPut]
        public IActionResult Put([FromBody] TblAppPrefsMetaData tblAppPrefMetaDatas)
        {
            DataSet result = null;
            TblAppPrefsDLL tblAppPrefDLL = null;
            try
            {
                tblAppPrefDLL = new TblAppPrefsDLL();
                result = new DataSet();

                tblAppPrefMetaDatas.Mode = 2;
                result = tblAppPrefDLL.tblAppPrefsDML(tblAppPrefMetaDatas);

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

        #region Delete TblAppPrefs
        [HttpDelete]
        public IActionResult Delete(string appSettingId = null)
        {
            DataSet result = null;
            TblAppPrefsDLL tblAppPrefDLL = null;
            TblAppPrefsMetaData tblAppPrefMetaDatas = null;
            try
            {
                tblAppPrefDLL = new TblAppPrefsDLL();
                result = new DataSet();
                tblAppPrefMetaDatas = new TblAppPrefsMetaData();

                tblAppPrefMetaDatas.AppSetting = appSettingId;
                tblAppPrefMetaDatas.Mode = 3;
                result = tblAppPrefDLL.tblAppPrefsDML(tblAppPrefMetaDatas);

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