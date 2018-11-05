using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Seminario.Aplicativo
{
    public partial class aplicativo_ubicacion_instituciones : System.Web.UI.Page
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
                var ubicaciones = (from uu in cxt.Ubicaciones
                                   select new
                                   {
                                       id = uu.ubicacion_Id,
                                       categoria = uu.ubicacion_categoria,
                                       lugar = uu.ubicacion_nombre_lugar,
                                       ubicacion = uu.ubicacion_direccion,
                                       latitud = uu.ubicacion_latitud,
                                       longitud = uu.ubicacion_longitud
                                   }).ToList();

                gv_ubicaciones.DataSource = ubicaciones;
                gv_ubicaciones.DataBind();
            }

            Limpiar();
        }

        protected void btn_agregar_Click(object sender, EventArgs e)
        {
            using (var cxt = new seminarioDBContainer())
            {
                Ubicacion ub = new Ubicacion();
                ub.ubicacion_categoria = ddl_categoria.SelectedItem.Text;
                ub.ubicacion_nombre_lugar = tb_nombre_lugar.Value;
                ub.ubicacion_descripcion = tb_descripcion.Value;
                ub.ubicacion_direccion = tb_direccion.Value;
                ub.ubicacion_latitud = tb_latitud.Value;
                ub.ubicacion_longitud = tb_longitud.Value;
                ub.ubicacion_face = tb_facebook.Value;
                ub.ubicacion_mail = tb_email.Value;
                ub.ubicacion_telefono = tb_telefono.Value;
                ub.ubicacion_web = tb_pagina.Value;
                ub.ubicacion_twitter = tb_twitter.Value;

                cxt.Ubicaciones.Add(ub);
                cxt.SaveChanges();
            }

            ListarUbicaciones();
        }


        private void MostrarPopUpDatosInstituto()
        {
            string script = "<script language=\"javascript\"  type=\"text/javascript\">$(document).ready(function() { $('#modal_datos_instituto').modal('show')});</script>";
            ScriptManager.RegisterStartupScript(Page, this.GetType(), "ShowPopUp", script, false);
        }

        protected void SeleccionarRegistro(object sender, GridViewCommandEventArgs e)
        {
            int fila = int.Parse(e.CommandArgument.ToString());

            int id_instituto = 0;

            if (int.TryParse(gv_ubicaciones.Rows[fila].Cells[0].Text, out id_instituto))
            {
                using (var cxt = new seminarioDBContainer())
                {
                    Ubicacion instituto = cxt.Ubicaciones.FirstOrDefault(uu => uu.ubicacion_Id == id_instituto);

                    ddl_categoria.SelectedValue = instituto.ubicacion_categoria;
                    tb_ID.Value = instituto.ubicacion_Id.ToString();
                    tb_nombre_lugar.Value = instituto.ubicacion_nombre_lugar;
                    tb_direccion.Value = instituto.ubicacion_direccion;
                    tb_latitud.Value = instituto.ubicacion_latitud;
                    tb_longitud.Value = instituto.ubicacion_longitud;
                    tb_descripcion.Value = instituto.ubicacion_descripcion;
                    tb_email.Value = instituto.ubicacion_mail;
                    tb_facebook.Value = instituto.ubicacion_face;
                    tb_pagina.Value = instituto.ubicacion_web;
                    tb_telefono.Value = instituto.ubicacion_telefono;
                    tb_twitter.Value = instituto.ubicacion_twitter;

                    btn_agregar.Enabled = false;
                    btn_eliminar.Enabled = true;
                    btn_modificar.Enabled = true;

                    MostrarPopUpDatosInstituto();
                }
            }


        }

        private void Limpiar()
        {
            tb_ID.Value = "";
            tb_longitud.Value = "0";
            tb_latitud.Value = "0";
            tb_nombre_lugar.Value = "";
            tb_direccion.Value = "";
            tb_descripcion.Value = "";
            tb_email.Value = "";
            tb_telefono.Value = "";
            tb_pagina.Value = "";
            tb_facebook.Value = "";
            tb_twitter.Value = "";


            btn_agregar.Enabled = true;
            btn_eliminar.Enabled = false;
            btn_modificar.Enabled = false;
        }

        protected void btn_modificar_Click(object sender, EventArgs e)
        {
            using (var cxt = new seminarioDBContainer())
            {
                int id_ubicacion = 0;
                int.TryParse(tb_ID.Value, out id_ubicacion);
                Ubicacion u = cxt.Ubicaciones.FirstOrDefault(uu => uu.ubicacion_Id == id_ubicacion);

                u.ubicacion_categoria = ddl_categoria.SelectedItem.Text;
                u.ubicacion_nombre_lugar = tb_nombre_lugar.Value;
                u.ubicacion_descripcion = tb_descripcion.Value;
                u.ubicacion_direccion = tb_direccion.Value;
                u.ubicacion_latitud = tb_latitud.Value;
                u.ubicacion_longitud = tb_longitud.Value;
                u.ubicacion_face = tb_facebook.Value;
                u.ubicacion_mail = tb_email.Value;
                u.ubicacion_telefono = tb_telefono.Value;
                u.ubicacion_web = tb_pagina.Value;
                u.ubicacion_twitter = tb_twitter.Value;

                cxt.SaveChanges();
            }

            ListarUbicaciones();
        }

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {
            using (var cxt = new seminarioDBContainer())
            {
                int id_ubicacion = 0;
                int.TryParse(tb_ID.Value, out id_ubicacion);
                Ubicacion u = cxt.Ubicaciones.FirstOrDefault(uu => uu.ubicacion_Id == id_ubicacion);

                cxt.Ubicaciones.Remove(u);
                cxt.SaveChanges();
            }

            ListarUbicaciones();
        }

        protected void agregar_nueva_ubicacion_Click(object sender, EventArgs e)
        {
            Limpiar();
            MostrarPopUpDatosInstituto();
        }
    }
}