﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entidades;

namespace Datos
{
    public class daDocumentoIdentidad
    {
        #region singleton
        private static readonly daDocumentoIdentidad _instancia = new daDocumentoIdentidad();
        //private datCliente();
        public static daDocumentoIdentidad Instancia
        {
            get { return daDocumentoIdentidad._instancia; }
        }
        #endregion

        #region Métodos
        public List<enDocumentoIdentidad> spDocumentoIdentidadLista()
        {
            SqlConnection cn = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<enDocumentoIdentidad> lstDocIdentidad = null;
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spDocumentoIdentidadLista", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                dr = cmd.ExecuteReader();
                lstDocIdentidad = new List<enDocumentoIdentidad>();
                while (dr.Read())
                {
                    enDocumentoIdentidad docIdentidad = new enDocumentoIdentidad();
                    docIdentidad.docIde_id = Convert.ToInt32(dr[0].ToString());
                    docIdentidad.docIde_longitud = Convert.ToInt32(dr[1].ToString());
                    docIdentidad.docIde_descripcion = dr[2].ToString();
                    docIdentidad.docIde_valor = dr[3].ToString();
                    lstDocIdentidad.Add(docIdentidad);
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
            return lstDocIdentidad;
        }
        #endregion
    }
}
