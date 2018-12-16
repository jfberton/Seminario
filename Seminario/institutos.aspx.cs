using Seminario.Aplicativo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Seminario
{
    public partial class institutos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCombos();
                LimpiarCombos(false, false, false, false, false, false);
                MostrarPuntos();
            }
        }

        private void CargarCombos()
        {
            using (var cxt = new seminarioDBContainer())
            {
                #region Localidades

                tb_select_filtro_localidad.Items.Clear();
                tb_select_filtro_localidad.Items.Add(new ListItem("Seleccionar:", "Seleccionar"));
                List<Localidad> localidades = cxt.Localidades.ToList();
                foreach (Localidad localidad in localidades)
                {
                    ListItem f = new ListItem(localidad.localidad_nombre, localidad.localidad_id.ToString());
                    tb_select_filtro_localidad.Items.Add(f);
                }

                #endregion

                #region Regiones Educativas

                tb_select_filtro_regiones.Items.Clear();
                tb_select_filtro_regiones.Items.Add(new ListItem("Seleccionar:", "Seleccionar"));
                List<Region_Educativa> regiones = cxt.Regiones_Educativas.ToList();
                foreach (Region_Educativa region in regiones)
                {
                    ListItem f = new ListItem(region.region_educativa_nombre, region.region_educativa_id.ToString());
                    tb_select_filtro_regiones.Items.Add(f);
                }

                #endregion

                #region Modalidad

                tb_select_filtro_modalidad.Items.Clear();
                tb_select_filtro_modalidad.Items.Add(new ListItem("Seleccionar:", "Seleccionar"));
                List<Modalidad> modalidades = cxt.Modalidades.ToList();
                foreach (Modalidad item in modalidades)
                {
                    ListItem f = new ListItem(item.modalidad_nombre, item.modalidad_nombre);
                    tb_select_filtro_modalidad.Items.Add(f);
                }

                #endregion

                #region Orientaciones

                tb_select_filtro_orientaciones.Items.Clear();
                tb_select_filtro_orientaciones.Items.Add(new ListItem("Seleccionar:", "Seleccionar"));
                List<Orientacion> orientaciones = cxt.Orientaciones.ToList();
                foreach (Orientacion item in orientaciones)
                {
                    ListItem f = new ListItem(item.orientacion_nombre, item.orientacion_nombre);
                    tb_select_filtro_orientaciones.Items.Add(f);
                }

                #endregion

                #region Sectores

                tb_select_filtro_sector.Items.Clear();
                tb_select_filtro_sector.Items.Add(new ListItem("Seleccionar:", "Seleccionar"));
                List<Sector> sectores = cxt.Sectores.ToList();
                foreach (Sector item in sectores)
                {
                    ListItem f = new ListItem(item.sector_nombre, item.sector_nombre);
                    tb_select_filtro_sector.Items.Add(f);
                }

                #endregion

                #region Ambito

                tb_select_filtro_ambito.Items.Clear();
                tb_select_filtro_ambito.Items.Add(new ListItem("Seleccionar:", "Seleccionar"));
                List<Ambito> ambitos = cxt.Ambitos.ToList();
                foreach (Ambito item in ambitos)
                {
                    ListItem f = new ListItem(item.ambito_nombre, item.ambito_nombre);
                    tb_select_filtro_ambito.Items.Add(f);
                }

                #endregion

            }
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

            MostrarPuntos();

            LimpiarCombos(region_id != 0, ambito != "Seleccionar", sector != "Seleccionar", localidad_id != 0, modalidad != "Seleccionar", orientacion != "Seleccionar");
        }

        private void MostrarPuntos()
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

                var ubicaciones = (from uu in establecimientos_grilla
                                   select new
                                   {
                                       ubicacion_id = uu.id,
                                       ubicacion_latitud = uu.latitud,
                                       ubicacion_longitud = uu.longitud,
                                       ubicacion_nombre = uu.nombre,
                                       ubicacion_direccion = uu.direccion,
                                       ubicacion_descripcion = "Región: " + uu.region + " - Modalidad: " + uu.modalidad + " - Sector: " + uu.sector,
                                       ubicacion_telefono = uu.telefono,
                                       ubicacion_mail = uu.mail,
                                       ubicacion_web = uu.web
                                   }).ToList();

                repetidor.DataSource = ubicaciones;
                repetidor.DataBind();
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
    }
}