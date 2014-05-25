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
    public class daVehiculoMarca
    {
        public static List<enVehiculoMarca> spListaVehiculoMarca()
        {
            SqlConnection cn = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            enVehiculoMarca vehMarca = null;
            List<enVehiculoMarca> lstVehiculoMarca = null;
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spListaMarcas", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                dr = cmd.ExecuteReader();
                lstVehiculoMarca = new List<enVehiculoMarca>();
                while (dr.Read())
                {
                    vehMarca = new enVehiculoMarca();
                    vehMarca.vehMar_id = Convert.ToInt32(dr[0].ToString());
                    vehMarca.vehMar_descripcion = dr[1].ToString();
                    lstVehiculoMarca.Add(vehMarca);
                }

            }
            catch (Exception e)
            {

            }
            finally
            {
                cn.Close();
            }
            return lstVehiculoMarca;

        }
    }
}
