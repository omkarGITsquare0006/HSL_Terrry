using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HSL_Terrry.AppCode
{
    public class DateTimeClass
    {
        internal static string CurrentDateTime()
        {
            DateTime now = DateTime.Now;
            return now.ToString("dd/MM/yyyy HH:mm:ss");
        }
    }
}