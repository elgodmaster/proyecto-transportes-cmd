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
        #region singleton
        private static readonly daSucursal _instancia = new daSucursal();
        public static daSucursal Instancia
        {
            get { return daSucursal._instancia; }
        }
        #endregion

        #region métodos
        public static List<enSucursal> sucursalLista()
        {
            SqlConnection cn = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<enSucursal> lstSucursal = null;
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spSucursalListar", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                dr = cmd.ExecuteReader();

                lstSucursal = new List<enSucursal>();
                while (dr.Read())
                {
                    enSucursal sucursal = new enSucursal();
                    sucursal.suc_id = Convert.ToInt32(dr[0].ToString());
                    sucursal.suc_nombre = dr[1].ToString(); //Esta Mostrando la Ciudad
                    lstSucursal.Add(sucursal);
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                dr.Close();
                cn.Close();
            }
            return lstSucursal;
        }

        public static List<enSucursal> spIntinerarioOrigenXNombre(String prmNomSucursal)
        {
            SqlConnection cn = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            enSucursal sucursal = null;
            List<enSucursal> lstSucursalSalida = null;
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spIntinerarioOrigenXNombre", cn);
                cmd.Parameters.AddWithValue("@iti_origen", prmNomSucursal);
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
                System.Console.Write("Error Itinerario Salida " + e.Message);
            }
            finally
            {
                cn.Close();
            }
            return lstSucursalSalida;

        }

        public static List<enSucursal> spIntinerarioDestinoXIdOrigen(int prmIdOrigen)
        {
            SqlConnection cn = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            enSucursal sucursal = null;
            List<enSucursal> lstSucursalSalida = null;
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spIntinerarioDestinoXIdOrigen", cn);
                cmd.Parameters.AddWithValue("@sucursal_origen_id", prmIdOrigen);
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

        #endregion
        
    }
}
