using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Seminario.Aplicativo
{
    public partial class aplicativo_admin_usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListarUsuarios();
            }
        }

        private void ListarUsuarios()
        {
            using (var cxt = new seminarioDBContainer())
            {
                var usuarios = (from uu in cxt.Usuarios
                                   select new
                                   {
                                       id = uu.usuario_id,
                                       apellidoynombre = uu.usuario_nombre_apellido,
                                       usuario = uu.usuario_usuario,
                                       perfil = uu.usuario_perfil,
                                       mail = uu.usuario_email,
                                       clave = uu.usuario_clave
                                   }).ToList();

                gv_usuarios.DataSource = usuarios;
                gv_usuarios.DataBind();
            }

            Limpiar();
        }

        protected void btn_agregar_Click(object sender, EventArgs e)
        {
            using (var cxt = new seminarioDBContainer())
            {
                Usuario u = new Usuario();
                u.usuario_nombre_apellido = tb_usuario_nombre.Value;
                u.usuario_perfil = tb_usuario_perfil.SelectedItem.Text;
                u.usuario_email = tb_usuario_email.Value;
                u.usuario_usuario = tb_usuario_usuario.Value;
                u.usuario_clave = tb_usuario_clave.Value;

                cxt.Usuarios.Add(u);
                cxt.SaveChanges();
            }

            ListarUsuarios();
        }


        private void MostrarPopUpDatosUsuario()
        {
            string script = "<script language=\"javascript\"  type=\"text/javascript\">$(document).ready(function() { $('#modal_datos_usuario').modal('show')});</script>";
            ScriptManager.RegisterStartupScript(Page, this.GetType(), "ShowPopUp", script, false);
        }

        protected void SeleccionarRegistro(object sender, GridViewCommandEventArgs e)
        {
            int fila = int.Parse(e.CommandArgument.ToString());

            int id_usuario = 0;

            if (int.TryParse(gv_usuarios.Rows[fila].Cells[0].Text, out id_usuario))
            {
                using (var cxt = new seminarioDBContainer())
                {
                    Usuario u = cxt.Usuarios.FirstOrDefault(uu => uu.usuario_id == id_usuario);

                    tb_ID.Value = u.usuario_id.ToString();
                    tb_usuario_nombre.Value = u.usuario_nombre_apellido;
                    tb_usuario_perfil.SelectedValue = u.usuario_perfil;
                    tb_usuario_email.Value = u.usuario_email;
                    tb_usuario_usuario.Value = u.usuario_usuario;
                    tb_usuario_clave.Value = u.usuario_clave;
                    descripcion_perfil.InnerText = u.usuario_perfil == "Administrador" ? "Puede administrar sus secuenciadores, admininistrar ubicaciones en el mapa y administrar usuarios" : "Puede administrar sus secuenciadores, admininistrar ubicaciones en el mapa";

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
            tb_usuario_clave.Value = "0";
            tb_usuario_email.Value = "0";
            tb_usuario_nombre.Value = "";
            tb_usuario_usuario.Value = "";

            btn_agregar.Enabled = true;
            btn_eliminar.Enabled = false;
            btn_modificar.Enabled = false;
        }

        protected void btn_modificar_Click(object sender, EventArgs e)
        {
            using (var cxt = new seminarioDBContainer())
            {
                int id_usuario = 0;
                int.TryParse(tb_ID.Value, out id_usuario);
                Usuario u = cxt.Usuarios.FirstOrDefault(uu => uu.usuario_id == id_usuario);

                u.usuario_nombre_apellido = tb_usuario_nombre.Value;
                u.usuario_perfil = tb_usuario_perfil.SelectedItem.Text;
                u.usuario_email = tb_usuario_email.Value;
                u.usuario_usuario = tb_usuario_usuario.Value;
                u.usuario_clave = tb_usuario_clave.Value;

                cxt.SaveChanges();
            }

            ListarUsuarios();
        }

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {
            using (var cxt = new seminarioDBContainer())
            {
                int id_usuario = 0;
                int.TryParse(tb_ID.Value, out id_usuario);
                Usuario u = cxt.Usuarios.FirstOrDefault(uu => uu.usuario_id == id_usuario);

                cxt.Usuarios.Remove(u);
                cxt.SaveChanges();
            }

            ListarUsuarios();
        }

        protected void agregar_nuevo_usuario_Click(object sender, EventArgs e)
        {
            Limpiar();
            MostrarPopUpDatosUsuario();
        }
    }
}