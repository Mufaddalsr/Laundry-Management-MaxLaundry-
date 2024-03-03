using System;

namespace LaundryWeb_MetaData
{
    public class PromotionsMetaData
    {
		public PromotionsMetaData()
		{

		}

		public int ID { get; set; }
		public string PromoCode { get; set; }
		public string PromoName { get; set; }
		public Nullable<System.DateTime> StartDate { get; set; }
		public Nullable<System.DateTime> EndDate { get; set; }
		public string PromoType { get; set; }
		public Nullable<int> ApplicableAfter { get; set; }
		public double DiscountPer { get; set; }
		public Nullable<int> CompanyID { get; set; }
		public int Mode { get; set; }

        //Extra Field for display
        public string CompanyName { get; set; }
    }
}

