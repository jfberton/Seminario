<%@ Page Title="" Language="C#" MasterPageFile="~/Aplicativo/Site1.Master" AutoEventWireup="true" CodeBehind="aplicativo_admin_usuarios.aspx.cs" Inherits="Seminario.Aplicativo.aplicativo_admin_usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_cuerpo" runat="server">
    <h2>Usuarios</h2>
    <asp:Button Text="Agregar usuario" CssClass="btn btn-lg btn-link" OnClick="agregar_nuevo_usuario_Click" ID="agregar_nuevo_usuario" runat="server" />
    <asp:GridView runat="server" ID="gv_usuarios" AutoGenerateColumns="false" CssClass="table-responsive table table-bordered" OnRowCommand="SeleccionarRegistro">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="ID" />
            <asp:BoundField DataField="apellidoynombre" HeaderText="Apellido y Nombre" />
            <asp:BoundField DataField="perfil" HeaderText="Ubicación" />
            <asp:BoundField DataField="mail" HeaderText="Correo electrónico" />
            <asp:BoundField DataField="usuario" HeaderText="Usuario" />

            <asp:ButtonField CommandName="btn_seleccionar" Text="Seleccionar">
                <ControlStyle CssClass="btn btn-info" />
            </asp:ButtonField>

        </Columns>
    </asp:GridView>

    <!-- Modal -->
    <div class="modal fade" id="modal_datos_usuario" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Datos del usuario</h4>
                </div>
                <div class="modal-body">
                    <asp:HiddenField runat="server" ID="tb_ID" />
                    <div class="col-md-12">
                        <div class="input-group">
                            <span class="input-group-addon">Apellido y nombre</span>
                            <input type="text" runat="server" id="tb_usuario_nombre" placeholder="Apellido y nombre del usuario." class="form-control" />
                        </div>
                        <br />
                        <div class="input-group">
                            <span class="input-group-addon">Perfil:</span>
                            <asp:DropDownList runat="server" ID="tb_usuario_perfil" CssClass="form-control" onchange="MostrarTextoPerfil(this)">
                                <asp:ListItem Text="Administrador" />
                                <asp:ListItem Text="Profesor" />
                            </asp:DropDownList>
                        </div>
                        <div class="well well-sm" id="descripcion_perfil" runat="server">Puede administrar sus secuenciadores, admininistrar ubicaciones en el mapa y administrar usuarios</div>
                        <div class="input-group">
                            <span class="input-group-addon">Usuario:</span>
                            <input type="text" runat="server" id="tb_usuario_usuario" placeholder="Usuario." class="form-control" />
                        </div>
                        <br />
                        <div class="input-group">
                            <span class="input-group-addon">Clave:</span>
                            <input type="password" runat="server" id="tb_usuario_clave" placeholder="Contraseña."  class="form-control" />
                        </div>
                        <br />
                        <div class="input-group">
                            <span class="input-group-addon">Email:</span>
                            <input type="text" runat="server" id="tb_usuario_email" placeholder="Correo electrónico." class="form-control" />
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
        function MostrarTextoPerfil(ddl) {
            if (ddl.options[ddl.selectedIndex].text == 'Administrador')
            {
                document.getElementById("<%=descripcion_perfil.ClientID%>").innerText = 'Puede administrar sus secuenciadores, admininistrar ubicaciones en el mapa y administrar usuarios';
            }
            else
            {
                document.getElementById("<%=descripcion_perfil.ClientID%>").innerText = 'Puede administrar sus secuenciadores, admininistrar ubicaciones en el mapa';
            }
        }
       
    </script>
</asp:Content>
