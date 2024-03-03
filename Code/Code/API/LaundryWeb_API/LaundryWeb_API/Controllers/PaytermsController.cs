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
    [Route("api/Payterms")]
    public class PaytermsController : Controller
    {
        #region Get All Payterms
        [HttpGet]
        public IActionResult Get()
        {
            List<PaytermsMetaData> paytermMetaDatas = null;
            PaytermsDLL paytermDLL = null;
            int id = 0;
            try
            {
                paytermDLL = new PaytermsDLL();

                paytermMetaDatas = paytermDLL.GetAllPayterms(id);
                if (paytermMetaDatas.Count >= 0)
                {
                    return Ok(paytermMetaDatas);
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

        #region Get Payterms Data By Id
        // GET: api/Payterms/5
        [HttpGet("{id}")]
        public IActionResult Get(int id = 0)
        {
            PaytermsDLL paytermDLL = null;
            PaytermsMetaData paytermMetaDatas = null;
            try
            {
                paytermDLL = new PaytermsDLL();

                paytermMetaDatas = paytermDLL.GetPaytermsbyId(id);
                if (paytermMetaDatas != null)
                {
                    return Ok(paytermMetaDatas);
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

        #region Add New Payterms
        [HttpPost]
        public IActionResult Post([FromBody] PaytermsMetaData paytermMetaDatas)
        {
            DataSet result = null;
            PaytermsDLL paytermDLL = null;
            try
            {
                paytermDLL = new PaytermsDLL();
                result = new DataSet();

                paytermMetaDatas.Mode = 1;
                result = paytermDLL.PaytermsDML(paytermMetaDatas);

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

        #region Update Payterms data
        // PUT: api/Payterms/5
        [HttpPut]
        public IActionResult Put([FromBody] PaytermsMetaData paytermMetaDatas)
        {
            DataSet result = null;
            PaytermsDLL paytermDLL = null;
            try
            {
                paytermDLL = new PaytermsDLL();
                result = new DataSet();

                paytermMetaDatas.Mode = 2;
                result = paytermDLL.PaytermsDML(paytermMetaDatas);

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

        #region Delete Payterms
        [HttpDelete]
        public IActionResult Delete(int id = 0)
        {
            DataSet result = null;
            PaytermsDLL paytermDLL = null;
            PaytermsMetaData paytermMetaDatas = null;
            try
            {
                paytermDLL = new PaytermsDLL();
                result = new DataSet();
                paytermMetaDatas = new PaytermsMetaData();

                paytermMetaDatas.ID = id;
                paytermMetaDatas.Mode = 3;
                result = paytermDLL.PaytermsDML(paytermMetaDatas);

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