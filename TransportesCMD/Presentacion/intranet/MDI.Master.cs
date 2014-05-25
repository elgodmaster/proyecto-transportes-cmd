﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class MDI : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Response.Redirect("index.aspx");
            }
        }

        protected void salir_Click(object sender, EventArgs e)
        {
            Session["usuario"] = null;
            Response.Redirect("index.aspx");
        }


    }
}