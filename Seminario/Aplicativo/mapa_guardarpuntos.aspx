<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mapa_guardarpuntos.aspx.cs" Inherits="Seminario.Aplicativo.mapa_guardarpuntos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <!-- Bootstrap y JQuery -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/bootstrap-theme.min.css" rel="stylesheet" />


    <!-- API Google maps-->
    <script type="text/javascript" src='https://maps.google.com/maps/api/js?sensor=false&libraries=places&key=AIzaSyBo6F5Iq9_IguM9YwArjUW8oSQ1qhYfy0g'></script>

    <!-- librerias js -->
    <script src="../js/jquery-1.10.2.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/locationpicker.jquery.js"></script>
    <script src="../js/locationpicker.jquery.js"></script>

    <title>Obtener coordenadas del punto</title>



</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <br />
            <div class="row">
                <div class="col-md-4">
                    <h3>Lugar</h3>
                    <input type="text" runat="server" id="tb_nombre_lugar" placeholder="Ingrese nombre del lugar a guardar." class="form-control" />
                    <br />
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
                    <br />
                    <div class="form-group">
                        <asp:Button Text="Agregar" OnClick="btn_agregar_Click" CssClass="btn btn-success" ID="btn_agregar" runat="server" UseSubmitBehavior="false" />
                        <asp:Button Text="Modificar" CssClass="btn btn-warning" OnClick="btn_modificar_Click" ID="btn_modificar" Enabled="false" runat="server" UseSubmitBehavior="false" />
                        <asp:Button Text="Eliminar" CssClass="btn btn-danger" OnClick="btn_eliminar_Click" ID="btn_eliminar" Enabled="false" runat="server" UseSubmitBehavior="false" />
                        <asp:Button Text="Limpiar" OnClick="btn_limpiar_Click" CssClass="btn btn-default" ID="btn_limpiar" Enabled="false" runat="server" UseSubmitBehavior="false" />
                    </div>
                    <script>
                        $('#us2').locationpicker({
                            location: {
                                latitude: $('#<%=tb_latitud.ClientID%>').val(),
                                longitude: $('#<%=tb_longitud.ClientID%>').val()
                            },
                            radius: 0,
                            title: 'lalalala',
                            inputBinding: {
                                latitudeInput: $('#<%=tb_latitud.ClientID%>'),
                                longitudeInput: $('#<%=tb_longitud.ClientID%>'),
                                locationNameInput: $('#<%=tb_direccion.ClientID%>')
                            },
                            enableAutocomplete: true
                        });
                </script>
                </div>
                <div class="col-md-8">
                    <h3>Ubicaciones</h3>
                    <asp:GridView runat="server" ID="gv_ubicaciones" AutoGenerateColumns="false" CssClass="table-responsive table table-bordered" OnRowCommand="SeleccionarRegistro">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="ID" />
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
        </div>
    </form>

</body>
</html>
