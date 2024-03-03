using System;

namespace LaundryWeb_MetaData
{
    public class OrdersMetaData
    {
		public OrdersMetaData()
		{

		}

		public string ID { get; set; }
		public Nullable<System.DateTime> OrderDate { get; set; }
		public Int64 CustomerID { get; set; }
		public Nullable<System.DateTime> DeliverBy { get; set; }
		public bool isCancelled { get; set; }
		public bool isPaid { get; set; }
		public Nullable<int> CompanyID { get; set; }
		public string Status { get; set; }
		public bool isHang { get; set; }
		public string Comments { get; set; }
		public Nullable<int> LocationID { get; set; }
		public Nullable<int> PromoApplied { get; set; }
		public float Discount { get; set; }
		public Nullable<System.DateTime> DoEmail { get; set; }
		public float SubTotal { get; set; }
		public float VATAmount { get; set; }
		public float GrandTotal { get; set; }
		public float Balance { get; set; }
		public bool isExpress { get; set; }
		public bool isSync { get; set; }
		public int Mode { get; set; }
    }
}

