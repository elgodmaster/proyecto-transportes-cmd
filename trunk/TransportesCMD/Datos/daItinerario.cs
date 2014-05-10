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
    public class daItinerario
    {

        public static List<enItinerario> spIntinerarioFechaSalidaXIdOrigenIdDestino(int prmIdOrigen, int prmIdDestino)
        {
            SqlConnection cn = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            enItinerario itinerario = null;
            List<enItinerario> lstItinerarioLista = null;
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spIntinerarioFechaSalidaXIdOrigenIdDestino", cn);
                cmd.Parameters.AddWithValue("@sucursal_origen_id", prmIdOrigen);
                cmd.Parameters.AddWithValue("@sucursal_destino_id", prmIdDestino);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                dr = cmd.ExecuteReader();
                lstItinerarioLista = new List<enItinerario>();
                while (dr.Read())
                {
                    itinerario = new enItinerario();
                    itinerario.iti_horSalida = dr[0].ToString();                    
                    lstItinerarioLista.Add(itinerario);
                }

            }
            catch (Exception e)
            {

            }
            finally
            {
                cn.Close();
            }
            return lstItinerarioLista;

        }
        public static List<enItinerario> spIntinerarioHoraSalidaXIdOrigenIdDestinoFecha(int prmIdOrigen, int prmIdDestino, String prmFecha)
        {
            SqlConnection cn = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            enItinerario itinerario = null;
            List<enItinerario> lstItinerarioLista = null;
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spIntinerarioHoraSalidaXIdOrigenIdDestinoFecha", cn);
                cmd.Parameters.AddWithValue("@sucursal_origen_id", prmIdOrigen);
                cmd.Parameters.AddWithValue("@sucursal_destino_id", prmIdDestino);
                cmd.Parameters.AddWithValue("@iti_horSalida", prmFecha);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                dr = cmd.ExecuteReader();
                lstItinerarioLista = new List<enItinerario>();
                while (dr.Read())
                {
                    itinerario = new enItinerario();
                    itinerario.iti_id = Convert.ToInt32(dr[0].ToString());
                    itinerario.iti_horSalida = dr[1].ToString();                   
                    lstItinerarioLista.Add(itinerario);
                }

            }
            catch (Exception e)
            {

            }
            finally
            {
                cn.Close();
            }
            return lstItinerarioLista;

        }

    }
}
