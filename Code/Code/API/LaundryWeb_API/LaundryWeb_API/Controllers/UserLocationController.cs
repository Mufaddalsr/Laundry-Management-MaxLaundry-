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
    [Route("api/UserLocation")]
    public class UserLocationController : Controller
    {
        #region Get All UserLocation
        [HttpGet]
        public IActionResult Get()
        {
            List<UserLocationMetaData> userLocationMetaDatas = null;
            UserLocationDLL userLocationDLL = null;
            int userID = 0;
            int locationID = 0;
            try
            {
                userLocationDLL = new UserLocationDLL();

                userLocationMetaDatas = userLocationDLL.GetAllUserLocation(userID, locationID);
                if (userLocationMetaDatas.Count >= 0)
                {
                    return Ok(userLocationMetaDatas);
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

        #region Get UserLocation Data By Id
        // GET: api/UserLocation/5
        [HttpGet("{userID}/{locationID}")]
        public IActionResult Get(int userID = 0, int locationID = 0)
        {
            UserLocationDLL userLocationDLL = null;
            UserLocationMetaData userLocationMetaDatas = null;
            try
            {
                userLocationDLL = new UserLocationDLL();

                userLocationMetaDatas = userLocationDLL.GetUserLocationbyId(userID, locationID);
                if (userLocationMetaDatas != null)
                {
                    return Ok(userLocationMetaDatas);
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

        #region Add New UserLocation
        [HttpPost]
        public IActionResult Post([FromBody] UserLocationMetaData userLocationMetaDatas)
        {
            DataSet result = null;
            UserLocationDLL userLocationDLL = null;
            try
            {
                userLocationDLL = new UserLocationDLL();
                result = new DataSet();

                userLocationMetaDatas.Mode = 1;
                result = userLocationDLL.UserLocationDML(userLocationMetaDatas);

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

        #region Update UserLocation data
        // PUT: api/UserLocation/5
        [HttpPut]
        public IActionResult Put([FromBody] UserLocationMetaData userLocationMetaDatas)
        {
            DataSet result = null;
            UserLocationDLL userLocationDLL = null;
            try
            {
                userLocationDLL = new UserLocationDLL();
                result = new DataSet();

                userLocationMetaDatas.Mode = 2;
                result = userLocationDLL.UserLocationDML(userLocationMetaDatas);

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

        #region Delete UserLocation
        [HttpDelete]
        public IActionResult Delete(int userID = 0, int locationID = 0)
        {
            DataSet result = null;
            UserLocationDLL userLocationDLL = null;
            UserLocationMetaData userLocationMetaDatas = null;
            try
            {
                userLocationDLL = new UserLocationDLL();
                result = new DataSet();
                userLocationMetaDatas = new UserLocationMetaData();

                userLocationMetaDatas.UserID = userID;
                userLocationMetaDatas.LocationID = locationID;
                userLocationMetaDatas.Mode = 3;
                result = userLocationDLL.UserLocationDML(userLocationMetaDatas);

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