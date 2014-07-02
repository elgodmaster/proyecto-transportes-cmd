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
    public class daUsuario
    { 
        #region singleton
        private static readonly daUsuario _instancia = new daUsuario();
        public static daUsuario Instancia
        {
            get { return daUsuario._instancia; }
        }
        #endregion

        #region métodos
        public static enUsuario spUsuarioLogin(enUsuario prmUsuario)
        {
            SqlConnection cn = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            enUsuario usuario = null;
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spUsuarioAministrativoLogin", cn);
                cmd.Parameters.AddWithValue("@usu_user", prmUsuario.usu_user);
                cmd.Parameters.AddWithValue("@usu_pass", prmUsuario.usu_pass);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    usuario = new enUsuario();
                    usuario.usu_id = Convert.ToInt32(dr[0].ToString());
                    usuario.usu_user = dr[1].ToString();
                    enPersona persona = new enPersona();
                    persona.per_id = Convert.ToInt32(dr[2].ToString());
                    persona.per_nombres = dr[3].ToString();
                    persona.per_apellidos = dr[4].ToString();
                    enPersonal personal = new enPersonal();
                    personal.per_id = Convert.ToInt32(dr[5].ToString());
                    enCargo cargo = new enCargo();
                    cargo.car_id = Convert.ToInt32(dr[6].ToString());
                    cargo.car_nomCargo = dr[7].ToString();
                    personal.persona = persona;
                    usuario.personal = personal;
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
            return usuario;
        }
#endregion
    }
}
