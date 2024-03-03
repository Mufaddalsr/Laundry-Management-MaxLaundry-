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
    [Route("api/PromotionLocation")]
    public class PromotionLocationController : Controller
    {
        #region Get All PromotionLocation
        [HttpGet]
        public IActionResult Get()
        {
            List<PromotionLocationMetaData> promotionLocationMetaDatas = null;
            PromotionLocationDLL promotionLocationDLL = null;
            int tID = 0;
            try
            {
                promotionLocationDLL = new PromotionLocationDLL();

                promotionLocationMetaDatas = promotionLocationDLL.GetAllPromotionLocation(tID);
                if (promotionLocationMetaDatas.Count >= 0)
                {
                    return Ok(promotionLocationMetaDatas);
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

        #region Get PromotionLocation Data By Id
        // GET: api/PromotionLocation/5
        [HttpGet("{tID}")]
        public IActionResult Get(int tID = 0)
        {
            PromotionLocationDLL promotionLocationDLL = null;
            PromotionLocationMetaData promotionLocationMetaDatas = null;
            try
            {
                promotionLocationDLL = new PromotionLocationDLL();

                promotionLocationMetaDatas = promotionLocationDLL.GetPromotionLocationbyId(tID);
                if (promotionLocationMetaDatas != null)
                {
                    return Ok(promotionLocationMetaDatas);
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

        #region Add New PromotionLocation
        [HttpPost]
        public IActionResult Post([FromBody] PromotionLocationMetaData promotionLocationMetaDatas)
        {
            DataSet result = null;
            PromotionLocationDLL promotionLocationDLL = null;
            try
            {
                promotionLocationDLL = new PromotionLocationDLL();
                result = new DataSet();

                promotionLocationMetaDatas.Mode = 1;
                result = promotionLocationDLL.PromotionLocationDML(promotionLocationMetaDatas);

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

        #region Update PromotionLocation data
        // PUT: api/PromotionLocation/5
        [HttpPut]
        public IActionResult Put([FromBody] PromotionLocationMetaData promotionLocationMetaDatas)
        {
            DataSet result = null;
            PromotionLocationDLL promotionLocationDLL = null;
            try
            {
                promotionLocationDLL = new PromotionLocationDLL();
                result = new DataSet();

                promotionLocationMetaDatas.Mode = 2;
                result = promotionLocationDLL.PromotionLocationDML(promotionLocationMetaDatas);

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

        #region Delete PromotionLocation
        [HttpDelete]
        public IActionResult Delete(int tID = 0)
        {
            DataSet result = null;
            PromotionLocationDLL promotionLocationDLL = null;
            PromotionLocationMetaData promotionLocationMetaDatas = null;
            try
            {
                promotionLocationDLL = new PromotionLocationDLL();
                result = new DataSet();
                promotionLocationMetaDatas = new PromotionLocationMetaData();

                promotionLocationMetaDatas.TID = tID;
                promotionLocationMetaDatas.Mode = 3;
                result = promotionLocationDLL.PromotionLocationDML(promotionLocationMetaDatas);

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