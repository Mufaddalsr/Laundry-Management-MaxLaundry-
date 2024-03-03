using System;

namespace LaundryWeb_MetaData
{
    public class GarmentServiceMetaData
    {
		public GarmentServiceMetaData()
		{

		}

		public int TID { get; set; }
		public Nullable<int> GarmentID { get; set; }
		public Nullable<int> ServiceID { get; set; }
		public float Price { get; set; }
		public bool isOffered { get; set; }
		public Nullable<int> CorpID { get; set; }
		public int Mode { get; set; }
    }
}

