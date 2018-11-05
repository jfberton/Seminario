using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Seminario
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login_ServerClick(object sender, EventArgs e)
        {
            using (var cxt = new Aplicativo.seminarioDBContainer())
            {
                Aplicativo.Usuario u = cxt.Usuarios.FirstOrDefault(uu => uu.usuario_usuario == tb_usuario.Value && uu.usuario_clave == tb_clave.Value);
                if (u != null)
                {
                    Session["UsuarioLogueado"] = u;
                    FormsAuthentication.RedirectFromLoginPage(u.usuario_nombre_apellido, false);
                }
            }
        }
    }
}