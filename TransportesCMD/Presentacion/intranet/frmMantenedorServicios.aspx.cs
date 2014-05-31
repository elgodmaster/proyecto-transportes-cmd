using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Negocio;
using Entidades;

namespace Presentacion.intranet
{
    public partial class frmMantenedorServicios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            String non = txtnom.Value;
            String carac = txtcarac.Value;
            int serv = Convert.ToInt32(select_estad.Value);
            Boolean resultado = false;
            resultado = neServicioEspecial.RegistrarServicioEspecial(non, carac, serv);
            CleanControl(this.Controls);
            if (resultado)
            {
                lblMensajeGraba.Text = "OK";
                lblMensajeGraba.ForeColor = System.Drawing.Color.Blue;
            }
            else
            {
                lblMensajeGraba.Text = "Error";
                lblMensajeGraba.ForeColor = System.Drawing.Color.Red;
            }

        }

        public void CleanControl(ControlCollection controles)
        {
            foreach (Control control in controles)
            {
                if (control is TextBox)
                    ((TextBox)control).Text = string.Empty;
                else if (control is DropDownList)
                    ((DropDownList)control).ClearSelection();
                else if (control is RadioButtonList)
                    ((RadioButtonList)control).ClearSelection();
                else if (control is CheckBoxList)
                    ((CheckBoxList)control).ClearSelection();
                else if (control is RadioButton)
                    ((RadioButton)control).Checked = false;
                else if (control is CheckBox)
                    ((CheckBox)control).Checked = false;
                else if (control.HasControls())
                    //Esta linea detécta un Control que contenga otros Controles
                    //Así ningún control se quedará sin ser limpiado.
                    CleanControl(control.Controls);
            }
        }
    }
}