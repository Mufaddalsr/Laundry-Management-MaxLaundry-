using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LaundryWeb_MetaData
{
    public class UpdateCustomerProfileMetaData
    {
        public UpdateCustomerProfileMetaData()
        {

        }

        public Int64 ID { get; set; }
        public string IDString { get; set; }
        public string CustomerID { get; set; }
        public string FullName { get; set; }
        public string Address { get; set; }
        public string PhoneNumber { get; set; }
        public string MobileNumber { get; set; }
        public string CustomerCode { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<int> CompanyID { get; set; }
        public bool isActive { get; set; }
        public string Email { get; set; }
        public Nullable<int> CorpID { get; set; }
        public bool isSync { get; set; }
        public int Mode { get; set; }
    }
}
