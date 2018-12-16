using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
                CargarCombos();
                Limpiar();
                ListarEstablecimientos();
            }
        }

        private void CargarCombos()
        {
            using (var cxt = new seminarioDBContainer())
            {
                #region Localidades

                tb_select_localidad.Items.Clear();
                tb_select_filtro_localidad.Items.Clear();
                tb_select_filtro_localidad.Items.Add(new ListItem("Seleccionar:", "Seleccionar"));
                List<Localidad> localidades = cxt.Localidades.ToList();
                foreach (Localidad localidad in localidades)
                {
                    ListItem l = new ListItem(localidad.localidad_nombre, localidad.localidad_id.ToString());
                    ListItem f = new ListItem(localidad.localidad_nombre, localidad.localidad_id.ToString());

                    l.Selected = false;
                    f.Selected = false;

                    tb_select_localidad.Items.Add(l);
                    tb_select_filtro_localidad.Items.Add(f);
                }

                #endregion

                #region Regiones Educativas

                tb_select_regiones.Items.Clear();
                tb_select_filtro_regiones.Items.Clear();
                tb_select_filtro_regiones.Items.Add(new ListItem("Seleccionar:", "Seleccionar"));
                List<Region_Educativa> regiones = cxt.Regiones_Educativas.ToList();
                foreach (Region_Educativa region in regiones)
                {
                    ListItem r = new ListItem(region.region_educativa_nombre, region.region_educativa_id.ToString());
                    ListItem f = new ListItem(region.region_educativa_nombre, region.region_educativa_id.ToString());

                    r.Selected = false;
                    f.Selected = false;

                    tb_select_regiones.Items.Add(r);
                    tb_select_filtro_regiones.Items.Add(f);
                }

                #endregion

                #region Modalidad

                tb_select_modalidad.Items.Clear();
                tb_select_filtro_modalidad.Items.Clear();
                tb_select_filtro_modalidad.Items.Add(new ListItem("Seleccionar:", "Seleccionar"));
                List<Modalidad> modalidades = cxt.Modalidades.ToList();
                foreach (Modalidad item in modalidades)
                {
                    ListItem i = new ListItem(item.modalidad_nombre, item.modalidad_nombre);
                    ListItem f = new ListItem(item.modalidad_nombre, item.modalidad_nombre);

                    i.Selected = false;
                    f.Selected = false;

                    tb_select_modalidad.Items.Add(i);
                    tb_select_filtro_modalidad.Items.Add(f);
                }

                #endregion

                #region Orientaciones

                tb_select_orientaciones.Items.Clear();
                tb_select_filtro_orientaciones.Items.Clear();
                tb_select_filtro_orientaciones.Items.Add(new ListItem("Seleccionar:", "Seleccionar"));
                List<Orientacion> orientaciones = cxt.Orientaciones.ToList();
                foreach (Orientacion item in orientaciones)
                {
                    ListItem i = new ListItem(item.orientacion_nombre, item.orientacion_nombre);
                    ListItem f = new ListItem(item.orientacion_nombre, item.orientacion_nombre);

                    i.Selected = false;
                    f.Selected = false;

                    tb_select_orientaciones.Items.Add(i);
                    tb_select_filtro_orientaciones.Items.Add(f);
                }

                #endregion

                #region Sectores

                tb_select_sector.Items.Clear();
                tb_select_filtro_sector.Items.Clear();
                tb_select_filtro_sector.Items.Add(new ListItem("Seleccionar:", "Seleccionar"));
                List<Sector> sectores = cxt.Sectores.ToList();
                foreach (Sector item in sectores)
                {
                    ListItem i = new ListItem(item.sector_nombre, item.sector_nombre);
                    ListItem f = new ListItem(item.sector_nombre, item.sector_nombre);

                    i.Selected = false;
                    f.Selected = false;

                    tb_select_sector.Items.Add(i);
                    tb_select_filtro_sector.Items.Add(f);
                }

                #endregion

                #region Ambito

                tb_select_ambito.Items.Clear();
                tb_select_filtro_ambito.Items.Clear();
                tb_select_filtro_ambito.Items.Add(new ListItem("Seleccionar:", "Seleccionar"));
                List<Ambito> ambitos = cxt.Ambitos.ToList();
                foreach (Ambito item in ambitos)
                {
                    ListItem i = new ListItem(item.ambito_nombre, item.ambito_nombre);
                    ListItem f = new ListItem(item.ambito_nombre, item.ambito_nombre);

                    i.Selected = false;
                    f.Selected = false;

                    tb_select_ambito.Items.Add(i);
                    tb_select_filtro_ambito.Items.Add(f);
                }

                #endregion

            }
        }

        private void ListarEstablecimientos()
        {
            using (var cxt = new seminarioDBContainer())
            {
                int region_id = 0;
                int.TryParse(tb_select_filtro_regiones.Value, out region_id);

                int localidad_id = 0;
                int.TryParse(tb_select_filtro_localidad.Value, out localidad_id);

                string ambito = tb_select_filtro_ambito.Value;

                string sector = tb_select_filtro_sector.Value;

                string modalidad = tb_select_filtro_modalidad.Value;

                string orientacion = string.Empty;

                foreach (ListItem item in tb_select_filtro_orientaciones.Items)
                {
                    if (item.Selected)
                    {
                        orientacion = orientacion == string.Empty ? item.Value : ";" + item.Value;
                    }
                }

                var establecimientos = (from ee in cxt.Establecimientos
                                        where
                                        (region_id == 0 || ee.region_educativa_id == region_id)
                                        && (localidad_id == 0 || ee.localidad_id == localidad_id)
                                        && (ambito == "Seleccionar" || ee.establecimiento_ambito == ambito)
                                        && (sector == "Seleccionar" || ee.establecimiento_sector == sector)
                                        && (modalidad == "Seleccionar" || ee.establecimiento_modalidad == modalidad)
                                        select new
                                        {
                                            id = ee.establecimiento_id,
                                            region = ee.Region_Educativa,
                                            ambito = ee.establecimiento_ambito,
                                            nivel = ee.establecimiento_modalidad,
                                            nombre = ee.establecimiento_nombre,
                                            sector = ee.establecimiento_sector,
                                            localidad = ee.Localidad,
                                            latitud = ee.establecimiento_latitud,
                                            longitud = ee.establecimiento_longitud,
                                            direccion = ee.establecimiento_direccion,
                                            modalidad = ee.establecimiento_modalidad,
                                            orientaciones = ee.establecimiento_orientaciones,
                                            telefono = ee.establecimiento_telefono,
                                            mail = ee.establecimiento_mail,
                                            web = ee.establecimiento_web
                                        }).ToList();



                var establecimientos_grilla = (from ee in establecimientos
                                               where Verificar_Orientaciones(ee.orientaciones)
                                               && Contiene(ee.nombre, tb_filtro_nombre_lugar.Value)
                                               select new
                                               {
                                                   id = ee.id,
                                                   region = ee.region.region_educativa_nombre,
                                                   ambito = ee.ambito,
                                                   nombre = ee.nombre,
                                                   nivel = ee.nivel,
                                                   sector = ee.sector,
                                                   localidad = ee.localidad.localidad_nombre,
                                                   latitud = ee.latitud,
                                                   longitud = ee.longitud,
                                                   direccion = ee.direccion,
                                                   modalidad = ee.modalidad,
                                                   orientaciones = ee.orientaciones,
                                                   telefono = ee.telefono,
                                                   mail = ee.mail,
                                                   web = ee.web
                                               }).ToList();

                gv_ubicaciones.DataSource = establecimientos_grilla;
                gv_ubicaciones.DataBind();

            }
        }

        private bool Verificar_Orientaciones(string orientaciones)
        {
            bool ret = false;

            string[] orientaciones_establecimiento = orientaciones.Split(';');

            if (tb_select_filtro_orientaciones.Value == "")
            {
                ret = true;
            }
            else
            {
                foreach (ListItem orientacion_buscada in tb_select_filtro_orientaciones.Items)
                {
                    if (orientacion_buscada.Selected)
                    {
                        foreach (string orientacion_establecimiento in orientaciones_establecimiento)
                        {
                            if (orientacion_buscada.Value == orientacion_establecimiento)
                            {
                                ret = true;
                            }
                        }
                    }
                }
            }

            if (tb_filtro_otras_orientaciones.Value != "")
            {
                foreach (string orientacion_establecimiento in orientaciones_establecimiento)
                {
                    if (orientacion_establecimiento.Substring(0, 1) == "_")
                    {
                        if (Contiene(orientacion_establecimiento, tb_filtro_otras_orientaciones.Value))
                        {
                            ret = true;
                        }
                    }
                }
            }

            return ret;
        }

        private string Normalizar(string textoOriginal)
        {
            string textoNormalizado = textoOriginal.Normalize(NormalizationForm.FormD);
            //coincide todo lo que no sean letras y números ascii o espacio
            //y lo reemplazamos por una cadena vacía.
            Regex reg = new Regex("[^a-zA-Z0-9 ]");
            string textoSinAcentos = reg.Replace(textoNormalizado, "");

            return textoSinAcentos;
        }

        private bool Contiene(string valorOriginal, string valorBuscado)
        {
            bool ret = false;

            string valorOriginalNormalizado = Normalizar(valorOriginal).ToLower();
            string valorBuscadoNormalizado = Normalizar(valorBuscado).ToLower();

            ret = valorOriginalNormalizado.Contains(valorBuscadoNormalizado);

            return ret;
        }

        protected void SeleccionarRegistro(object sender, GridViewCommandEventArgs e)
        {
            Limpiar();
            int fila = int.Parse(e.CommandArgument.ToString());

            int establecimiento_id = 0;

            if (int.TryParse(gv_ubicaciones.Rows[fila].Cells[0].Text, out establecimiento_id))
            {
                using (var cxt = new seminarioDBContainer())
                {
                    Establecimiento establecimiento = cxt.Establecimientos.FirstOrDefault(uu => uu.establecimiento_id == establecimiento_id);

                    tb_direccion.Value = establecimiento.establecimiento_direccion;
                    tb_email.Value = establecimiento.establecimiento_mail;
                    tb_ID.Value = establecimiento.establecimiento_id.ToString();
                    tb_latitud.Value = establecimiento.establecimiento_latitud;
                    tb_longitud.Value = establecimiento.establecimiento_longitud;
                    tb_nombre_lugar.Value = establecimiento.establecimiento_nombre;

                    string[] orientaciones = establecimiento.establecimiento_orientaciones.Split(';');

                    foreach (ListItem item in tb_select_orientaciones.Items)
                    {
                        item.Selected = false;
                    }

                    foreach (string item_orientacion in orientaciones)
                    {
                        if (!item_orientacion.Contains('_'))
                        {
                            tb_select_orientaciones.Items.FindByValue(item_orientacion).Selected = true;
                        }
                        else
                        {
                            tb_otras_orientaciones.Value = item_orientacion.Substring(1);
                        }
                    }

                    foreach (ListItem item in tb_select_ambito.Items)
                    {
                        item.Selected = false;
                    }
                    tb_select_ambito.Items.FindByValue(establecimiento.establecimiento_ambito).Selected = true;

                    foreach (ListItem item in tb_select_localidad.Items)
                    {
                        item.Selected = false;
                    }
                    tb_select_localidad.Items.FindByValue(establecimiento.localidad_id.ToString()).Selected = true;

                    foreach (ListItem item in tb_select_modalidad.Items)
                    {
                        item.Selected = false;
                    }
                    tb_select_modalidad.Items.FindByValue(establecimiento.establecimiento_modalidad).Selected = true;

                    foreach (ListItem item in tb_select_regiones.Items)
                    {
                        item.Selected = false;
                    }
                    tb_select_regiones.Items.FindByValue(establecimiento.region_educativa_id.ToString()).Selected = true;

                    foreach (ListItem item in tb_select_sector.Items)
                    {
                        item.Selected = false;
                    }
                    tb_select_sector.Items.FindByValue(establecimiento.establecimiento_sector).Selected = true;

                    tb_telefono.Value = establecimiento.establecimiento_telefono;


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

            LimpiarCombos(false, false, false, false, false, false);
        }

        private void LimpiarCombos(bool muestra_filtro_region, bool muestra_filtro_ambito, bool muestra_filtro_sector, bool muestra_filtro_localidad, bool muestra_filtro_modalidad, bool muestra_filtro_orientaciones)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("<script language=\"javascript\"  type=\"text/javascript\">");

            if (!muestra_filtro_ambito)
            {
                sb.AppendLine("$(\'#" + tb_select_filtro_ambito.ClientID + "\').prop(\"selectedIndex\", -1);");
            }

            if (!muestra_filtro_localidad)
            {
                sb.AppendLine("$(\'#" + tb_select_filtro_localidad.ClientID + "\').prop(\"selectedIndex\", -1);");
            }

            if (!muestra_filtro_modalidad)
            {
                sb.AppendLine("$(\'#" + tb_select_filtro_modalidad.ClientID + "\').prop(\"selectedIndex\", -1);");
            }

            if (!muestra_filtro_orientaciones)
            {
                sb.AppendLine("$(\'#" + tb_select_filtro_orientaciones.ClientID + "\').prop(\"selectedIndex\", -1);");
            }

            if (!muestra_filtro_region)
            {
                sb.AppendLine("$(\'#" + tb_select_filtro_regiones.ClientID + "\').prop(\"selectedIndex\", -1);");
            }

            if (!muestra_filtro_sector)
            {
                sb.AppendLine("$(\'#" + tb_select_filtro_sector.ClientID + "\').prop(\"selectedIndex\", -1);");
            }

            sb.AppendLine(" </script>");

            ScriptManager.RegisterStartupScript(Page, this.GetType(), "LimpiaCombosFiltro", sb.ToString(), false);
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
            using (var cxt = new seminarioDBContainer())
            {
                Establecimiento es = new Establecimiento();
                es.establecimiento_nombre = tb_nombre_lugar.Value;
                es.establecimiento_ambito = tb_select_ambito.Value;
                es.establecimiento_modalidad = tb_select_modalidad.Value;
                es.establecimiento_sector = tb_select_sector.Value;
                es.establecimiento_direccion = tb_direccion.Value;
                es.establecimiento_telefono = tb_telefono.Value;
                es.establecimiento_mail = tb_email.Value;
                es.establecimiento_web = "";
                es.establecimiento_latitud = tb_latitud.Value;
                es.establecimiento_longitud = tb_longitud.Value;

                #region Localidad

                int localidad_id = Convert.ToInt32(tb_select_localidad.Value);
                es.localidad_id = localidad_id;

                #endregion

                #region Region educativa

                int region_educativa_id = Convert.ToInt32(tb_select_regiones.Value);
                es.region_educativa_id = region_educativa_id;

                #endregion

                #region Orientaciones

                es.establecimiento_orientaciones = "";

                foreach (ListItem item in tb_select_orientaciones.Items)
                {
                    if (item.Selected)
                    {
                        es.establecimiento_orientaciones = es.establecimiento_orientaciones.Count() == 0 ? item.Value : es.establecimiento_orientaciones + ";" + item.Value;
                    }
                }

                if (tb_otras_orientaciones.Value.Count() > 0)
                {
                    es.establecimiento_orientaciones = es.establecimiento_orientaciones.Count() == 0 ? "_" + tb_otras_orientaciones.Value.Replace(";", ",") : es.establecimiento_orientaciones + ";_" + tb_otras_orientaciones.Value.Replace(";", ",");
                }

                #endregion

                cxt.Establecimientos.Add(es);
                cxt.SaveChanges();
            }
            Limpiar();
            ListarEstablecimientos();
        }

        protected void btn_modificar_Click(object sender, EventArgs e)
        {
            using (var cxt = new seminarioDBContainer())
            {
                int establecimiento_id = 0;
                if (int.TryParse(tb_ID.Value, out establecimiento_id))
                {
                    Establecimiento es = cxt.Establecimientos.FirstOrDefault(ee => ee.establecimiento_id == establecimiento_id);
                    es.establecimiento_nombre = tb_nombre_lugar.Value;
                    es.establecimiento_ambito = tb_select_ambito.Value;
                    es.establecimiento_modalidad = tb_select_modalidad.Value;
                    es.establecimiento_sector = tb_select_sector.Value;
                    es.establecimiento_direccion = tb_direccion.Value;
                    es.establecimiento_telefono = tb_telefono.Value;
                    es.establecimiento_mail = tb_email.Value;
                    es.establecimiento_web = "";
                    es.establecimiento_latitud = tb_latitud.Value;
                    es.establecimiento_longitud = tb_longitud.Value;

                    #region Localidad

                    int localidad_id = Convert.ToInt32(tb_select_localidad.Value);
                    es.localidad_id = localidad_id;

                    #endregion

                    #region Region educativa

                    int region_educativa_id = Convert.ToInt32(tb_select_regiones.Value);
                    es.region_educativa_id = region_educativa_id;

                    #endregion

                    #region Orientaciones

                    es.establecimiento_orientaciones = "";

                    foreach (ListItem item in tb_select_orientaciones.Items)
                    {
                        if (item.Selected)
                        {
                            es.establecimiento_orientaciones = es.establecimiento_orientaciones.Count() == 0 ? item.Value : es.establecimiento_orientaciones + ";" + item.Value;
                        }
                    }

                    if (tb_otras_orientaciones.Value.Count() > 0)
                    {
                        es.establecimiento_orientaciones = es.establecimiento_orientaciones.Count() == 0 ? "_" + tb_otras_orientaciones.Value.Replace(";", ",") : es.establecimiento_orientaciones + ";_" + tb_otras_orientaciones.Value.Replace(";", ",");
                    }

                    #endregion

                    cxt.SaveChanges();
                }


            }
            Limpiar();
            ListarEstablecimientos();
        }

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {
            using (var cxt = new seminarioDBContainer())
            {
                int establecimiento_id = 0;
                if (int.TryParse(tb_ID.Value, out establecimiento_id))
                {
                    Establecimiento ee = cxt.Establecimientos.FirstOrDefault(uu => uu.establecimiento_id == establecimiento_id);

                    cxt.Establecimientos.Remove(ee);
                    cxt.SaveChanges();
                }
            }
            Limpiar();
            ListarEstablecimientos();
        }


        protected void btn_filtrar_establecimientos_Click(object sender, EventArgs e)
        {
            int region_id = 0;
            int.TryParse(tb_select_filtro_regiones.Value, out region_id);

            int localidad_id = 0;
            int.TryParse(tb_select_filtro_localidad.Value, out localidad_id);

            string ambito = tb_select_filtro_ambito.Value;

            string sector = tb_select_filtro_sector.Value;

            string modalidad = tb_select_filtro_modalidad.Value;

            string orientacion = string.Empty;

            foreach (ListItem item in tb_select_filtro_orientaciones.Items)
            {
                if (item.Selected)
                {
                    orientacion = orientacion == string.Empty ? item.Value : ";" + item.Value;
                }
            }

            ListarEstablecimientos();

            LimpiarCombos(region_id != 0, ambito != "Seleccionar", sector != "Seleccionar", localidad_id != 0, modalidad != "Seleccionar", orientacion != "Seleccionar");
        }
    }
}