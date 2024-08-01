using ProyectoContactos.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoContactos.Controllers
{
    public class ContactoController : Controller
    {
        private static string conexion = ConfigurationManager.ConnectionStrings["cadena"].ToString();

        private static List<Contactos> olista = new List<Contactos>();


        // GET: Contacto
        public ActionResult Inicio()
        {
            olista = new List<Contactos>();
            using (SqlConnection oconexion = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Contactos", oconexion);
                cmd.CommandType = System.Data.CommandType.Text;
                oconexion.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        Contactos nuevoContacto = new Contactos();
                        nuevoContacto.id = Convert.ToInt32(dr["id"]);
                        nuevoContacto.nombre = dr["nombre"].ToString();
                        nuevoContacto.apellidos = dr["apellidos"].ToString();
                        nuevoContacto.correo = dr["correo"].ToString();

                        olista.Add(nuevoContacto);
                    }
                }

                
            }
            return View(olista);
        }

        [HttpGet]
        public ActionResult Registrar()
        {

            return View();
        }

        [HttpPost]
        public ActionResult Registrar(Contactos contacto)
        {
            using (SqlConnection oconexion = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("sp_crear", oconexion);
                cmd.Parameters.AddWithValue("nombre",contacto.nombre);
                cmd.Parameters.AddWithValue("apellidos", contacto.apellidos);
                cmd.Parameters.AddWithValue("correo", contacto.correo);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                oconexion.Open();
                cmd.ExecuteNonQuery();
            }
            return RedirectToAction("Inicio","Contacto");
        }

        [HttpGet]
        public ActionResult Editar(int? id)
        {
            if (id == null)
            {
                return RedirectToAction("Inicio","Contacto");
            }
            Contactos contacto = olista.Where(c => c.id == id).FirstOrDefault();
            return View(contacto);
        }

        [HttpPost]
        public ActionResult Editar(Contactos contacto)
        {
            using (SqlConnection oconexion = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("sp_actualizar", oconexion);
                cmd.Parameters.AddWithValue("id", contacto.id);
                cmd.Parameters.AddWithValue("nombre", contacto.nombre);
                cmd.Parameters.AddWithValue("apellidos", contacto.apellidos);
                cmd.Parameters.AddWithValue("correo", contacto.correo);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                oconexion.Open();
                cmd.ExecuteNonQuery();
            }
            return RedirectToAction("Inicio", "Contacto");
        }
        [HttpGet]
        public ActionResult Eliminar(int? id)
        {
            if (id == null)
            {
                return RedirectToAction("Inicio","Contacto");
            }
            Contactos contacto = olista.Where(m => m.id == id).FirstOrDefault();
            return View(contacto);
        }

        [HttpPost]
        public ActionResult Eliminar(string id)
        {
            using (SqlConnection oconexion = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("sp_eliminar", oconexion);
                cmd.Parameters.AddWithValue("id", id);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                oconexion.Open();
                cmd.ExecuteNonQuery();
            }

            return RedirectToAction("Inicio", "Contacto");
        }




    }
}