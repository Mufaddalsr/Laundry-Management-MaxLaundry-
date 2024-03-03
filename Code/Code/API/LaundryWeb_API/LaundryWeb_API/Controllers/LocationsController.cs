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
    [Route("api/Locations")]
    public class LocationsController : Controller
    {
        #region Get All Locations
        [HttpGet]
        public IActionResult Get()
        {
            List<LocationsMetaData> locationMetaDatas = null;
            LocationsDLL locationDLL = null;
            int id = 0;
            try
            {
                locationDLL = new LocationsDLL();

                locationMetaDatas = locationDLL.GetAllLocations(id);
                if (locationMetaDatas.Count >= 0)
                {
                    return Ok(locationMetaDatas);
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

        #region Get Locations Data By Id
        // GET: api/Locations/5
        [HttpGet("{id}")]
        public IActionResult Get(int id = 0)
        {
            LocationsDLL locationDLL = null;
            LocationsMetaData locationMetaDatas = null;
            try
            {
                locationDLL = new LocationsDLL();

                locationMetaDatas = locationDLL.GetLocationsbyId(id);
                if (locationMetaDatas != null)
                {
                    return Ok(locationMetaDatas);
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

        #region Add New Locations
        [HttpPost]
        public IActionResult Post([FromBody] LocationsMetaData locationMetaDatas)
        {
            DataSet result = null;
            LocationsDLL locationDLL = null;
            try
            {
                locationDLL = new LocationsDLL();
                result = new DataSet();

                locationMetaDatas.Mode = 1;
                result = locationDLL.LocationsDML(locationMetaDatas);

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

        #region Update Locations data
        // PUT: api/Locations/5
        [HttpPut]
        public IActionResult Put([FromBody] LocationsMetaData locationMetaDatas)
        {
            DataSet result = null;
            LocationsDLL locationDLL = null;
            try
            {
                locationDLL = new LocationsDLL();
                result = new DataSet();

                locationMetaDatas.Mode = 2;
                result = locationDLL.LocationsDML(locationMetaDatas);

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

        #region Delete Locations
        [HttpDelete]
        public IActionResult Delete(int id = 0)
        {
            DataSet result = null;
            LocationsDLL locationDLL = null;
            LocationsMetaData locationMetaDatas = null;
            try
            {
                locationDLL = new LocationsDLL();
                result = new DataSet();
                locationMetaDatas = new LocationsMetaData();

                locationMetaDatas.ID = id;
                locationMetaDatas.Mode = 3;
                result = locationDLL.LocationsDML(locationMetaDatas);

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