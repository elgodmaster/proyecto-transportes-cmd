using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data.SqlClient;
using System.Data;
using Entidades;

namespace Datos
{
    public class daRuta
    {
        #region singleton
        private static readonly daRuta _instancia = new daRuta();
        public static daRuta Instancia
        {
            get { return daRuta._instancia; }
        }
        #endregion

        #region Métodos
        public enRuta registrarRuta(enRuta prmRuta)
        {

            Boolean resultado = false;
            SqlConnection cn = null;
            SqlDataReader dr = null;
            SqlCommand cmd = new SqlCommand();
            enRuta ruta = null;
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spRutaRegistrar", cn);
                cmd.Parameters.AddWithValue("@rut_horSalida", prmRuta.rut_horSalida);
                cmd.Parameters.AddWithValue("@rut_horViaje", prmRuta.rut_horViaje);
                cmd.Parameters.AddWithValue("@sucOrigen_id", prmRuta.origen.suc_id);
                cmd.Parameters.AddWithValue("@sucDestino_id", prmRuta.destino.suc_id);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    ruta = new enRuta();
                    enMensaje mensaje = new enMensaje();
                    mensaje.res = Convert.ToInt16(dr[0].ToString());
                    mensaje.mensaje = dr[1].ToString();
                    ruta.mensaje = mensaje;
                }
            }
            catch (Exception)
            {
                resultado = false;
            }
            finally
            {
                cmd.Connection.Close();
                cn.Close();
            }
            return ruta;
        }

        public List<enRuta> spRutasListarXIdSucursalOrigen(int prmIdSucursal)
        {
            SqlConnection cn = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<enRuta> lstRuta = null;
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spRutasListarXIdSucursalOrigen", cn);
                cmd.Parameters.AddWithValue("@idSucOrigen", prmIdSucursal);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                dr = cmd.ExecuteReader();
                lstRuta = new List<enRuta>();
                while (dr.Read())
                {
                    enRuta ruta = new enRuta();
                    ruta.rut_id = Convert.ToInt32(dr[0].ToString());
                    ruta.rut_horSalida = dr[1].ToString();
                    ruta.rut_horViaje = Convert.ToInt32(dr[2].ToString());
                    enSucursal sucOrigen = new enSucursal();
                    enCiudad ciuOrigen = new enCiudad();
                    sucOrigen.suc_id = Convert.ToInt32(dr[3].ToString());
                    sucOrigen.suc_nombre = dr[4].ToString();
                    ciuOrigen.ciu_ciudad = dr[5].ToString();
                    sucOrigen.ciudad = ciuOrigen;
                    ruta.origen = sucOrigen;

                    enSucursal sucDestino = new enSucursal();
                    enCiudad ciuDestino = new enCiudad();
                    sucDestino.suc_id = Convert.ToInt32(dr[6].ToString());
                    sucDestino.suc_nombre = dr[7].ToString();
                    ciuDestino.ciu_ciudad = dr[8].ToString();
                    sucDestino.ciudad = ciuDestino;
                    ruta.destino = sucDestino;

                    lstRuta.Add(ruta);
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
            return lstRuta;

        }
        #endregion
    }
}
