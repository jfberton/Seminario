using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Seminario
{
    public partial class alta_usuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_guardar_Click(object sender, EventArgs e)
        {
            using (var cxt = new Aplicativo.seminarioDBContainer())
            {
                Aplicativo.Usuario u = new Aplicativo.Usuario();


                string mail = tb_usuario_email.Value;
                string nombre = tb_usuario_nombre.Value;
                if (cxt.Usuarios.FirstOrDefault(uu => uu.usuario_usuario == mail) == null)
                {

                    u.usuario_nombre_apellido = nombre;
                    u.usuario_perfil = "Profesor";
                    u.usuario_email = mail;
                    u.usuario_usuario = mail;
                    u.usuario_clave = Generador_claves.Generate(6, 6);

                    MiMail mm = new Seminario.MiMail(u.usuario_nombre_apellido, u.usuario_email, u.usuario_clave, TipoMail.Nuevo_usuario);
                    if (mm.EnviarMail())
                    {
                        cxt.Usuarios.Add(u);
                        cxt.SaveChanges();
                        Aplicativo.MessageBox.Show(this, "El usuario se guardo correctamente, revisa tu correo para obtener la contraseña, saludos!", Aplicativo.MessageBox.Tipo_MessageBox.Success, "Exito!", "index.aspx");
                    }
                    else
                    {
                        Aplicativo.MessageBox.Show(this, "Ocurrió un error al enviar el correo, el usuario no fue guardado.", Aplicativo.MessageBox.Tipo_MessageBox.Danger, "Atención", "index.aspx");
                    }
                }
                else
                {
                    Aplicativo.MessageBox.Show(this, "El usuario <b>" + mail + "</b> ya se encuentra registrado en nuestra base de datos.", Aplicativo.MessageBox.Tipo_MessageBox.Danger, "Atención", "index.aspx");
                }
            }
        }

        protected void btn_cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }

    public enum TipoMail
    {
        Nuevo_usuario,
        Cambio_de_clave
    }

    public partial class MiMail
    {
        public string NombreyApellido { get; set; }
        public string Usuario { get; set; }
        public string Clave { get; set; }
        private string Cuerpo;
        public TipoMail TipoMail { get; set; }

        public MiMail(string nombre, string usuario, string clave, TipoMail tipo)
        {
            this.NombreyApellido = nombre;
            this.Usuario = usuario;
            this.Clave = clave;
            this.TipoMail = tipo;
            if (tipo == TipoMail.Nuevo_usuario)
            {
                this.Cuerpo = File.ReadAllText(HttpRuntime.AppDomainAppPath + @"mail_nuevo_usuario.html").ToString().Replace("NombreyApellido", NombreyApellido).Replace("UserName", Usuario).Replace("UserClave", Clave);
            }
            else
            {
                this.Cuerpo = File.ReadAllText(HttpRuntime.AppDomainAppPath + @"mail_nuevo_usuario.html").ToString().Replace("NombreyApellido", NombreyApellido).Replace("UserName", Usuario).Replace("UserClave", Clave).Replace("Te has registrado correctamente!", "Has solicitado el cambio de tu contraseña!").Replace("Gracias por registrarte en nuestro sitio", "Aquí estan tus nuevas credenciales de acceso");
            }
        }


        /// <summary>
        /// Envia el mail y devuelve verdadero si envió correctamente, falso caso contrario
        /// </summary>
        /// <returns>True: envio exitoso, False: envio fallido</returns>
        public bool EnviarMail()
        {
            bool ret = false;

            try
            {
                MailAddress ma_de = new MailAddress("fede.berton@yahoo.com", "PORTAL DE INGRESO Y PERMANENCIA");
                MailAddress ma_para = new MailAddress(Usuario);

                MailMessage mail = new MailMessage(ma_de, ma_para);

                mail.Body = Cuerpo;
                mail.BodyEncoding = System.Text.Encoding.UTF8;
                mail.IsBodyHtml = true;
                if (TipoMail == TipoMail.Nuevo_usuario)
                {
                    mail.Subject = "Confirmación registro de usuario";
                }
                else
                {
                    mail.Subject = "Cambio de contraseña";
                }
                mail.SubjectEncoding = System.Text.Encoding.UTF8;

                string Smtp_host = ConfigurationManager.AppSettings["Smtp_host"];
                int Smtp_port = 0;
                int.TryParse(ConfigurationManager.AppSettings["Smtp_port"], out Smtp_port);
                string NetworkCredential_address = ConfigurationManager.AppSettings["NetworkCredential_address"];
                string NetworkCredential_pass = ConfigurationManager.AppSettings["NetworkCredential_pass"];
               
                SmtpClient smtpClient = new SmtpClient(Smtp_host, Smtp_port);
                smtpClient.UseDefaultCredentials = false;
                smtpClient.Credentials = new NetworkCredential(NetworkCredential_address, NetworkCredential_pass);
                smtpClient.EnableSsl = true;
                smtpClient.Send(mail);

                mail.Dispose();
        
                ret = true;
            }
            catch (Exception ex)
            {
                ret = false;
            }

            return ret;
        }

    }
}