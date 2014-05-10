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
    public class daSucursal
    {
        public static List<enSucursal> sucursalOrigenLista(String prmNomSucursal)
        { 
            SqlConnection cn = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            enSucursal sucursal = null;
            List<enSucursal> lstSucursalSalida = null;
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spIntinerarioOrigenBusquedaNombre", cn);
                cmd.Parameters.AddWithValue("@iti_origen",prmNomSucursal);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                dr = cmd.ExecuteReader();
                lstSucursalSalida = new List<enSucursal>();
                while(dr.Read()){
                    sucursal = new enSucursal();                    
                    sucursal.suc_id = Convert.ToInt32(dr[0].ToString());
                    sucursal.suc_nombre = dr[1].ToString();
                    lstSucursalSalida.Add(sucursal);
                }

            }
            catch (Exception e)
            {

            }
            finally {
                cn.Close();
            }
            return lstSucursalSalida;
    
        }

        public static List<enSucursal> sucursalDestinoLista(int prmIdOrigen)
        {
            SqlConnection cn = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            enSucursal sucursal = null;
            List<enSucursal> lstSucursalSalida = null;
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spIntinerarioDestinoBusquedaIdOrigen", cn);
                cmd.Parameters.AddWithValue("@iti_origen_id", prmIdOrigen);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                dr = cmd.ExecuteReader();
                lstSucursalSalida = new List<enSucursal>();
                while (dr.Read())
                {
                    sucursal = new enSucursal();
                    sucursal.suc_id = Convert.ToInt32(dr[0].ToString());
                    sucursal.suc_nombre = dr[1].ToString();
                    lstSucursalSalida.Add(sucursal);
                }

            }
            catch (Exception e)
            {

            }
            finally
            {
                cn.Close();
            }
            return lstSucursalSalida;

        }

        public static List<enSucursal> sucursalSalidaHoraLista(int prmIdOrigen, int prmIdDestino)
        {
            SqlConnection cn = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            enSucursal sucursal = null;
            List<enSucursal> lstSucursalSalida = null;
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spIntinerarioDestinoBusquedaIdOrigen", cn);
                cmd.Parameters.AddWithValue("@iti_origen_id", prmIdOrigen);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                dr = cmd.ExecuteReader();
                lstSucursalSalida = new List<enSucursal>();
                while (dr.Read())
                {
                    sucursal = new enSucursal();
                    sucursal.suc_id = Convert.ToInt32(dr[0].ToString());
                    sucursal.suc_nombre = dr[1].ToString();
                    lstSucursalSalida.Add(sucursal);
                }

            }
            catch (Exception e)
            {

            }
            finally
            {
                cn.Close();
            }
            return lstSucursalSalida;

        }
    }
}
