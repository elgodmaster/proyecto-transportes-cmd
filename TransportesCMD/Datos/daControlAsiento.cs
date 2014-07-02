using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class daControlAsiento
    {

        #region singleton
        private static readonly daControlAsiento _instancia = new daControlAsiento();
        //private datCliente();
        public static daControlAsiento Instancia
        {
            get { return daControlAsiento._instancia; }
        }
        #endregion

        #region Métodos

        public List<enControlAsiento> spControlAsientoXIdItinerario(int prmIdItinerario)
        {
            SqlConnection cn = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<enControlAsiento> lstConAsiento = null;
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spControlAsientoXIdItinerario", cn);
                cmd.Parameters.AddWithValue("@iti_id", prmIdItinerario);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                dr = cmd.ExecuteReader();
                lstConAsiento = new List<enControlAsiento>();
                while (dr.Read())
                {
                    enControlAsiento conAsiento = new enControlAsiento();
                    conAsiento.conAsi_piso = Convert.ToInt32(dr[0].ToString());
                    conAsiento.conAsi_numAsiento = Convert.ToInt32(dr[1].ToString());
                    conAsiento.conAsi_estAsiento = dr[2].ToString();
                    lstConAsiento.Add(conAsiento);
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
            return lstConAsiento;
        }
        #endregion
    }
}
