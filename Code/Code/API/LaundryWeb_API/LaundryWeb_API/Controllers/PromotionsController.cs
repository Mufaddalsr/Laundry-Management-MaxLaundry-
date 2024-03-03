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
    [Route("api/Promotions")]
    public class PromotionsController : Controller
    {
        #region Get All Promotions
        [HttpGet]
        public IActionResult Get()
        {
            List<PromotionsMetaData> promotionMetaDatas = null;
            PromotionsDLL promotionDLL = null;
            int id = 0;
            try
            {
                promotionDLL = new PromotionsDLL();

                promotionMetaDatas = promotionDLL.GetAllPromotions(id);
                if (promotionMetaDatas.Count >= 0)
                {
                    return Ok(promotionMetaDatas);
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

        #region Get Promotions Data By Id
        // GET: api/Promotions/5
        [HttpGet("{id}")]
        public IActionResult Get(int id = 0)
        {
            PromotionsDLL promotionDLL = null;
            PromotionsMetaData promotionMetaDatas = null;
            try
            {
                promotionDLL = new PromotionsDLL();

                promotionMetaDatas = promotionDLL.GetPromotionsbyId(id);
                if (promotionMetaDatas != null)
                {
                    return Ok(promotionMetaDatas);
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

        #region Add New Promotions
        [HttpPost]
        public IActionResult Post([FromBody] PromotionsMetaData promotionMetaDatas)
        {
            DataSet result = null;
            PromotionsDLL promotionDLL = null;
            try
            {
                promotionDLL = new PromotionsDLL();
                result = new DataSet();

                promotionMetaDatas.Mode = 1;
                result = promotionDLL.PromotionsDML(promotionMetaDatas);

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

        #region Update Promotions data
        // PUT: api/Promotions/5
        [HttpPut]
        public IActionResult Put([FromBody] PromotionsMetaData promotionMetaDatas)
        {
            DataSet result = null;
            PromotionsDLL promotionDLL = null;
            try
            {
                promotionDLL = new PromotionsDLL();
                result = new DataSet();

                promotionMetaDatas.Mode = 2;
                result = promotionDLL.PromotionsDML(promotionMetaDatas);

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

        #region Delete Promotions
        [HttpDelete]
        public IActionResult Delete(int id = 0)
        {
            DataSet result = null;
            PromotionsDLL promotionDLL = null;
            PromotionsMetaData promotionMetaDatas = null;
            try
            {
                promotionDLL = new PromotionsDLL();
                result = new DataSet();
                promotionMetaDatas = new PromotionsMetaData();

                promotionMetaDatas.ID = id;
                promotionMetaDatas.Mode = 3;
                result = promotionDLL.PromotionsDML(promotionMetaDatas);

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