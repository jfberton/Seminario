﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Aplicativo/Site1.Master" AutoEventWireup="true" CodeBehind="aplicativo_ubicacion_instituciones.aspx.cs" Inherits="Seminario.Aplicativo.aplicativo_ubicacion_instituciones" %>

<asp:Content runat="server" ContentPlaceHolderID="cph_titulo" ID="content_titulo">
    Cargar ubicaciones UTN-FRRE
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Bootstrap y JQuery -->


    <!-- API Google maps-->
    <script type="text/javascript" src='https://maps.google.com/maps/api/js?sensor=false&libraries=places&key=AIzaSyAErdqW0B1ui1G-SeDOu_rk5nzU2TCLZcE'></script>

    <!-- librerias js -->
    
    <script src="../js/locationpicker.jquery.js"></script>
    <style>
        .pac-container{z-index:2000 !important;}
    </style>

    <link rel="shortcut icon" href="../images/favicon.ico" />
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_cuerpo" runat="server">

    <div class="row">
        <div class="col-md-12">
            <h3>Ubicaciones</h3>
            <asp:Button Text="Agregar ubicacion" CssClass="btn btn-lg btn-link" OnClick="agregar_nueva_ubicacion_Click" ID="agregar_nueva_ubicacion" runat="server" />
            <asp:GridView runat="server" ID="gv_ubicaciones" AutoGenerateColumns="false" CssClass="table-responsive table table-bordered" OnRowCommand="SeleccionarRegistro">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" />
                    <asp:BoundField DataField="categoria" HeaderText="Categoría" />
                    <asp:BoundField DataField="lugar" HeaderText="Lugar" />
                    <asp:BoundField DataField="ubicacion" HeaderText="Ubicación" />
                    <asp:BoundField DataField="latitud" HeaderText="Latitud" />
                    <asp:BoundField DataField="longitud" HeaderText="Longitud" />

                    <asp:ButtonField CommandName="btn_seleccionar" Text="Seleccionar">
                        <ControlStyle CssClass="btn btn-info" />
                    </asp:ButtonField>

                </Columns>
            </asp:GridView>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="modal_datos_instituto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Datos del instituto</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">

                            <div class="input-group">
                                <span class="input-group-addon">Categoría:</span>
                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddl_categoria">
                                    <asp:ListItem Text="Secundario" />
                                    <asp:ListItem Text="Terciario" />
                                    <asp:ListItem Text="Facultad" />
                                    <asp:ListItem Text="Universidad" />
                                    <asp:ListItem Text="Instituto" />
                                    <asp:ListItem Text="Organización" />
                                    <asp:ListItem Text="Otros" />
                                </asp:DropDownList>
                            </div>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon">Nombre:</span>
                                <input type="text" runat="server" id="tb_nombre_lugar" placeholder="Ingrese nombre del instituto." class="form-control" />
                            </div>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon">Descripción:</span>
                                <input type="text" runat="server" id="tb_descripcion" placeholder="Breve descripción del instituto." class="form-control" />
                            </div>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon">Teléfono:</span>
                                <input type="text" runat="server" id="tb_telefono" placeholder="Teléfono." class="form-control" />
                            </div>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon">Página:</span>
                                <input type="text" runat="server" id="tb_pagina" placeholder="Pagina web." class="form-control" />
                            </div>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon">Email:</span>
                                <input type="text" runat="server" id="tb_email" placeholder="Correo electrónico." class="form-control" />
                            </div>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon">Facebook:</span>
                                <input type="text" runat="server" id="tb_facebook" placeholder="Facebook ." class="form-control" />
                            </div>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon">Twitter:</span>
                                <input type="text" runat="server" id="tb_twitter" placeholder="Twitter." class="form-control" />
                            </div>
                            <br />
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
    </script>

</asp:Content>
