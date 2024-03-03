using System;

namespace LaundryWeb_MetaData
{
    public class OrderDetailsMetaData
    {
		public OrderDetailsMetaData()
		{

		}

		public string TID { get; set; }
		public string OrderID { get; set; }
		public Nullable<int> GarmentID { get; set; }
		public Nullable<int> ServiceID { get; set; }
		public Nullable<int> Qty { get; set; }
		public float Total { get; set; }
		public string Status { get; set; }
		public Nullable<System.DateTime> DeliveredOn { get; set; }
		public Nullable<int> LineID { get; set; }
		public int Mode { get; set; }
    }
}

