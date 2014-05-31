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
    public class daServicio
    {
        public static Boolean RegistrarServicioEspecial(String nombre, String caracteristicas, int ser_est)
        {

            Boolean resultado = false;
            SqlConnection cn = null;
            SqlCommand cmd = new SqlCommand();
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spServicioEspecialRegistro", cn);
                cmd.Parameters.AddWithValue("@serEsp_nombre", nombre);
                cmd.Parameters.AddWithValue("@serEsp_caracteristicas", caracteristicas);
                cmd.Parameters.AddWithValue("@serEsp_estado", ser_est);
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
    }
}
