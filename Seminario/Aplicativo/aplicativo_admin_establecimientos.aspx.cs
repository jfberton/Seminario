using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Seminario.Aplicativo
{
    public partial class aplicativo_admin_establecimientos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListarEstablecimientos();
            }
        }

        private void ListarEstablecimientos()
        {
            using (var cxt = new seminarioDBContainer())
            {
                var establecimientos = (from ee in cxt.Establecimientos
                                   select new
                                   {
                                       id = ee.establecimiento_id,
                                       region = ee.Region_Educativa,
                                       nombre = ee.establecimiento_nombre,
                                       modalidad = ee.establecimiento_modalidad,
                                       sector = ee.establecimiento_sector,
                                       localidad = ee.Localidad

                                   }).ToList();

                var establecimientos_grilla = (from ee in establecimientos
                                               select new
                                               {
                                                   id = ee.id,
                                                   region = ee.region.region_educativa_nombre,
                                                   nombre = ee.nombre,
                                                   modalidad = ee.modalidad,
                                                   sector = ee.sector,
                                                   localidad = ee.localidad.localidad_nombre
                                               }).ToList();

                gv_ubicaciones.DataSource = establecimientos_grilla;
                gv_ubicaciones.DataBind();
            }

            Limpiar();
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
            tb_email.Value = "";
            tb_telefono.Value = "";

            btn_agregar.Enabled = true;
            btn_eliminar.Enabled = false;
            btn_modificar.Enabled = false;
        }

        protected void agregar_establecimiento_Click(object sender, EventArgs e)
        {
            Limpiar();
            MostrarPopUpDatosInstituto();
        }

        private void MostrarPopUpDatosInstituto()
        {
            string script = "<script language=\"javascript\"  type=\"text/javascript\">$(document).ready(function() { $('#modal_datos_instituto').modal('show')});</script>";
            ScriptManager.RegisterStartupScript(Page, this.GetType(), "ShowPopUp", script, false);
        }

        protected void btn_agregar_Click(object sender, EventArgs e)
        {

        }

        protected void btn_modificar_Click(object sender, EventArgs e)
        {

        }

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {

        }
    }
}