using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoContactos.Models
{
    public class Contactos
    {
        public int id { get; set; }
        public string nombre { get; set; }
        public string apellidos { get; set; }
        public string correo { get; set; }
    }
}