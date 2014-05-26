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
    public class daBoletoViaje
    {
        public static enBoletoViaje spBoletoViajeRegistro(int prmAsiento, int prmIdPersona, int prmIdPersonal, int prmIdItinerario, int prmIdSucursal)
        {
            SqlConnection cn = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            enBoletoViaje bolViaje = null;
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spBoletoViajeRegistro", cn);
                cmd.Parameters.AddWithValue("@bolVia_asiento", prmAsiento);
                cmd.Parameters.AddWithValue("@persona_id",prmIdPersona);
                cmd.Parameters.AddWithValue("@personal_id", prmIdPersonal);
                cmd.Parameters.AddWithValue("@itinerario_id", prmIdItinerario);
                cmd.Parameters.AddWithValue("@sucursal_id", prmIdSucursal);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                dr = cmd.ExecuteReader();
                if (dr.Read())                {
                    bolViaje = new enBoletoViaje();
                    bolViaje.bolVia_id = Convert.ToInt32(dr[0].ToString());
                }

            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                cn.Close();
            }
            return bolViaje;
        }
    }
}
