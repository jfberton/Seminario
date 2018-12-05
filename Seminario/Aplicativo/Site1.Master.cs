using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Seminario.Aplicativo
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Aplicativo.Usuario u = Session["UsuarioLogueado"] as Aplicativo.Usuario;
                if (u != null)
                {
                    lbl_usuario_logueado.Text = u.usuario_nombre_apellido;
                    lbl_iniciar_cerrar_sesion.Text = "Cerrar sesión";
                    btn_seminario_universitario.InnerText = "Seminario Univ.";
                    if (u.usuario_perfil != "Administrador")
                    {
                        div_admin.Visible = false;
                    }
                }
                else
                {
                    lbl_usuario_logueado.Text = "Invitado";
                    lbl_iniciar_cerrar_sesion.Text = "Iniciar sesión";
                    div_admin.Visible = false;
                    div_secuenciador.Visible = false;
                    btn_seminario_universitario.InnerText = "Seminario Universitario";
                }
            }
        }

        protected void btn_inicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/index.aspx");
        }

        protected void btn_porque_elegirnos_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/porque_elegirnos.aspx");
        }

        protected void btn_nuestras_carreras_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/nuestras_carreras.aspx");
        }

        protected void btn_seminario_universitario_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("~/seminario_universitario.aspx");
        }

        protected void btn_nuestra_propuesta_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/nuestra_propuesta.aspx");
        }

        protected void btn_modulos_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/modulos.aspx");
        }

        protected void btn_modalidades_de_cursado_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/modalidades_de_cursado.aspx");
        }

        protected void btn_examen_de_admision_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/examen_de_admision.aspx");
        }

        protected void btn_turnos_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/turnos.aspx");
        }

        protected void btn_inscripcion_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/inscripcion.aspx");
        }

        protected void btn_articulacion_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/articulacion.aspx");
        }

        protected void btn_institutos_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/institutos.aspx");
        }

        protected void btn_ver_institutos_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/institutos.aspx");
        }

        protected void btn_editar_unbicaciones_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Aplicativo/aplicativo_ubicacion_instituciones.aspx");
        }

        protected void btn_secuenciador_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Aplicativo/aplicativo_secuenciador_listado.aspx");
        }

        protected void lbl_iniciar_cerrar_sesion_Click(object sender, EventArgs e)
        {
            Aplicativo.Usuario u = Session["UsuarioLogueado"] as Aplicativo.Usuario;
            if (u != null)
            {
                FormsAuthentication.SignOut();
                Session["UsuarioLogueado"] = null;
                Response.Redirect("~/index.aspx");
            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
        }

        protected void btn_usuarios_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Aplicativo/aplicativo_admin_usuarios.aspx");
        }

        protected void btn_regiones_educativas_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Aplicativo/aplicativo_admin_regiones_educativas.aspx");
        }
    }
}