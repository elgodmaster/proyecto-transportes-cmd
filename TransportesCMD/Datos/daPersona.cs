using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entidades;

namespace Datos
{
   public class daPersona
    {

        public static List<enPersona> spPersonaXNumeroTipoDocumentoIdentidad(String prmNumDocIde, int idTipDoc)
        {
            SqlConnection cn = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            
            List<enPersona> lstpersona = null;
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spPersonaXNumeroTipoDocumentoIdentidad", cn);
                cmd.Parameters.AddWithValue("@per_numDocIdentidad", prmNumDocIde);
                cmd.Parameters.AddWithValue("@docIdentidad_id", idTipDoc);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                dr = cmd.ExecuteReader();
                lstpersona = new List<enPersona>();
                if (dr.Read())
                {
                    enPersona persona = new enPersona();
                    persona.per_id = Convert.ToInt32(dr[0].ToString());
                    persona.per_nombres = dr[1].ToString();
                    persona.per_apellidos = dr[2].ToString();
                    persona.per_sexo = dr[3].ToString();
                    persona.per_fecNacimiento = dr[4].ToString();
                    lstpersona.Add(persona);
                }

            }
            catch (Exception e)
            {

            }
            finally
            {
                cn.Close();
            }
            return lstpersona;
        }
    }
}
