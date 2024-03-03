using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LaundryWeb_MetaData
{
    public class ChangePasswordMetaData
    {
        public Int64 ID { get; set; }
        public string IDString { get; set; }
        public string OldPassword { get; set; }
        public string NewPassword { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<int> CreatedBy { get; set; }
    }
}
