<%@ Page Title="" Language="C#" MasterPageFile="~/Aplicativo/Site1.Master" AutoEventWireup="true" CodeBehind="aplicativo_secuenciador_listado.aspx.cs" Inherits="Seminario.Aplicativo.aplicativo_secuenciador_listado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_titulo" runat="server">
    Secuenciadores
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_cuerpo" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h3>Secuenciadores</h3>
            <asp:Button Text="Agregar secuenciador" CssClass="btn btn-lg btn-link" OnClick="btn_agregar_secuenciador_Click" ID="btn_agregar_secuenciador" runat="server" />
            <asp:GridView runat="server" ID="gv_secuenciadores" AutoGenerateColumns="false" CssClass="table-responsive table table-bordered" OnRowCommand="SeleccionarRegistro">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" />
                    <asp:CheckBoxField ReadOnly="true" DataField="publico" HeaderText="Publico" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre secuencia" />
                    <asp:BoundField DataField="area" HeaderText="Área Académica" />
                    <asp:BoundField DataField="asignatura" HeaderText="Asignatura" />
                    <asp:BoundField DataField="curso" HeaderText="Curso" />
                    <asp:BoundField DataField="institucion" HeaderText="Institución" />

                    <asp:ButtonField CommandName="btn_seleccionar" Text="Seleccionar">
                        <ControlStyle CssClass="btn btn-info" />
                    </asp:ButtonField>

                     <asp:ButtonField CommandName="btn_imprimir" Text="Imprimir">
                        <ControlStyle CssClass="btn btn-default" />
                    </asp:ButtonField>

                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
