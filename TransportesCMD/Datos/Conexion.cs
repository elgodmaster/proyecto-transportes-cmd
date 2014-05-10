﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Datos
{
    public class Conexion
    {
        public static SqlConnection ConexionSQL()
        {
            SqlConnection cn = null;
            try
            {
                cn = new SqlConnection();
                cn.ConnectionString = @"Data Source=.;Initial Catalog=bdTransportesCMD;Integrated Security=True";
            }
            catch (Exception e)
            {
                System.Console.Write("Error de Conexion "+e.Message);
            }
            return cn;
        }
        
    }
}
