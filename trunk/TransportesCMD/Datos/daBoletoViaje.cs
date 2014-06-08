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
        public static List<enBoletoViaje> spBoletoViajeRegistro(int prmAsiento, int prmIdPersona, int prmIdPersonal, int prmIdItinerario)
        {
            SqlConnection cn = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<enBoletoViaje> lstBolViaje = null;
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spBoletoViajeRegistro", cn);
                cmd.Parameters.AddWithValue("@bolVia_asiento", prmAsiento);
                cmd.Parameters.AddWithValue("@cliente_id", prmIdPersona);
                cmd.Parameters.AddWithValue("@personal_id", prmIdPersonal);
                cmd.Parameters.AddWithValue("@itinerario_id", prmIdItinerario);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cn.Open();
                dr = cmd.ExecuteReader();
                lstBolViaje = new List<enBoletoViaje>();
                if (dr.Read())                {
                   enBoletoViaje bolViaje = new enBoletoViaje();
                    bolViaje.bolVia_id = Convert.ToInt32(dr[0].ToString());
                    lstBolViaje.Add(bolViaje);
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
            return lstBolViaje;
        }

        public static List<enBoletoViaje> spBoletoViajeRegistroPersona(int prmAsiento, int prmIdItinerario, int prmIdPersonal, enPersona prmPersona)
        {
            SqlConnection cn = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<enBoletoViaje> lstBolViaje = null;
            try
            {

                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spBoletoViajeRegistroPersona", cn);
                cmd.Parameters.AddWithValue("@per_nombres", prmPersona.per_nombres);
                cmd.Parameters.AddWithValue("@per_apellidos", prmPersona.per_apellidos);
                cmd.Parameters.AddWithValue("@per_numDocIdentidad", prmPersona.per_numDocIdentidad);
                cmd.Parameters.AddWithValue("@per_fecNacimiento", prmPersona.per_fecNacimiento);
                cmd.Parameters.AddWithValue("@per_sexo", prmPersona.per_sexo);
                cmd.Parameters.AddWithValue("@docIdentidad_id", prmPersona.documentoIdentidad.docIde_id);
                cmd.Parameters.AddWithValue("@bolVia_asiento", prmAsiento);
                cmd.Parameters.AddWithValue("@personal_id", prmIdPersonal);
                cmd.Parameters.AddWithValue("@itinerario_id", prmIdItinerario);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cn.Open();
                dr = cmd.ExecuteReader();
                lstBolViaje = new List<enBoletoViaje>();
                if (dr.Read())                {
                   enBoletoViaje bolViaje = new enBoletoViaje();
                    bolViaje.bolVia_id = Convert.ToInt32(dr[0].ToString());
                    lstBolViaje.Add(bolViaje);
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
            return lstBolViaje;
        }
    }

    
}
