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
    public class daItinerario
    {
        #region singleton
        private static readonly daItinerario _instancia = new daItinerario();
        //private datCliente();
        public static daItinerario Instancia
        {
            get { return daItinerario._instancia; }
        }
        #endregion

        #region Métodos
        public List<enItinerario> spIntinerarioFechaSalidaXIdOrigenIdDestino(int prmIdOrigen, int prmIdDestino)
        {
            SqlConnection cn = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            enItinerario itinerario = null;
            List<enItinerario> lstItinerarioLista = null;
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spIntinerarioFechaSalidaXIdOrigenIdDestino", cn);
                cmd.Parameters.AddWithValue("@sucOrigen_id", prmIdOrigen);
                cmd.Parameters.AddWithValue("@sucDestino_id", prmIdDestino);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                dr = cmd.ExecuteReader();
                lstItinerarioLista = new List<enItinerario>();
                while (dr.Read())
                {
                    itinerario = new enItinerario();
                    itinerario.iti_fecSalida = dr[0].ToString();
                    lstItinerarioLista.Add(itinerario);
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
            return lstItinerarioLista;

        }
        public List<enItinerario> spIntinerarioHoraSalidaXIdOrigenIdDestinoFecha(int prmIdOrigen, int prmIdDestino, String prmFecha)
        {
            SqlConnection cn = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<enItinerario> lstItinerarioLista = null;
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spIntinerarioHoraSalidaXIdOrigenIdDestinoFecha", cn);
                cmd.Parameters.AddWithValue("@sucOrigen_id", prmIdOrigen);
                cmd.Parameters.AddWithValue("@sucDestino_id", prmIdDestino);
                cmd.Parameters.AddWithValue("@iti_fecSalida", prmFecha);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                dr = cmd.ExecuteReader();
                lstItinerarioLista = new List<enItinerario>();
                while (dr.Read())
                {
                    enItinerario itinerario = new enItinerario();

                    itinerario.iti_id = Convert.ToInt32(dr[0].ToString());
                    enRuta ruta = new enRuta();
                    ruta.rut_horSalida = dr[1].ToString();
                    itinerario.ruta = ruta;
                    itinerario.iti_fecSalida = dr[2].ToString();
                    lstItinerarioLista.Add(itinerario);
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
            return lstItinerarioLista;

        }

        public List<enItinerario> spIntinerarioResumenXIdOrigenIdDestinoFecha(int prmIdOrigen, int prmIdDestino, String prmFecha)
        {
            SqlConnection cn = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<enItinerario> lstItinerarioLista = null;
            try
            {
                cn = Conexion.ConexionSQL();
                cmd = new SqlCommand("spIntinerarioResumenXIdOrigenIdDestinoFecha", cn);
                cmd.Parameters.AddWithValue("@sucOrigen_id", prmIdOrigen);
                cmd.Parameters.AddWithValue("@sucDestino_id", prmIdDestino);
                cmd.Parameters.AddWithValue("@iti_fecSalida", prmFecha);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                dr = cmd.ExecuteReader();
                lstItinerarioLista = new List<enItinerario>();
                while (dr.Read())
                {
                    enItinerario itinerario = new enItinerario();
                    enVehiculo vehiculo = new enVehiculo();
                    enServicioEspecial serEspecial = new enServicioEspecial();
                    itinerario.iti_id = Convert.ToInt32(dr[0].ToString());
                    enRuta ruta = new enRuta();
                    ruta.rut_horSalida = dr[1].ToString();
                    itinerario.ruta = ruta;
                    serEspecial.serEsp_nombre = dr[2].ToString();
                    itinerario.iti_precio = Convert.ToDouble(dr[3].ToString());
                    vehiculo.veh_totAsientos = Convert.ToInt32(dr[4].ToString());
                    vehiculo.servicioEspecial = serEspecial;
                    itinerario.vehiculo = vehiculo;
                    lstItinerarioLista.Add(itinerario);
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
            return lstItinerarioLista;

        }
        #endregion

    }
}
