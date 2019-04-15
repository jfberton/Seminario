<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="alta_usuario.aspx.cs" Inherits="Seminario.alta_usuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_cuerpo" runat="server">

    <h1>Nuevo usuario</h1>
    
    <div class="col-md-12">
        <p>Al registrarse podrá crear sus propios secuenciadores ademas de acceder a los secuenciadores públicos.</p>
        <p>El sistema enviará un e-mail a la dirección ingresada con la contraseña asignada.</p>
        <div class="input-group">
            <span class="input-group-addon">Apellido y nombre</span>
            <input type="text" runat="server" id="tb_usuario_nombre" placeholder="Apellido y nombre del usuario." class="form-control" />
        </div>
        <br />
        <div class="input-group">
            <span class="input-group-addon">Email:</span>
            <input type="text" runat="server" id="tb_usuario_email" placeholder="Correo electrónico." class="form-control" />
        </div>
        <br />
        <asp:Button Text="Registrarme y enviar e-mail con mi contraseña" runat="server" ID="btn_guardar" OnClick="btn_guardar_Click" CssClass="btn btn-primary" />
        <asp:Button Text="Cancelar" runat="server" ID="btn_cancelar" OnClick="btn_cancelar_Click" CssClass="btn btn-default" />
    </div>
</asp:Content>
