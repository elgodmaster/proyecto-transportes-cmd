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
        public static enUsuario spUsuarioLogin(enUsuario prmUsuario) {
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
                            enPersona persona = new enPersona();
                            persona.per_nombres = dr[1].ToString();
                            persona.per_apellidos = dr[2].ToString();
                    usuario.usu_user = dr[3].ToString();                        
                        enPersonal personal = new enPersonal();
                        personal.per_id = Convert.ToInt32(dr[4].ToString());                       
                        personal.persona = persona;                       
                    usuario.personal = personal;                    
                }

            }
            catch (Exception e)
            {
                
            }
            finally
            {
                cn.Close();
            }
            return usuario;
        }
    }
}
