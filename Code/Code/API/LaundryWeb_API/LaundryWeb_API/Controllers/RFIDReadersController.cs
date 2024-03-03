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
    [Route("api/RFIDReaders")]
    public class RFIDReadersController : Controller
    {
        #region Get All RFIDReaders
        [HttpGet]
        public IActionResult Get()
        {
            List<RFIDReadersMetaData> rfidReaderMetaDatas = null;
            RFIDReadersDLL rfidReaderDLL = null;
            int id = 0;
            try
            {
                rfidReaderDLL = new RFIDReadersDLL();

                rfidReaderMetaDatas = rfidReaderDLL.GetAllRFIDReaders(id);
                if (rfidReaderMetaDatas.Count >= 0)
                {
                    return Ok(rfidReaderMetaDatas);
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

        #region Get RFIDReaders Data By Id
        // GET: api/RFIDReaders/5
        [HttpGet("{id}")]
        public IActionResult Get(int id = 0)
        {
            RFIDReadersDLL rfidReaderDLL = null;
            RFIDReadersMetaData rfidReaderMetaDatas = null;
            try
            {
                rfidReaderDLL = new RFIDReadersDLL();

                rfidReaderMetaDatas = rfidReaderDLL.GetRFIDReadersbyId(id);
                if (rfidReaderMetaDatas != null)
                {
                    return Ok(rfidReaderMetaDatas);
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

        #region Add New RFIDReaders
        [HttpPost]
        public IActionResult Post([FromBody] RFIDReadersMetaData rfidReaderMetaDatas)
        {
            DataSet result = null;
            RFIDReadersDLL rfidReaderDLL = null;
            try
            {
                rfidReaderDLL = new RFIDReadersDLL();
                result = new DataSet();

                rfidReaderMetaDatas.Mode = 1;
                result = rfidReaderDLL.RFIDReadersDML(rfidReaderMetaDatas);

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

        #region Update RFIDReaders data
        // PUT: api/RFIDReaders/5
        [HttpPut]
        public IActionResult Put([FromBody] RFIDReadersMetaData rfidReaderMetaDatas)
        {
            DataSet result = null;
            RFIDReadersDLL rfidReaderDLL = null;
            try
            {
                rfidReaderDLL = new RFIDReadersDLL();
                result = new DataSet();

                rfidReaderMetaDatas.Mode = 2;
                result = rfidReaderDLL.RFIDReadersDML(rfidReaderMetaDatas);

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

        #region Delete RFIDReaders
        [HttpDelete]
        public IActionResult Delete(int id = 0)
        {
            DataSet result = null;
            RFIDReadersDLL rfidReaderDLL = null;
            RFIDReadersMetaData rfidReaderMetaDatas = null;
            try
            {
                rfidReaderDLL = new RFIDReadersDLL();
                result = new DataSet();
                rfidReaderMetaDatas = new RFIDReadersMetaData();

                rfidReaderMetaDatas.ID = id;
                rfidReaderMetaDatas.Mode = 3;
                result = rfidReaderDLL.RFIDReadersDML(rfidReaderMetaDatas);

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