using System;
using System.Collections.Generic;
using System.Linq;
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
                MostrarPuntos();
            }
        }

        private void MostrarPuntos()
        {
            using (var cxt = new Aplicativo.seminarioDBContainer())
            {
                var ubicaciones = (from uu in cxt.Ubicaciones
                                   where uu.ubicacion_categoria == ddl_categoria.SelectedItem.Text || ddl_categoria.SelectedItem.Text == "Todos"
                                   select new
                                   {
                                       ubicacion_id = uu.ubicacion_Id,
                                       ubicacion_latitud = uu.ubicacion_latitud,
                                       ubicacion_categoria = uu.ubicacion_categoria,
                                       ubicacion_longitud = uu.ubicacion_longitud,
                                       ubicacion_nombre = uu.ubicacion_nombre_lugar,
                                       ubicacion_direccion = uu.ubicacion_direccion,
                                       ubicacion_descripcion = uu.ubicacion_descripcion,
                                       ubicacion_telefono = uu.ubicacion_telefono,
                                       ubicacion_mail = uu.ubicacion_mail,
                                       ubicacion_web = uu.ubicacion_web
                                   }).ToList();

                repetidor.DataSource = ubicaciones;
                repetidor.DataBind();
            }
        }

        protected void ddl_categoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            MostrarPuntos();
        }
    }
}