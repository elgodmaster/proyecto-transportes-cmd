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
        public List<enVehiculoMarca> ListaMarca()
        {
            SqlConnection cn = null;
            List<enVehiculoMarca> listado = new List<enVehiculoMarca>();
            enVehiculoMarca objlin = new enVehiculoMarca();
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("select * from vehiculoMarca", cn);
                cmd.CommandType = CommandType.Text;
                cn.Open();
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    objlin = new enVehiculoMarca();
                    objlin.vehMar_id = Convert.ToInt32(dr["vehMar_id"].ToString());
                    objlin.vehMar_descripcion = dr["vehMar_descripcion"].ToString();
                    listado.Add(objlin);

                }

            }
            catch (Exception e)
            {
                System.Console.Write(e.Message);
            }
            finally
            {
                cmd.Connection.Close();
            }
            return listado;

        }
    }
}
