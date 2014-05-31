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


        #region singleton
        private static readonly daServicio _instancia = new daServicio();
        public static daServicio Instancia
        {
            get { return daServicio._instancia; }
        }
        #endregion

        #region Métodos

        //public static List<enSegmento> segmentoListar()
        //{

        //    SqlConnection cn = null;
        //    SqlCommand cmd = null;
        //    SqlDataReader dr = null;
        //    List<enSegmento> lstSegmento = null;
        //    try
        //    {
        //        cn = Conexion.getConexion();
        //        cmd = new SqlCommand("select * from VE_segmento", cn);
        //        cmd.CommandType = CommandType.Text;
        //        cn.Open();
        //        dr = cmd.ExecuteReader();
        //        lstSegmento = new List<enSegmento>();
        //        while (dr.Read())
        //        {
        //            enSegmento segmento = new enSegmento();
        //            segmento.seg_id = Convert.ToInt32(dr[0].ToString());
        //            segmento.seg_nombre = dr[1].ToString();
        //            lstSegmento.Add(segmento);
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        throw;
        //    }
        //    finally
        //    {
        //        dr.Close();
        //        cn.Close();
        //    }
        //    return lstSegmento;

        //}

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

        public static List<enServicioEspecial> spServicioListar()
        {
            SqlConnection cn = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<enServicioEspecial> lstServicio = null;
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spServicioListar", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                dr = cmd.ExecuteReader();
                lstServicio = new List<enServicioEspecial>();
                while (dr.Read())
                {
                    
                    enServicioEspecial seresp = new enServicioEspecial();
                    seresp.serEsp_nombre = dr[0].ToString();
                    seresp.serEsp_caracteristicas = dr[1].ToString();
                    seresp.serEsp_fecRegistro = Convert.ToDateTime(dr[2].ToString());
                    seresp.serEsp_estado = dr[4].ToString();
                    lstServicio.Add(seresp);
                }

            }
            catch (Exception e)
            {

            }
            finally
            {
                cn.Close();
            }
            return lstServicio;
        }
        #endregion
    }
}
