using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Seminario.Aplicativo
{
    public partial class mapa_guardarpuntos : System.Web.UI.Page
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
                                       lugar = uu.ubicacion_lugar,
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
                ub.ubicacion_lugar = tb_nombre_lugar.Value;
                ub.ubicacion_direccion = tb_direccion.Value;
                ub.ubicacion_latitud = tb_latitud.Value;
                ub.ubicacion_longitud = tb_longitud.Value;

                cxt.Ubicaciones.Add(ub);
                cxt.SaveChanges();
            }

            ListarUbicaciones();
        }

        protected void SeleccionarRegistro(object sender, GridViewCommandEventArgs e)
        {
            int fila = int.Parse(e.CommandArgument.ToString());

            tb_ID.Value = gv_ubicaciones.Rows[fila].Cells[0].Text;
            tb_nombre_lugar.Value = gv_ubicaciones.Rows[fila].Cells[1].Text;
            tb_direccion.Value = gv_ubicaciones.Rows[fila].Cells[2].Text;
            tb_latitud.Value = gv_ubicaciones.Rows[fila].Cells[3].Text;
            tb_longitud.Value = gv_ubicaciones.Rows[fila].Cells[4].Text;

            btn_agregar.Enabled = false;
            btn_eliminar.Enabled = true;
            btn_modificar.Enabled = true;
            btn_limpiar.Enabled = true;
        }

        protected void btn_limpiar_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

        private void Limpiar()
        {
            tb_ID.Value = "";
            tb_longitud.Value = "0";
            tb_latitud.Value = "0";
            tb_nombre_lugar.Value = "";
            tb_direccion.Value = "";

            btn_agregar.Enabled = true;
            btn_eliminar.Enabled = false;
            btn_modificar.Enabled = false;
            btn_limpiar.Enabled = false;
        }

        protected void btn_modificar_Click(object sender, EventArgs e)
        {
            using (var cxt = new seminarioDBContainer())
            {
                int id_ubicacion = 0;
                int.TryParse(tb_ID.Value, out id_ubicacion);
                Ubicacion u = cxt.Ubicaciones.FirstOrDefault(uu => uu.ubicacion_Id == id_ubicacion);

                u.ubicacion_lugar = tb_nombre_lugar.Value;
                u.ubicacion_direccion = tb_direccion.Value;
                u.ubicacion_latitud = tb_latitud.Value;
                u.ubicacion_longitud = tb_longitud.Value;

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
    }
}