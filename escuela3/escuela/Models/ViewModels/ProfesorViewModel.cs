using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace escuela.Models.ViewModels
{
    public class ProfesorViewModel
    {
        
            public int Idprofesor { get; set; }
         

        [Required]//data notetion para aser validaciones poner formatos
        [StringLength(50)]
        [Display(Name = "Nombre")]
        public string Nombre { get; set; }

        [Required]
        [StringLength(50)]
        [Display(Name = "Apellido")]//cuando no pones algo te dice km ase falta escribir el nm bre
        public string Apellido { get; set; }
    }
}