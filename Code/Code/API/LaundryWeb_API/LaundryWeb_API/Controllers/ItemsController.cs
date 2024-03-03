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
    [Route("api/Items")]
    public class ItemsController : Controller
    {
        #region Get All Items
        [HttpGet]
        public IActionResult Get()
        {
            List<ItemsMetaData> itemMetaDatas = null;
            ItemsDLL itemDLL = null;
            string id = null;
            try
            {
                itemDLL = new ItemsDLL();

                itemMetaDatas = itemDLL.GetAllItems(id);
                if (itemMetaDatas.Count >= 0)
                {
                    return Ok(itemMetaDatas);
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

        #region Get Items Data By Id
        // GET: api/Items/5
        [HttpGet("{id}")]
        public IActionResult Get(string id = null)
        {
            ItemsDLL itemDLL = null;
            ItemsMetaData itemMetaDatas = null;
            try
            {
                itemDLL = new ItemsDLL();

                itemMetaDatas = itemDLL.GetItemsbyId(id);
                if (itemMetaDatas != null)
                {
                    return Ok(itemMetaDatas);
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

        #region Add New Items
        [HttpPost]
        public IActionResult Post([FromBody] ItemsMetaData itemMetaDatas)
        {
            DataSet result = null;
            ItemsDLL itemDLL = null;
            try
            {
                itemDLL = new ItemsDLL();
                result = new DataSet();

                itemMetaDatas.Mode = 1;
                result = itemDLL.ItemsDML(itemMetaDatas);

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

        #region Update Items data
        // PUT: api/Items/5
        [HttpPut]
        public IActionResult Put([FromBody] ItemsMetaData itemMetaDatas)
        {
            DataSet result = null;
            ItemsDLL itemDLL = null;
            try
            {
                itemDLL = new ItemsDLL();
                result = new DataSet();

                itemMetaDatas.Mode = 2;
                result = itemDLL.ItemsDML(itemMetaDatas);

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

        #region Delete Items
        [HttpDelete]
        public IActionResult Delete(string id = null)
        {
            DataSet result = null;
            ItemsDLL itemDLL = null;
            ItemsMetaData itemMetaDatas = null;
            try
            {
                itemDLL = new ItemsDLL();
                result = new DataSet();
                itemMetaDatas = new ItemsMetaData();

                itemMetaDatas.ID = id;
                itemMetaDatas.Mode = 3;
                result = itemDLL.ItemsDML(itemMetaDatas);

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