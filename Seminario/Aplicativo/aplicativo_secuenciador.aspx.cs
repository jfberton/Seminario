using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Seminario.Aplicativo
{
    public partial class aplicativo_secuenciador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                tb_id_sec.Value = Session["id_secuenciador"] != null ? Session["id_secuenciador"].ToString() : "0";
                Session["id_secuenciador"] = null;
                Usuario u = Session["UsuarioLogueado"] as Usuario;
                if (tb_id_sec.Value != "0")
                {
                    //el valor cargado en el tb_id_sec es un valor numerico y corresponde al id de una secuencia valida

                    int id_secuenciador = int.Parse(tb_id_sec.Value);
                    using (var cxt = new seminarioDBContainer())
                    {
                        Secuenciador s = cxt.Secuenciadores.Include("Clases").First(ss => ss.secuenciador_id == id_secuenciador);
                        Session["secuenciador"] = s;

                        if (s.usuario_id == u.usuario_id)
                        {
                            btn_sec_agregar.Enabled = false;
                            btn_sec_modificar.Enabled = true;
                            btn_sec_eliminar.Enabled = true;
                        }
                        else
                        {
                            btn_sec_agregar.Enabled = false;
                            btn_sec_modificar.Enabled = false;
                            btn_sec_eliminar.Enabled = false;
                            btn_clase_agregar.Enabled = false;
                        }

                    }

                    CargarDatos();
                }
                else
                {
                    LimpiarControles();

                    Session["secuenciador"] = new Secuenciador();

                    btn_sec_agregar.Enabled = true;
                    btn_sec_modificar.Enabled = false;
                    btn_sec_eliminar.Enabled = false;
                }
            }
        }

        private void LimpiarControles()
        {
            tb_id_sec.Value = "0";
            tb_sec_desc_autor.Value = "";
            tb_sec_desc_capacidades.Value = "";
            tb_sec_desc_contenido.Value = "";
            tb_sec_desc_evaluacion.Value = "";
            tb_sec_desc_metodologia.Value = "";
            tb_sec_desc_objetivos.Value = "";
            tb_sec_desc_propositos.Value = "";
            tb_sec_desc_tema.Value = "";
            tb_sec_gen_area.Value = "";
            tb_sec_gen_asignatura.Value = "";
            tb_sec_gen_curso.Value = "";
            tb_sec_gen_institucion.Value = "";
            tb_sec_gen_nombre.Value = "";
            tb_ID_clase.Value = "0";
        }

        private void CargarDatos()
        {
            Secuenciador s = Session["secuenciador"] as Secuenciador;

            tb_id_sec.Value = s.secuenciador_id.ToString();
            tb_sec_desc_autor.Value = s.secuenciador_descripcion_autor;
            tb_sec_desc_capacidades.Value = s.secuenciador_descripcion_capacidades_a_desarrollar;
            tb_sec_desc_contenido.Value = s.secuenciador_descripcion_contenidos;
            tb_sec_desc_evaluacion.Value = s.secuenciador_descripcion_orientaciones_generales_evaluacion;
            tb_sec_desc_metodologia.Value = s.secuenciador_descripcion_metodologia;
            tb_sec_desc_objetivos.Value = s.secuenciador_descripcion_objetivos;
            tb_sec_desc_propositos.Value = s.secuenciador_descripcion_propositos;
            tb_sec_desc_tema.Value = s.secuenciador_descripcion_tema_general;
            tb_sec_gen_area.Value = s.secuenciador_datos_generales_area;
            tb_sec_gen_asignatura.Value = s.secuenciador_datos_generales_asignatura;
            tb_sec_gen_curso.Value = s.secuenciador_datos_generales_curso;
            tb_sec_gen_institucion.Value = s.secuenciador_datos_generales_institucion;
            tb_sec_gen_nombre.Value = s.secuenciador_datos_generales_nombre;
            tb_ID_clase.Value = "";

            var clases = (from c in s.Clases
                          select new
                          {
                              ID = c.clase_id,
                              numero = c.clase_numero
                          }).ToList();

            gv_clases.DataSource = clases;
            gv_clases.DataBind();

            lbl_cantidad_clases.Text = clases.Count().ToString();
        }

        #region Clase

        protected void btn_agregar_clase_Click(object sender, EventArgs e)
        {
            tb_clase_apertura.Value = "";
            tb_clase_aprendizaje.Value = "";
            tb_clase_bibliografia.Value = "";
            tb_clase_cierre.Value = "";
            tb_clase_desarrollo.Value = "";
            tb_clase_numero.Value = "";
            MostrarPopUpClase();
        }

        private void MostrarPopUpClase()
        {
            string script = "<script language=\"javascript\"  type=\"text/javascript\">$(document).ready(function() { $('#modal_clase').modal('show'); $('#tab_secuenciador a[href=\"#tab_sec_descripcion\"]').tab('show')});</script>";
            ScriptManager.RegisterStartupScript(Page, this.GetType(), "ShowPopUp", script, false);
        }

        protected void SeleccionarRegistro(object sender, GridViewCommandEventArgs e)
        {
            Secuenciador s = Session["secuenciador"] as Secuenciador;

            int fila = int.Parse(e.CommandArgument.ToString());

            Guid id_clase = new Guid(gv_clases.Rows[fila].Cells[0].Text);

            Clase clase = s.Clases.FirstOrDefault(uu => uu.clase_id == id_clase);

            tb_ID_clase.Value = clase.clase_id.ToString();

            tb_clase_numero.Value = clase.clase_numero;
            tb_clase_apertura.Value = clase.clase_actividades_apertura;
            tb_clase_aprendizaje.Value = clase.clase_evidencias_aprendizaje;
            tb_clase_bibliografia.Value = clase.clase_bibliografia;
            tb_clase_cierre.Value = clase.clase_actividades_cierre;
            tb_clase_desarrollo.Value = clase.clase_actividades_desarrollo;

            btn_clase_agregar.Enabled = false;
            btn_clase_eliminar.Enabled = true;
            btn_clase_modificar.Enabled = true;

            MostrarPopUpClase();
        }

        private void LimpiarClase()
        {
            tb_ID_clase.Value = "";
            tb_clase_numero.Value = "";
            tb_clase_apertura.Value = "";
            tb_clase_aprendizaje.Value = "";
            tb_clase_bibliografia.Value = "";
            tb_clase_cierre.Value = "";
            tb_clase_desarrollo.Value = "";

            btn_clase_agregar.Enabled = true;
            btn_clase_eliminar.Enabled = false;
            btn_clase_modificar.Enabled = false;
        }

        private void ListarClases()
        {
            LimpiarClase();

            Secuenciador s = Session["secuenciador"] as Secuenciador;

            var clases = (from c in s.Clases
                          select new
                          {
                              ID = c.clase_id,
                              numero = c.clase_numero
                          }).ToList();

            gv_clases.DataSource = clases;
            gv_clases.DataBind();

            lbl_cantidad_clases.Text = clases.Count().ToString();

            string script = "<script language=\"javascript\"  type=\"text/javascript\">$(document).ready(function() { $('#tab_secuenciador a[href=\"#tab_sec_descripcion\"]').tab('show')});</script>";
            ScriptManager.RegisterStartupScript(Page, this.GetType(), "ShowPopUp", script, false);
        }

        protected void btn_clase_agregar_Click(object sender, EventArgs e)
        {
            Secuenciador s = Session["secuenciador"] as Secuenciador;

            Clase c = new Clase();

            c.clase_id = Guid.NewGuid();
            c.clase_numero = tb_clase_numero.Value==""? "(Vacío)" : tb_clase_numero.Value;
            c.clase_actividades_apertura = tb_clase_apertura.Value;
            c.clase_actividades_cierre = tb_clase_cierre.Value;
            c.clase_actividades_desarrollo = tb_clase_desarrollo.Value;
            c.clase_bibliografia = tb_clase_bibliografia.Value;
            c.clase_evidencias_aprendizaje = tb_clase_aprendizaje.Value;
            c.clase_recursos = "";

            s.Clases.Add(c);

            Session["secuenciador"] = s;

            ListarClases();
        }

        protected void btn_clase_modificar_Click(object sender, EventArgs e)
        {
            Secuenciador s = Session["secuenciador"] as Secuenciador;

            Guid id_clase = new Guid(tb_ID_clase.Value);

            Clase c = s.Clases.FirstOrDefault(cc => cc.clase_id == id_clase);

            c.clase_numero = tb_clase_numero.Value == "" ? "(Vacío)" : tb_clase_numero.Value;
            c.clase_actividades_apertura = tb_clase_apertura.Value;
            c.clase_actividades_cierre = tb_clase_cierre.Value;
            c.clase_actividades_desarrollo = tb_clase_desarrollo.Value;
            c.clase_bibliografia = tb_clase_bibliografia.Value;
            c.clase_evidencias_aprendizaje = tb_clase_aprendizaje.Value;
            c.clase_recursos = "";

            Session["secuenciador"] = s;

            ListarClases();
        }

        protected void btn_clase_eliminar_Click(object sender, EventArgs e)
        {
            Secuenciador s = Session["secuenciador"] as Secuenciador;

            Guid id_clase = new Guid(tb_ID_clase.Value);

            Clase c = s.Clases.FirstOrDefault(cc => cc.clase_id == id_clase);

            s.Clases.Remove(c);

            Session["secuenciador"] = s;

            ListarClases();
        }

        #endregion

        protected void btn_sec_agregar_Click(object sender, EventArgs e)
        {
            using (var cxt = new seminarioDBContainer())
            {
                Usuario u = Session["UsuarioLogueado"] as Usuario;

                Secuenciador s_temp = Session["secuenciador"] as Secuenciador;

                Secuenciador s = new Secuenciador();

                s.usuario_id = u.usuario_id;
                s.secuenciador_publico = chk_publico.Checked;

                s.secuenciador_datos_generales_area = tb_sec_gen_area.Value;
                s.secuenciador_datos_generales_asignatura = tb_sec_gen_asignatura.Value;
                s.secuenciador_datos_generales_curso = tb_sec_gen_curso.Value;
                s.secuenciador_datos_generales_institucion = tb_sec_gen_institucion.Value;
                s.secuenciador_datos_generales_nombre = tb_sec_gen_nombre.Value;

                s.secuenciador_descripcion_autor = u.usuario_nombre_apellido;
                s.secuenciador_descripcion_capacidades_a_desarrollar = tb_sec_desc_capacidades.Value;
                s.secuenciador_descripcion_contenidos = tb_sec_desc_contenido.Value;
                s.secuenciador_descripcion_metodologia = tb_sec_desc_metodologia.Value;
                s.secuenciador_descripcion_numero_clases = s_temp.Clases.Count.ToString();
                s.secuenciador_descripcion_objetivos = tb_sec_desc_objetivos.Value;
                s.secuenciador_descripcion_orientaciones_generales_evaluacion = tb_sec_desc_evaluacion.Value;
                s.secuenciador_descripcion_propositos = tb_sec_desc_propositos.Value;
                s.secuenciador_descripcion_tema_general = tb_sec_desc_tema.Value;

                foreach (Clase clase in s_temp.Clases)
                {
                    s.Clases.Add(new Clase()
                    {
                        clase_id = clase.clase_id,
                        clase_actividades_apertura = clase.clase_actividades_apertura,
                        clase_actividades_cierre = clase.clase_actividades_cierre,
                        clase_actividades_desarrollo = clase.clase_actividades_desarrollo,
                        clase_bibliografia = clase.clase_bibliografia,
                        clase_evidencias_aprendizaje = clase.clase_evidencias_aprendizaje,
                        clase_numero = clase.clase_numero,
                        clase_recursos = clase.clase_recursos

                    });
                }

                cxt.Secuenciadores.Add(s);
                cxt.SaveChanges();

                Response.Redirect("~/aplicativo_secuenciador_listado.aspx");

            }
        }

        protected void btn_sec_eliminar_Click(object sender, EventArgs e)
        {
            using (var cxt = new seminarioDBContainer())
            {
                Usuario u = Session["UsuarioLogueado"] as Usuario;

                Secuenciador s_temp = Session["secuenciador"] as Secuenciador;

                Secuenciador s = cxt.Secuenciadores.FirstOrDefault(ss => ss.secuenciador_id == s_temp.secuenciador_id);

                cxt.Secuenciadores.Remove(s);

                cxt.SaveChanges();

                Response.Redirect("~/aplicativo_secuenciador_listado.aspx");
            }
        }

        protected void btn_sec_volver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/aplicativo_secuenciador_listado.aspx");
        }

        protected void btn_sec_modificar_Click(object sender, EventArgs e)
        {
            using (var cxt = new seminarioDBContainer())
            {
                Usuario u = Session["UsuarioLogueado"] as Usuario;

                Secuenciador s_temp = Session["secuenciador"] as Secuenciador;

                Secuenciador s = cxt.Secuenciadores.Include("Clases").FirstOrDefault(ss => ss.secuenciador_id == s_temp.secuenciador_id);

                s.usuario_id = u.usuario_id;
                s.secuenciador_publico = chk_publico.Checked;

                s.secuenciador_datos_generales_area = tb_sec_gen_area.Value;
                s.secuenciador_datos_generales_asignatura = tb_sec_gen_asignatura.Value;
                s.secuenciador_datos_generales_curso = tb_sec_gen_curso.Value;
                s.secuenciador_datos_generales_institucion = tb_sec_gen_institucion.Value;
                s.secuenciador_datos_generales_nombre = tb_sec_gen_nombre.Value;

                s.secuenciador_descripcion_autor = u.usuario_nombre_apellido;
                s.secuenciador_descripcion_capacidades_a_desarrollar = tb_sec_desc_capacidades.Value;
                s.secuenciador_descripcion_contenidos = tb_sec_desc_contenido.Value;
                s.secuenciador_descripcion_metodologia = tb_sec_desc_metodologia.Value;
                s.secuenciador_descripcion_numero_clases = s_temp.Clases.Count.ToString();
                s.secuenciador_descripcion_objetivos = tb_sec_desc_objetivos.Value;
                s.secuenciador_descripcion_orientaciones_generales_evaluacion = tb_sec_desc_evaluacion.Value;
                s.secuenciador_descripcion_propositos = tb_sec_desc_propositos.Value;
                s.secuenciador_descripcion_tema_general = tb_sec_desc_tema.Value;

                //recorro las clases originales para ver si hubo alguna eliminada
                List<Clase> clases = s.Clases.Where(cc => !s_temp.Clases.Select(cc1 => cc1.clase_id).Contains(cc.clase_id)).ToList();
                cxt.Clases.RemoveRange(clases);

                //recorro las clases nuevas para ver si ubo alguna por agregar
                foreach (Clase clase in s_temp.Clases)
                {
                    Clase c = s.Clases.FirstOrDefault(cc => cc.clase_id == clase.clase_id);
                    if (c == null)
                    {
                        s.Clases.Add(new Clase()
                        {
                            clase_id = clase.clase_id,
                            clase_actividades_apertura = clase.clase_actividades_apertura,
                            clase_actividades_cierre = clase.clase_actividades_cierre,
                            clase_actividades_desarrollo = clase.clase_actividades_desarrollo,
                            clase_bibliografia = clase.clase_bibliografia,
                            clase_evidencias_aprendizaje = clase.clase_evidencias_aprendizaje,
                            clase_numero = clase.clase_numero,
                            clase_recursos = clase.clase_recursos

                        });
                    }
                    else
                    {
                        c.clase_actividades_apertura = clase.clase_actividades_apertura;
                        c.clase_actividades_cierre = clase.clase_actividades_cierre;
                        c.clase_actividades_desarrollo = clase.clase_actividades_desarrollo;
                        c.clase_bibliografia = clase.clase_bibliografia;
                        c.clase_evidencias_aprendizaje = clase.clase_evidencias_aprendizaje;
                        c.clase_numero = clase.clase_numero;
                        c.clase_recursos = clase.clase_recursos;
                    }
                }

                cxt.SaveChanges();

                Response.Redirect("~/aplicativo_secuenciador_listado.aspx");

            }
        }
    }
}