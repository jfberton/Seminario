<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="nueva_clave.aspx.cs" Inherits="Seminario.nueva_clave" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_cuerpo" runat="server">
     <h1>Generar nueva clave</h1>
    
    <div class="col-md-12">
        <p>El sistema le otorgará una nueva clave y se la enviará a su dirección de correo</p>
        <br />
        <div class="input-group">
            <span class="input-group-addon">Correo electronico:</span>
            <input type="text" runat="server" id="tb_usuario_email" placeholder="Correo electrónico." class="form-control" />
        </div>
        <br />
        <asp:Button Text="Generar una nueva clave!" runat="server" ID="btn_guardar" OnClick="btn_guardar_Click" CssClass="btn btn-primary" />
        <asp:Button Text="Cancelar" runat="server" ID="btn_cancelar" OnClick="btn_cancelar_Click" CssClass="btn btn-default" />
    </div>
</asp:Content>
