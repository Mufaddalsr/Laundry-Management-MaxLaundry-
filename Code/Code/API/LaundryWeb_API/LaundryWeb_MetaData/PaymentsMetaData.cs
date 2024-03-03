using System;

namespace LaundryWeb_MetaData
{
    public class PaymentsMetaData
    {
		public PaymentsMetaData()
		{

		}

		public string PayID { get; set; }
		public string OrderID { get; set; }
		public Nullable<System.DateTime> PayDate { get; set; }
		public float Amount { get; set; }
		public Nullable<int> RecievedBy { get; set; }
		public string PaymentType { get; set; }
		public bool isCancelled { get; set; }
		public Nullable<int> CancelledBy { get; set; }
		public Nullable<System.DateTime> CancelledOn { get; set; }
		public bool isSync { get; set; }
		public int Mode { get; set; }
    }
}

