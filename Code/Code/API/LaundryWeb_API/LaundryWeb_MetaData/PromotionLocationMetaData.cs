using System;

namespace LaundryWeb_MetaData
{
    public class PromotionLocationMetaData
    {
		public PromotionLocationMetaData()
		{

		}

		public int TID { get; set; }
		public Nullable<int> PromotionID { get; set; }
		public Nullable<int> LocationID { get; set; }
		public int Mode { get; set; }
    }
}

