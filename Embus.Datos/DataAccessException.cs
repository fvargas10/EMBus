using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project.DataAccess
{
    public class DataAccessException : ApplicationException
    {
        public DataAccessException(String str, Exception msg)
            : base(str, msg)
        {
        }

        public DataAccessException(String str)
            : base(str)
        {
        }
    }
}