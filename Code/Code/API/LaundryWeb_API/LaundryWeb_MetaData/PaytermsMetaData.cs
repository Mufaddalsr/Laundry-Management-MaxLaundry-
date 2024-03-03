using System;

namespace LaundryWeb_MetaData
{
    public class PaytermsMetaData
    {
		public PaytermsMetaData()
		{

		}

		public int ID { get; set; }
		public string PaytermName { get; set; }
		public Nullable<int> PayAfter { get; set; }
		public bool isActive { get; set; }
		public int Mode { get; set; }
    }
}

