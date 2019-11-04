using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace escuela.Models.ViewModels
{
    public class ListAlumnosViewModel
    {
        //muestra los elementos de un litado

        public int Idalumnos { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
    }
}