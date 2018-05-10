using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project.BusinessRules
{
    public class BusinessRulesException : ApplicationException
    {
        public BusinessRulesException(String str, Exception msg)
            : base(str, msg)
        {
        }

        public BusinessRulesException(String str)
            : base(str)
        {
        }
    }
}
