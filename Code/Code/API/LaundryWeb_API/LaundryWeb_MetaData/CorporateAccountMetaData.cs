using System;

namespace LaundryWeb_MetaData
{
    public class CorporateAccountMetaData
    {
		public CorporateAccountMetaData()
		{

		}

		public int ID { get; set; }
		public string CorporateCode { get; set; }
		public string CorpName { get; set; }
		public Nullable<int> PaymentTerms { get; set; }
		public Nullable<System.DateTime> AccountStart { get; set; }
		public Nullable<System.DateTime> CreatedOn { get; set; }
		public Nullable<int> CreatedBy { get; set; }
		public bool isActive { get; set; }
		public int Mode { get; set; }
    }
}

