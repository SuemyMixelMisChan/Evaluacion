using escuela.Models;
using escuela.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using  System.Web.Mvc;


namespace escuela.Controllers
{
    public class profesorController : Controller
    {
        // GET: profesor
        public ActionResult Index()
        {
            List<ListProfesorViewModel> lst;
           
            using (escuelaEntities3 db = new escuelaEntities3())
            {
                //colecciontipolistagenerico
                lst = (from d in db.profesor
                       select new ListProfesorViewModel
                       {
                           Idprofesor = d.idprofesor,
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
        public ActionResult Nuevo(ProfesorViewModel model)//ejecuta el guardado //resive un parametro una sobrecarga
        {
            //si es valido realiza la programacion
            try
            {

                if (ModelState.IsValid)//valida los data notetion valida losm formatos
                {
                    //guadr los datos ne labd creando una coneccion
                    using (escuelaEntities3 db = new escuelaEntities3())
                    {
                        var oProfesor = new profesor();
                        oProfesor.nombre = model.Nombre;
                        oProfesor.apellido = model.Apellido;
                        //agregarlo a la base de datos deberia guardarlos
                        db.profesor.Add(oProfesor);
                        db.SaveChanges();

                    }

                    return Redirect("~/profesor/index");
                }
                return View(model);

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        ////////editar
        public ActionResult Editar(int Id)
        {
            ProfesorViewModel model = new ProfesorViewModel();
            using (escuelaEntities3 db = new escuelaEntities3())
            {
                var oTabla = db.profesor.Find(Id);
                model.Nombre = oTabla.nombre;
                model.Apellido = oTabla.apellido;

                model.Idprofesor = oTabla.idprofesor;
            }
            return View(model);
        }

        [HttpPost]
        public ActionResult Editar(ProfesorViewModel model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    using (escuelaEntities3 db = new escuelaEntities3())
                    {
                        var oTabla = db.profesor.Find(model.Idprofesor);
                        oTabla.nombre = model.Nombre;

                        oTabla.apellido = model.Apellido;

                        db.Entry(oTabla).State = System.Data.Entity.EntityState.Modified;
                        db.SaveChanges();
                    }

                    return Redirect("~/profesor/");
                }

                return View(model);


            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        ///
        //eliminar
        [HttpGet]

        public ActionResult Eliminar(int Id)
        {
            AlumnosViewModel model = new AlumnosViewModel();
            using (escuelaEntities3 db = new escuelaEntities3())
            {

                var Elimi = db.profesor.Find(Id);
                db.profesor.Remove(Elimi);//eliminar lo k encontro el find
                db.SaveChanges();
            }
            return Redirect("~/profesor/");//llevarlo ala reaiz
        }
        //
    }
}