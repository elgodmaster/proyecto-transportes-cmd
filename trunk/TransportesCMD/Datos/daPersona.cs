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
    public class daPersona
    {
        #region singleton
        private static readonly daPersona _instancia = new daPersona();
        //private datCliente();
        public static daPersona Instancia
        {
            get { return daPersona._instancia; }
        }
        #endregion

        #region Métodos
        public static List<enPersona> spPersonaXNumeroDocumentoIdentidad(String prmNumDocIde)
        {
            SqlConnection cn = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;

            List<enPersona> lstpersona = null;
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spPersonaXNumeroDocumentoIdentidad", cn);
                cmd.Parameters.AddWithValue("@per_numDocIdentidad", prmNumDocIde);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                dr = cmd.ExecuteReader();
                lstpersona = new List<enPersona>();
                if (dr.Read())
                {
                    enPersona persona = new enPersona();
                    persona.per_id = Convert.ToInt32(dr[0].ToString());
                    persona.per_nombres = dr[1].ToString();
                    persona.per_apellidos = dr[2].ToString();
                    persona.per_sexo = dr[3].ToString();
                    persona.edad = dr[4].ToString();
                    persona.per_fecNacimiento = dr[5].ToString();
                    enDocumentoIdentidad docIdentida = new enDocumentoIdentidad();
                    docIdentida.docIde_id = Convert.ToInt32(dr[6].ToString());
                    persona.documentoIdentidad = docIdentida;
                    persona.per_numDocIdentidad = dr[7].ToString();
                    lstpersona.Add(persona);
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
            return lstpersona;
        }
        public static List<enPersona> spPersonaXApellidos(String nomApellidos)
        {
            SqlConnection cn = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;

            List<enPersona> lstpersona = null;
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spPersonaXApellidos", cn);
                cmd.Parameters.AddWithValue("@per_nomApellidos", nomApellidos);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                dr = cmd.ExecuteReader();
                lstpersona = new List<enPersona>();
                while (dr.Read())
                {
                    enPersona persona = new enPersona();
                    persona.per_id = Convert.ToInt32(dr[0].ToString());
                    persona.per_nombres = dr[1].ToString();
                    persona.per_apellidos = dr[2].ToString();
                    persona.per_sexo = dr[3].ToString();
                    persona.edad = dr[4].ToString();
                    persona.per_fecNacimiento = dr[5].ToString();
                    enDocumentoIdentidad docIdentida = new enDocumentoIdentidad();
                    docIdentida.docIde_id = Convert.ToInt32(dr[6].ToString());
                    persona.documentoIdentidad = docIdentida;
                    persona.per_numDocIdentidad = dr[7].ToString();
                    lstpersona.Add(persona);
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
            return lstpersona;
        }
        #endregion
    }
}
