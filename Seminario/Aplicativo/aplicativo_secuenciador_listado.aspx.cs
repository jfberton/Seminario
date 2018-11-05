﻿using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Seminario.Aplicativo
{
    public partial class aplicativo_secuenciador_listado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListarUbicaciones();
            }
        }

        private void ListarUbicaciones()
        {
            using (var cxt = new seminarioDBContainer())
            {
                Usuario u = Session["UsuarioLogueado"] as Usuario;

                var ubicaciones = (from ss in cxt.Secuenciadores
                                   where ss.usuario_id == u.usuario_id || ss.secuenciador_publico
                                   select new
                                   {
                                       id = ss.secuenciador_id,
                                       publico = ss.secuenciador_publico,
                                       nombre = ss.secuenciador_datos_generales_nombre,
                                       area = ss.secuenciador_datos_generales_area,
                                       asignatura = ss.secuenciador_datos_generales_asignatura,
                                       curso = ss.secuenciador_datos_generales_curso,
                                       institucion = ss.secuenciador_datos_generales_institucion
                                   }).ToList();

                gv_secuenciadores.DataSource = ubicaciones;
                gv_secuenciadores.DataBind();
            }
        }

        protected void btn_agregar_secuenciador_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Aplicativo/aplicativo_secuenciador.aspx");
        }

        protected void SeleccionarRegistro(object sender, GridViewCommandEventArgs e)
        {
            int fila = int.Parse(e.CommandArgument.ToString());

            int id_secuenciador = 0;

            if (int.TryParse(gv_secuenciadores.Rows[fila].Cells[0].Text, out id_secuenciador))
            {

                if (e.CommandName == "btn_seleccionar")
                {
                    Session["id_secuenciador"] = id_secuenciador;

                    Response.Redirect("~/Aplicativo/aplicativo_secuenciador.aspx");

                }

                if (e.CommandName == "btn_imprimir")
                {
                    using (var cxt = new seminarioDBContainer())
                    {
                        Secuenciador s = cxt.Secuenciadores.FirstOrDefault(ss => ss.secuenciador_id == id_secuenciador);

                        Reportes.secuenciador ds = new Reportes.secuenciador();

                        Reportes.secuenciador.SecuenciadorRow dr = ds.Secuenciador.NewSecuenciadorRow();

                        dr.area = s.secuenciador_datos_generales_area;
                        dr.asignatura = s.secuenciador_datos_generales_asignatura;
                        dr.autor = s.secuenciador_descripcion_autor;
                        dr.capacidades = s.secuenciador_descripcion_capacidades_a_desarrollar;
                        dr.contenidos = s.secuenciador_descripcion_contenidos;
                        dr.curso = s.secuenciador_datos_generales_curso;
                        dr.institucion = s.secuenciador_datos_generales_institucion;
                        dr.metodologia = s.secuenciador_descripcion_metodologia;
                        dr.nombre = s.secuenciador_datos_generales_nombre;
                        dr.objetivos = s.secuenciador_descripcion_objetivos;
                        dr.orientaciones_evaluacion = s.secuenciador_descripcion_orientaciones_generales_evaluacion;
                        dr.propositos = s.secuenciador_descripcion_propositos;
                        dr.secuencia_id = s.secuenciador_id.ToString();
                        dr.tema = s.secuenciador_descripcion_tema_general;

                        ds.Secuenciador.Rows.Add(dr);

                        foreach (Clase clase in s.Clases)
                        {
                            Reportes.secuenciador.ClasesRow dr_clase = ds.Clases.NewClasesRow();

                            dr_clase.apertura = clase.clase_actividades_apertura;
                            dr_clase.aprendizage = clase.clase_evidencias_aprendizaje;
                            dr_clase.cierre = clase.clase_actividades_cierre;
                            dr_clase.desarrollo = clase.clase_actividades_desarrollo;
                            dr_clase.recursos_bibliografia = clase.clase_bibliografia;
                            dr_clase.secuencia_Id = s.secuenciador_id.ToString();
                            dr_clase.nombre = clase.clase_numero;

                            ds.Clases.Rows.Add(dr_clase);
                        }

                        Render_Report_Secuencia(ds);

                    }
                }

            }

        }

        private void Render_Report_Secuencia(Reportes.secuenciador ds)
        {
            ReportViewer viewer = new ReportViewer();
            viewer.ProcessingMode = ProcessingMode.Local;
            viewer.LocalReport.EnableExternalImages = true;

            viewer.LocalReport.ReportPath = Server.MapPath("~/Aplicativo/Reportes/secuenciador.rdlc");

            ReportDataSource secuenciador = new ReportDataSource("ds_secuenciador", ds.Secuenciador.Rows);
            ReportDataSource clases = new ReportDataSource("ds_clases", ds.Clases.Rows);

            viewer.LocalReport.DataSources.Add(secuenciador);
            viewer.LocalReport.DataSources.Add(clases);

            Microsoft.Reporting.WebForms.Warning[] warnings = null;
            string[] streamids = null;
            string mimeType = null;
            string encoding = null;
            string extension = null;
            string deviceInfo = null;
            byte[] bytes = null;

            deviceInfo = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>";

            //Render the report
            bytes = viewer.LocalReport.Render("PDF", deviceInfo, out mimeType, out encoding, out extension, out streamids, out warnings);
            Session["Reporte"] = bytes;

            string script = "<script type='text/javascript'>window.open('Reportes/reportes.aspx');</script>";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "VentanaPadre", script);
        }

    }
}