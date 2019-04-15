using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Seminario.Aplicativo
{
    public partial class aplicativo_admin_regiones_educativas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarComboLocalidades();
                ListarRegiones();
            }
        }

        private void CargarComboLocalidades()
        {
            using (var cxt = new seminarioDBContainer())
            {
                tb_select_localidades.Items.Clear();

                List<Localidad> localidades = cxt.Localidades.ToList();
                foreach (Localidad localidad in localidades)
                {
                    ListItem l = new ListItem(localidad.localidad_nombre, localidad.localidad_id.ToString());
                    tb_select_localidades.Items.Add(l);
                }
            }
            Limpiar();
        }

        private void ListarRegiones()
        {
            using (var cxt = new seminarioDBContainer())
            {
                var regiones_educativas = (from re in cxt.Regiones_Educativas
                                           select new
                                           {
                                               id = re.region_educativa_id,
                                               nombre = re.region_educativa_nombre,
                                               industria = re.region_educativa_industria,
                                               produccion = re.region_educativa_produccion

                                           }).ToList();

                gv_regiones_educativas.DataSource = regiones_educativas;
                gv_regiones_educativas.DataBind();
            }

            Limpiar();
        }

        protected void btn_agregar_Click(object sender, EventArgs e)
        {
            using (var cxt = new seminarioDBContainer())
            {
                Region_Educativa re = new Region_Educativa();
                re.region_educativa_nombre = tb_re_nombre.Value;
                re.region_educativa_produccion = tb_re_produccion.Value;
                re.region_educativa_industria = tb_re_industrias.Value;

                foreach (ListItem item in tb_select_localidades.Items)
                {
                    if (item.Selected)
                    {
                        int localidad_id = Convert.ToInt32(item.Value);
                        Localidad loca = cxt.Localidades.FirstOrDefault(ll => ll.localidad_id == localidad_id);
                        re.Localidades.Add(loca);
                    }
                }

                cxt.Regiones_Educativas.Add(re);
                cxt.SaveChanges();
            }

            ListarRegiones();
        }


        private void MostrarPopUpDatosUsuario()
        {
            string script = "<script language=\"javascript\"  type=\"text/javascript\">$(document).ready(function() { $('#modal_datos_region_educativa').modal('show')});</script>";
            ScriptManager.RegisterStartupScript(Page, this.GetType(), "ShowPopUp", script, false);
        }

        protected void SeleccionarRegistro(object sender, GridViewCommandEventArgs e)
        {
            int fila = int.Parse(e.CommandArgument.ToString());

            int id_re = 0;
            Limpiar();

            if (int.TryParse(gv_regiones_educativas.Rows[fila].Cells[0].Text, out id_re))
            {
                using (var cxt = new seminarioDBContainer())
                {
                    Region_Educativa re = cxt.Regiones_Educativas.FirstOrDefault(uu => uu.region_educativa_id == id_re);

                    tb_ID.Value = re.region_educativa_id.ToString();
                    tb_re_nombre.Value = re.region_educativa_nombre;
                    tb_re_industrias.Value = re.region_educativa_industria;
                    tb_re_produccion.Value = re.region_educativa_produccion;

                    foreach (Localidad loca in re.Localidades)
                    {
                        tb_select_localidades.Items.FindByValue(loca.localidad_id.ToString()).Selected = true;
                    }

                    btn_agregar.Enabled = false;
                    btn_eliminar.Enabled = true;
                    btn_modificar.Enabled = true;

                    MostrarPopUpDatosUsuario();
                }
            }


        }

        private void Limpiar()
        {
            tb_ID.Value = "";
            tb_re_nombre.Value = "";
            tb_re_industrias.Value = "";
            tb_re_produccion.Value = "";
            tb_select_localidades.SelectedIndex = 0;
            
            btn_agregar.Enabled = true;
            btn_eliminar.Enabled = false;
            btn_modificar.Enabled = false;

            foreach (ListItem localidad in tb_select_localidades.Items)
            {
                localidad.Selected = false;
            }
        }

        protected void btn_modificar_Click(object sender, EventArgs e)
        {
            using (var cxt = new seminarioDBContainer())
            {
                int id_re = 0;
                int.TryParse(tb_ID.Value, out id_re);
                Region_Educativa re = cxt.Regiones_Educativas.FirstOrDefault(uu => uu.region_educativa_id == id_re);

                re.region_educativa_nombre = tb_re_nombre.Value;
                re.region_educativa_produccion = tb_re_produccion.Value;
                re.region_educativa_industria = tb_re_industrias.Value;
                re.Localidades.Clear();
                foreach (ListItem item in tb_select_localidades.Items)
                {
                    if (item.Selected)
                    {
                        int localidad_id = Convert.ToInt32(item.Value);
                        Localidad loca = cxt.Localidades.FirstOrDefault(ll => ll.localidad_id == localidad_id);
                        re.Localidades.Add(loca);
                    }
                }

                cxt.SaveChanges();
            }

            ListarRegiones();
        }

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {
            using (var cxt = new seminarioDBContainer())
            {
                int id_re = 0;
                int.TryParse(tb_ID.Value, out id_re);
                Region_Educativa u = cxt.Regiones_Educativas.FirstOrDefault(uu => uu.region_educativa_id == id_re);

                u.Localidades.Clear();
                cxt.SaveChanges();

                cxt.Regiones_Educativas.Remove(u);
                cxt.SaveChanges();
            }

            ListarRegiones();
        }

        protected void agregar_nuevo_usuario_Click(object sender, EventArgs e)
        {
            Limpiar();
            MostrarPopUpDatosUsuario();
        }
    }
}