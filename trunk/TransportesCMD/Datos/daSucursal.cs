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
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                cmd.Connection.Close();
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
                    sucursal.suc_nombre = dr[2].ToString();
                    lstSucursalSalida.Add(sucursal);
                }

            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                cmd.Connection.Close();
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
                cmd.Parameters.AddWithValue("@sucOrigen_id", prmIdOrigen);
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
                throw e;
            }
            finally
            {
                cmd.Connection.Close();
            }
            return lstSucursalSalida;

        }


        public static List<enSucursal> spListaSucursaAll()
        {

            SqlConnection cn = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<enSucursal> lstsucursal = null;
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("select suc_id, suc_nombre,suc_direccion,ciu_id,ciu_ciudad,ciu_departamento   from sucursal s inner join ciudad c on c.ciu_id=s.ciudad_id", cn);
                cmd.CommandType = CommandType.Text;
                cn.Open();
                dr = cmd.ExecuteReader();
                lstsucursal = new List<enSucursal>();
                while (dr.Read())
                {
                    enSucursal sucursal = new enSucursal();
                    sucursal.suc_id = Convert.ToInt32(dr[0].ToString());
                    sucursal.suc_nombre = dr[1].ToString() + " , " + dr[4].ToString();
                    sucursal.suc_direccion = dr[2].ToString();

                    enCiudad ciudad = new enCiudad();
                    ciudad.ciu_id = Convert.ToInt32(dr[3].ToString());
                    ciudad.ciu_ciudad = dr[4].ToString();
                    ciudad.ciu_departamento = dr[5].ToString();

                    lstsucursal.Add(sucursal);
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                cmd.Connection.Close();
            }
            return lstsucursal;

        }


        #endregion

    }
}
