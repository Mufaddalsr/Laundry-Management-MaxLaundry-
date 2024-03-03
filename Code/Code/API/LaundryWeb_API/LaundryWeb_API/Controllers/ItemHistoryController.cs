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
    [Route("api/ItemHistory")]
    public class ItemHistoryController : Controller
    {
        #region Get All ItemHistory
        [HttpGet]
        public IActionResult Get()
        {
            List<ItemHistoryMetaData> itemHistoryMetaDatas = null;
            ItemHistoryDLL itemHistoryDLL = null;
            int id = 0;
            try
            {
                itemHistoryDLL = new ItemHistoryDLL();

                itemHistoryMetaDatas = itemHistoryDLL.GetAllItemHistory(id);
                if (itemHistoryMetaDatas.Count >= 0)
                {
                    return Ok(itemHistoryMetaDatas);
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

        #region Get ItemHistory Data By Id
        // GET: api/ItemHistory/5
        [HttpGet("{id}")]
        public IActionResult Get(int id = 0)
        {
            ItemHistoryDLL itemHistoryDLL = null;
            ItemHistoryMetaData itemHistoryMetaDatas = null;
            try
            {
                itemHistoryDLL = new ItemHistoryDLL();

                itemHistoryMetaDatas = itemHistoryDLL.GetItemHistorybyId(id);
                if (itemHistoryMetaDatas != null)
                {
                    return Ok(itemHistoryMetaDatas);
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

        #region Add New ItemHistory
        [HttpPost]
        public IActionResult Post([FromBody] ItemHistoryMetaData itemHistoryMetaDatas)
        {
            DataSet result = null;
            ItemHistoryDLL itemHistoryDLL = null;
            try
            {
                itemHistoryDLL = new ItemHistoryDLL();
                result = new DataSet();

                itemHistoryMetaDatas.Mode = 1;
                result = itemHistoryDLL.ItemHistoryDML(itemHistoryMetaDatas);

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

        #region Update ItemHistory data
        // PUT: api/ItemHistory/5
        [HttpPut]
        public IActionResult Put([FromBody] ItemHistoryMetaData itemHistoryMetaDatas)
        {
            DataSet result = null;
            ItemHistoryDLL itemHistoryDLL = null;
            try
            {
                itemHistoryDLL = new ItemHistoryDLL();
                result = new DataSet();

                itemHistoryMetaDatas.Mode = 2;
                result = itemHistoryDLL.ItemHistoryDML(itemHistoryMetaDatas);

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

        #region Delete ItemHistory
        [HttpDelete]
        public IActionResult Delete(int id = 0)
        {
            DataSet result = null;
            ItemHistoryDLL itemHistoryDLL = null;
            ItemHistoryMetaData itemHistoryMetaDatas = null;
            try
            {
                itemHistoryDLL = new ItemHistoryDLL();
                result = new DataSet();
                itemHistoryMetaDatas = new ItemHistoryMetaData();

                itemHistoryMetaDatas.ID = id;
                itemHistoryMetaDatas.Mode = 3;
                result = itemHistoryDLL.ItemHistoryDML(itemHistoryMetaDatas);

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