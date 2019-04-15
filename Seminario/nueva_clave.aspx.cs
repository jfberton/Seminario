using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Seminario
{
    public partial class nueva_clave : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_guardar_Click(object sender, EventArgs e)
        {
            using (var cxt = new Aplicativo.seminarioDBContainer())
            {
                string mail = tb_usuario_email.Value;
                Aplicativo.Usuario u = cxt.Usuarios.FirstOrDefault(uu => uu.usuario_usuario == mail);
                
                if (u != null)
                {
                    u.usuario_clave = Generador_claves.Generate(6, 6);

                    MiMail mm = new Seminario.MiMail(u.usuario_nombre_apellido, u.usuario_email, u.usuario_clave, TipoMail.Cambio_de_clave);
                    if (mm.EnviarMail())
                    {
                        cxt.SaveChanges();
                        Aplicativo.MessageBox.Show(this, "La contraseña se generó correctamente, revisa tu correo para obtenerla, saludos!", Aplicativo.MessageBox.Tipo_MessageBox.Success, "Exito!", "index.aspx");
                    }
                    else
                    {
                        Aplicativo.MessageBox.Show(this, "Ocurrió un error al enviar el correo, la contraseña no fue modificada.", Aplicativo.MessageBox.Tipo_MessageBox.Danger, "Atención", "index.aspx");
                    }
                }
                else
                {
                    Aplicativo.MessageBox.Show(this, "El correo <b>" + mail + "</b> no encuentra registrado en nuestra base de datos.", Aplicativo.MessageBox.Tipo_MessageBox.Danger, "Atención", "index.aspx");
                }
            }
        }

        protected void btn_cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }
}