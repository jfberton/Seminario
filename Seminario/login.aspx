<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Seminario.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="shortcut icon" href="images/favicon.ico?crc=424358116" />
    <title>Acceso UTN-FRRE</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_cuerpo" runat="server">
    <br />
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <h2 class="form-signin-heading">Ingrese su usuario</h2>
            <label for="inputEmail" class="sr-only">Email address</label>
            <input type="text" runat="server" id="tb_usuario" class="form-control" placeholder="Usuario" autofocus />
            <br />
            <label for="inputPassword" class="sr-only">Password</label>
            <input type="password" id="tb_clave" runat="server" class="form-control" placeholder="Contraseña" />
            <br />
            <asp:Button Text="Ingresar" CssClass="btn btn-lg btn-primary btn-block" ID="btn_login" UseSubmitBehavior="true" OnClick="btn_login_ServerClick" runat="server" />
            <br />
            Aún no tengo cuenta, <asp:LinkButton Text="quiero registrarme" runat="server" id="btn_nueva_cuenta" OnClick="btn_nueva_cuenta_Click" />
            <br />
            Me olvide la clave, <asp:LinkButton Text="quiero generar otra clave" runat="server" id="btn_clave_nueva" OnClick="btn_clave_nueva_Click" />
            
        </div>
        <div class="col-md-4"></div>
    </div>
    <br />
</asp:Content>
