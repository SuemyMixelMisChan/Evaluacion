using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using escuela.Models;
using escuela.Models.ViewModels;

namespace escuela.Controllers
{
    public class alumnosController : Controller
    {
        // GET: alumnos
        public ActionResult Index()
        {
            List<ListAlumnosViewModel> lst;//es una variable
            using (escuelaEntities db = new escuelaEntities())
            {
                //colecciontipolistagenerico
                 lst = (from d in db.alumnos
                           select new ListAlumnosViewModel
                           {
                               Idalumnos = d.idalumnos,
                               Nombre = d.nombre,
                               Apellido = d.apellido
                           }).ToList();
            }
           return View(lst);//manda la lista cmo modelo
        }

        public ActionResult Nuevo()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Nuevo(AlumnosViewModel model)//ejecuta el guardado //resive un parametro una sobrecarga
        {
            //si es valido realiza la programacion
            try
            {

                if (ModelState.IsValid)//valida los data notetion valida losm formatos
                {
                    //guadr los datos ne labd creando una coneccion
                    using (escuelaEntities db = new escuelaEntities())
                    {
                        var oAlumnos = new alumnos();
                        oAlumnos.nombre = model.Nombre;
                        oAlumnos.apellido = model.Apellido;
                        //agregarlo a la base de datos deberia guardarlos
                        db.alumnos.Add(oAlumnos);
                        db.SaveChanges();

                    }
                    
                    return Redirect("/"); 
                }
                return View(model);
              
            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}