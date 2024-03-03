using System;

namespace LaundryWeb_MetaData
{
    public class ItemsMetaData
    {
		public ItemsMetaData()
		{

		}

		public string ID { get; set; }
		public string OrderID { get; set; }
		public string OrderTID { get; set; }
		public string TagID { get; set; }
		public string Status { get; set; }
		public Nullable<System.DateTime> TaggedOn { get; set; }
		public Nullable<int> LastSeen { get; set; }
		public Nullable<System.DateTime> LastSeenTime { get; set; }
		public Nullable<int> LineID { get; set; }
		public string Comments { get; set; }
        public Byte[] ItemImage { get; set; }
        public bool isSync { get; set; }
		public int Mode { get; set; }
    }
}

