using System;

namespace LaundryWeb_MetaData
{
    public class AuditLogMetaData
    {
		public AuditLogMetaData()
		{

		}

		public int TID { get; set; }
		public Nullable<int> OrderID { get; set; }
		public Nullable<System.DateTime> TStamp { get; set; }
		public string EventType { get; set; }
		public string EventDesc { get; set; }
		public Nullable<int> UserID { get; set; }
		public bool isSync { get; set; }
		public int Mode { get; set; }
    }
}

