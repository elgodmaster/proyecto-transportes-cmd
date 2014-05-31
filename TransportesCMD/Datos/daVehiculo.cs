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
    public class daVehiculo
    {
        #region singleton
        private static readonly daVehiculo _instancia = new daVehiculo();
        public static daVehiculo Instancia
        {
            get { return daVehiculo._instancia; }
        }
        #endregion

        #region métodos
        
        public static Boolean RegistrarVehiculo(String modelo, String placa, int numasi1, int numasi2, String marca, int serviespe)
        {

            Boolean resultado = false;
            SqlConnection cn = null;
            SqlCommand cmd = new SqlCommand();
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spVehiculoRegistrar", cn);
                cmd.Parameters.AddWithValue("@veh_modelo", modelo);
                cmd.Parameters.AddWithValue("@veh_placa", placa);
                cmd.Parameters.AddWithValue("@veh_numAsiPrimer", numasi1);
                cmd.Parameters.AddWithValue("@veh_numAsiSegundo", numasi2);
                cmd.Parameters.AddWithValue("@veh_marca", marca);
                cmd.Parameters.AddWithValue("@serEspecial_id", serviespe);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                cmd.ExecuteNonQuery();
                resultado = true;
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
            return resultado;

        }

        public static List<enVehiculo> spVehiculoListar()
        {
            SqlConnection cn = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<enVehiculo> lstVehiculo = null;
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spVehiculoListar", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                dr = cmd.ExecuteReader();
                lstVehiculo = new List<enVehiculo>();
                while (dr.Read())
                {
                    enVehiculo vehic = new enVehiculo();
                    enServicioEspecial seresp = new enServicioEspecial();
                    vehic.veh_placa = dr[0].ToString();
                    vehic.veh_modelo = dr[1].ToString();
                    vehic.veh_marca = dr[2].ToString();
                    vehic.veh_numAsiPrimer = Convert.ToInt32(dr[3].ToString());
                    vehic.veh_numAsiSegundo = Convert.ToInt32(dr[4].ToString());
                    vehic.veh_estado = dr[5].ToString();
                    seresp.serEsp_nombre = dr[6].ToString();
                    vehic.servicioEspecial = seresp;
                    vehic.veh_id = Convert.ToInt32(dr[7].ToString());
                    lstVehiculo.Add(vehic);
                }

            }
            catch (Exception e)
            {

            }
            finally
            {
                cn.Close();
            }
            return lstVehiculo;
        }

        public static List<enVehiculo> spVehiculoXid(int id)
        {
            SqlConnection cn = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<enVehiculo> lstVehiculo = null;
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spVehiculoXid", cn);
                cmd.Parameters.AddWithValue("@veh_id", id);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                dr = cmd.ExecuteReader();
                lstVehiculo = new List<enVehiculo>();
                while (dr.Read())
                {
                    enVehiculo vehic = new enVehiculo();
                    enServicioEspecial seresp = new enServicioEspecial();
                    vehic.veh_placa = dr[0].ToString();
                    vehic.veh_modelo = dr[1].ToString();
                    vehic.veh_marca = dr[2].ToString();
                    vehic.veh_numAsiPrimer = Convert.ToInt32(dr[3].ToString());
                    vehic.veh_numAsiSegundo = Convert.ToInt32(dr[4].ToString());
                    vehic.veh_estado = dr[5].ToString();
                    seresp.serEsp_nombre = dr[6].ToString();
                    vehic.servicioEspecial = seresp;
                    vehic.veh_id = Convert.ToInt32(dr[7].ToString());
                    lstVehiculo.Add(vehic);
                }

            }
            catch (Exception e)
            {

            }
            finally
            {
                cn.Close();
            }
            return lstVehiculo;
        }

        public static Boolean spVehiculoEliminar(int id)
        {
            SqlConnection cn = null;
            SqlCommand cmd = null;
            Boolean resultado = false;
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spVehiculoEliminar", cn);
                cmd.Parameters.AddWithValue("@veh_id", id);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                cmd.ExecuteNonQuery();
                resultado = true;
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                cn.Close();
            }
            return resultado;
        }

        public static Boolean spVehiculoModificar(int id,String modelo, String placa, int numasi1, int numasi2, String marca,String estado, int serviespe)
        {

            Boolean resultado = false;
            SqlConnection cn = null;
            SqlCommand cmd = new SqlCommand();
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spVehiculoModificar", cn);
                cmd.Parameters.AddWithValue("@veh_id", id);
                cmd.Parameters.AddWithValue("@veh_modelo", modelo);
                cmd.Parameters.AddWithValue("@veh_placa", placa);
                cmd.Parameters.AddWithValue("@veh_numAsiPrimer", numasi1);
                cmd.Parameters.AddWithValue("@veh_numAsiSegundo", numasi2);
                cmd.Parameters.AddWithValue("@veh_marca", marca);
                cmd.Parameters.AddWithValue("@veh_estado", estado);
                cmd.Parameters.AddWithValue("@serEspecial_id", serviespe);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                cmd.ExecuteNonQuery();
                resultado = true;
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
            return resultado;

        }
        #endregion
    }


}
