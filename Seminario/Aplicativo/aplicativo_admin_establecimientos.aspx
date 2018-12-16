<%@ Page Title="" Language="C#" MasterPageFile="~/Aplicativo/Site1.Master" AutoEventWireup="true" CodeBehind="aplicativo_admin_establecimientos.aspx.cs" Inherits="Seminario.Aplicativo.aplicativo_admin_establecimientos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_titulo" runat="server">
    ABM Establecimientos educativos
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap y JQuery -->


    <!-- API Google maps-->
    <script type="text/javascript" src='https://maps.google.com/maps/api/js?sensor=false&libraries=places&key=AIzaSyAErdqW0B1ui1G-SeDOu_rk5nzU2TCLZcE'></script>

    <!-- librerias js -->

    <script src="../js/locationpicker.jquery.js"></script>
    <style>
        .pac-container {
            z-index: 2000 !important;
        }
    </style>

    <link rel="shortcut icon" href="../images/favicon.ico" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_cuerpo" runat="server">

    <div class="row">
        <div class="col-md-12">
            <h3>Establecimientos Educativos</h3>
            <asp:Button Text="Agregar establecimiento" CssClass="btn btn-lg btn-link" OnClick="agregar_establecimiento_Click" ID="agregar_establecimiento" runat="server" />

            <div class="alert alert-info">
                <div class="row">
                    <div class="col-md-3">
                        <div class="input-group">
                            <span class="input-group-addon">Reg. educ.:</span>
                            <select runat="server" id="tb_select_filtro_regiones" style="width: 100%" multiple="false">
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="input-group">
                            <span class="input-group-addon">Ámbito:</span>
                            <select runat="server" id="tb_select_filtro_ambito" style="width: 100%" multiple="false">
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="input-group">
                            <span class="input-group-addon">Sector:</span>
                            <select runat="server" id="tb_select_filtro_sector" style="width: 100%" multiple="false">
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="input-group">
                            <span class="input-group-addon">Localidad:</span>
                            <select runat="server" id="tb_select_filtro_localidad" style="width: 100%" multiple="false">
                            </select>
                        </div>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-3">
                        <div class="input-group">
                            <span class="input-group-addon">Modalidad:</span>
                            <select runat="server" id="tb_select_filtro_modalidad" style="width: 100%" multiple="false">
                            </select>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="input-group">
                                    <span class="input-group-addon">Orientaciones:</span>
                                    <select runat="server" id="tb_select_filtro_orientaciones" style="width: 100%" multiple="true">
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="input-group">
                                    <span class="input-group-addon">Otras orientaciones:</span>
                                    <input type="text" runat="server" id="tb_filtro_otras_orientaciones" placeholder="Otras orientaciones" class="form-control" />
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <br />
                <div class="row">
                    <div class="col-md-11">
                        <div class="input-group">
                            <span class="input-group-addon">Nombre:</span>
                            <input type="text" runat="server" id="tb_filtro_nombre_lugar" placeholder="Ingrese nombre del instituto." class="form-control" />
                        </div>
                    </div>
                    <div class="col-md-1">
                        <asp:Button Text="Buscar" ID="btn_filtrar_establecimientos" CssClass="btn btn-default" OnClick="btn_filtrar_establecimientos_Click" runat="server" />
                    </div>
                </div>
            </div>

            <asp:GridView runat="server" ID="gv_ubicaciones" AutoGenerateColumns="false" CssClass="table-responsive table table-bordered" OnRowCommand="SeleccionarRegistro">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" />
                    <asp:BoundField DataField="region" HeaderText="Region" />
                    <asp:BoundField DataField="ambito" HeaderText="Ambito" />
                    <asp:BoundField DataField="nivel" HeaderText="Modalidad" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="sector" HeaderText="Sector" />
                    <asp:BoundField DataField="localidad" HeaderText="Localidad" />

                    <asp:ButtonField CommandName="btn_seleccionar" Text="Seleccionar">
                        <ControlStyle CssClass="btn btn-info" />
                    </asp:ButtonField>
                </Columns>
            </asp:GridView>
        </div>
    </div>


    <!-- Modal -->
    <div class="modal fade" id="modal_datos_instituto" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Datos del Establecimiento educativo</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">

                            <div class="input-group">
                                <span class="input-group-addon">Region educativa:</span>
                                <select runat="server" id="tb_select_regiones" style="width: 100%" multiple="false">
                                </select>
                            </div>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon">Modalidad:</span>
                                <select runat="server" id="tb_select_modalidad" style="width: 100%" multiple="false">
                                </select>
                            </div>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon">Nombre:</span>
                                <input type="text" runat="server" id="tb_nombre_lugar" placeholder="Ingrese nombre del instituto." class="form-control" />
                            </div>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon">Localidad:</span>
                                <select runat="server" id="tb_select_localidad" style="width: 100%" multiple="false">
                                </select>
                            </div>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon">Ambito:</span>
                                <select runat="server" id="tb_select_ambito" style="width: 100%" multiple="false">
                                </select>
                            </div>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon">Sector:</span>
                                <select runat="server" id="tb_select_sector" style="width: 100%" multiple="false">
                                </select>
                            </div>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon">Teléfono:</span>
                                <input type="text" runat="server" id="tb_telefono" placeholder="Teléfono." class="form-control" />
                            </div>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon">Email:</span>
                                <input type="text" runat="server" id="tb_email" placeholder="Correo electrónico." class="form-control" />
                            </div>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon">Orientaciones:</span>
                                <select runat="server" id="tb_select_orientaciones" style="width: 100%" multiple="true">
                                </select>
                            </div>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon">Otras orientaciones:</span>
                                <input type="text" runat="server" id="tb_otras_orientaciones" placeholder="Otras orientaciones" class="form-control" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-search"></span>
                                    Ubicación:
                                </span>
                                <input type="text" class="form-control" runat="server" id="tb_direccion" />
                                <asp:HiddenField runat="server" ID="tb_ID" />
                            </div>
                            <br />
                            <div class="form-group">
                                <div id="us2" style="width: 100%; height: 400px;"></div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <span class="input-group-addon">Lat.:</span>
                                        <input type="text" class="form-control" runat="server" id="tb_latitud" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <span class="input-group-addon">Lon.:</span>
                                        <input type="text" class="form-control" runat="server" id="tb_longitud" />
                                    </div>
                                </div>
                            </div>
                        </div>

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
        $('#us2').locationpicker({
            location: {
                latitude: $('#<%=tb_latitud.ClientID%>').val(),
                longitude: $('#<%=tb_longitud.ClientID%>').val()
            },
            radius: 0,
            inputBinding: {
                latitudeInput: $('#<%=tb_latitud.ClientID%>'),
                longitudeInput: $('#<%=tb_longitud.ClientID%>'),
                locationNameInput: $('#<%=tb_direccion.ClientID%>')
            },
            enableAutocomplete: true
        });

        $(document).ready(function () {
            $('#<%=tb_select_filtro_ambito.ClientID %>').select2({
                val: null,
                placeholder: "Ambito",
                allowClear: true
            });
            $('#<%=tb_select_filtro_localidad.ClientID %>').select2({
                val: null,
                placeholder: "Localidad",
                allowClear: true
            });
            $('#<%=tb_select_filtro_modalidad.ClientID %>').select2({
                val: null,
                placeholder: "Modalidad",
                allowClear: true
            });
            $('#<%=tb_select_filtro_orientaciones.ClientID %>').select2({
                val: null,
                placeholder: "Orientaciones",
                allowClear: true
            });
            $('#<%=tb_select_filtro_regiones.ClientID %>').select2({
                val: null,
                placeholder: "Regiones",
                allowClear: true
            });
            $('#<%=tb_select_filtro_sector.ClientID %>').select2({
                val: null,
                placeholder: "Sectores",
                allowClear: true
            });

            $('#<%=tb_select_regiones.ClientID %>').select2({
                val: null,
                placeholder: "Regiones educativas",
                allowClear: true
            });
            $('#<%=tb_select_modalidad.ClientID %>').select2({
                val: null,
                placeholder: "Modalidad",
                allowClear: true
            });
            $('#<%=tb_select_localidad.ClientID %>').select2({
                val: null,
                placeholder: "Localidad",
                allowClear: true
            });
            $('#<%=tb_select_ambito.ClientID %>').select2({
                val: null,
                placeholder: "Ambito",
                allowClear: true
            });
            $('#<%=tb_select_sector.ClientID %>').select2({
                val: null,
                placeholder: "Sector",
                allowClear: true
            });
            $('#<%=tb_select_orientaciones.ClientID %>').select2({
                val: null,
                placeholder: "Orientaciones",
                allowClear: true
            });
        });

    </script>

</asp:Content>
