using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tasks_Jquery.Models;

namespace Tasks_Jquery
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string UserData(string dataJson)
        {
            List<UserData> results = JsonConvert.DeserializeObject<List<UserData>>(dataJson);
            try
            {

                return "success";
            }
            catch (Exception ex)
            {
                return "error";
            }
        }
    }
}