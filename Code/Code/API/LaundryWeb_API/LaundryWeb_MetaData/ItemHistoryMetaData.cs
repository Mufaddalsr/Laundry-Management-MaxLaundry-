using System;

namespace LaundryWeb_MetaData
{
    public class ItemHistoryMetaData
    {
		public ItemHistoryMetaData()
		{

		}

		public int ID { get; set; }
		public string ItemID { get; set; }
		public Nullable<int> LocationID { get; set; }
		public Nullable<System.DateTime> TStamp { get; set; }
		public string BatchID { get; set; }
		public string Description { get; set; }
		public bool isSync { get; set; }
		public int Mode { get; set; }
    }
}

