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
            using (escuelaEntities3 db = new escuelaEntities3())
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
                    using (escuelaEntities3 db = new escuelaEntities3())
                    {
                        var oAlumnos = new alumnos();
                        oAlumnos.nombre = model.Nombre;
                        oAlumnos.apellido = model.Apellido;
                        //agregarlo a la base de datos deberia guardarlos
                        db.alumnos.Add(oAlumnos);
                        db.SaveChanges();

                    }
                    
                    return Redirect("~/alumnos/Index"); 
                }
                return View(model);
              
            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        ////////////////eliminar controlador eliminar
        /////
         public ActionResult Editar(int Id)
        {
            AlumnosViewModel model = new AlumnosViewModel();
            using (escuelaEntities3 db = new escuelaEntities3())
            {
                var oTabla = db.alumnos.Find(Id);
                model.Nombre = oTabla.nombre;
                model.Apellido= oTabla.apellido;
               
                model.Idalumnos = oTabla.idalumnos;
            }
            return View(model);
        }

        [HttpPost]
        public ActionResult Editar(AlumnosViewModel model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    using (escuelaEntities3 db = new escuelaEntities3())
                    {
                        var oTabla = db.alumnos.Find(model.Idalumnos);
                        oTabla.nombre = model.Nombre;
                        
                        oTabla.apellido = model.Apellido;

                        db.Entry(oTabla).State = System.Data.Entity.EntityState.Modified;
                        db.SaveChanges();
                    }

                    return Redirect("~/alumnos/");
                }

                return View(model);


            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        /////eliminar
        
            [HttpGet]

        public ActionResult Eliminar(int Id)
        {
            AlumnosViewModel model = new AlumnosViewModel();
            using (escuelaEntities3 db = new escuelaEntities3())
            {
                
                var Elimi= db.alumnos.Find(Id);
                db.alumnos.Remove(Elimi);//eliminar lo k encontro el find
                db.SaveChanges();
            }
            return Redirect("~/alumnos/");//llevarlo ala reaiz
        }
        /// 
        ///

    }
}