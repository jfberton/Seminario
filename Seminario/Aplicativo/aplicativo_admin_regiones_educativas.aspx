<%@ Page Title="" Language="C#" MasterPageFile="~/Aplicativo/Site1.Master" AutoEventWireup="true" CodeBehind="aplicativo_admin_regiones_educativas.aspx.cs" Inherits="Seminario.Aplicativo.aplicativo_admin_regiones_educativas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_cuerpo" runat="server">
    <asp:Button Text="Agregar Región Educativa" CssClass="btn btn-lg btn-link" OnClick="agregar_nuevo_usuario_Click" ID="agregar_nuevo_usuario" runat="server" />
    <asp:GridView runat="server" ID="gv_regiones_educativas" AutoGenerateColumns="false" CssClass="table-responsive table table-bordered" OnRowCommand="SeleccionarRegistro">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="ID" />
            <asp:BoundField DataField="nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="industria" HeaderText="Industria" />
            <asp:BoundField DataField="produccion" HeaderText="Producción" />
            <asp:ButtonField CommandName="btn_seleccionar" Text="Seleccionar">
                <ControlStyle CssClass="btn btn-info" />
            </asp:ButtonField>

        </Columns>
    </asp:GridView>

    <!-- Modal -->
    <div class="modal fade" id="modal_datos_region_educativa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Datos de la región educativa</h4>
                </div>
                <div class="modal-body">
                    <asp:HiddenField runat="server" ID="tb_ID" />
                    <div class="col-md-12">
                        <div class="input-group">
                            <span class="input-group-addon">Nombre</span>
                            <input type="text" runat="server" id="tb_re_nombre" placeholder="Nombre de la región educativa" class="form-control" />
                        </div>
                        <br />

                        <div class="input-group">
                            <span class="input-group-addon">Producción</span>
                            <input type="text" runat="server" id="tb_re_produccion" placeholder="Producción." class="form-control" />
                        </div>
                        <br />
                        <div class="input-group">
                            <span class="input-group-addon">Industrias:</span>
                            <input type="text" runat="server" id="tb_re_industrias" placeholder="Industrias." class="form-control" />
                        </div>
                        <br />
                        <div class="input-group">
                            <span class="input-group-addon">Localidades:</span>
                            <select runat="server" id="tb_select_localidades" style="width: 100%" multiple="true">
                            </select>
                        </div>
                        <br />
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button Text="Agregar" OnClick="btn_agregar_Click" CssClass="btn btn-success" ID="btn_agregar" runat="server" UseSubmitBehavior="false" />
                    <asp:Button Text="Modificar" CssClass="btn btn-warning" OnClick="btn_modificar_Click" ID="btn_modificar" Enabled="false" runat="server" UseSubmitBehavior="false" />
                    <asp:Button Text="Eliminar" CssClass="btn btn-danger" OnClick="btn_eliminar_Click" ID="btn_eliminar" Enabled="false" runat="server" UseSubmitBehavior="false" />

                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $('#<%=tb_select_localidades.ClientID %>').select2({
                val:null,
                placeholder: "Localidades",
                allowClear: true
            });
        });
    </script>



</asp:Content>
