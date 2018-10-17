using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Seminario.Aplicativo
{
    public partial class mapa_mostrar_ubicaciones : System.Web.UI.Page
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
            using (var cxt = new seminarioDBContainer())
            {
                var ubicaciones = (from uu in cxt.Ubicaciones
                                   select new
                                   {
                                       ubicacion_id = uu.ubicacion_Id,
                                       ubicacion_latitud = uu.ubicacion_latitud,
                                       ubicacion_longitud = uu.ubicacion_longitud,
                                       ubicacion_lugar = uu.ubicacion_lugar,
                                       ubicacion_direccion = uu.ubicacion_direccion
                                   }).ToList();

                repetidor.DataSource = ubicaciones;
                repetidor.DataBind();
            }
        }
    }
}