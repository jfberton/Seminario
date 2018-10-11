<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pruebamapa_guardarpuntos.aspx.cs" Inherits="Seminario.Aplicativo.pruebamapa_guardarpuntos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <!-- Bootstrap y JQuery -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/bootstrap-theme.min.css" rel="stylesheet" />
    <script src="../js/jquery-1.10.2.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/locationpicker.jquery.js"></script>
    
    <!-- Libreria location Picker y Google maps-->
    <script type="text/javascript" src='https://maps.google.com/maps/api/js?libraries=places&key=AIzaSyBo6F5Iq9_IguM9YwArjUW8oSQ1qhYfy0g'></script>
    <script src="../js/locationpicker.jquery.js"></script>

    <title>Obtener coordenadas del punto</title>



</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <br />
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Ubicación</label>
                        <asp:HiddenField ID="txtID" runat="server" />
                        <asp:TextBox runat="server" ID="txtUbicacion" CssClass="form-control" />
                    </div>

                    <div class="form-group">
                        <div id="ModalMapPreview" style="width: 100%; height: 300px;"></div>
                    </div>

                    <!-- Coordenadas -->
                    <div class="form-group">
                        <label>Lat.:</label>
                        <asp:TextBox runat="server" ID="txtLat" Text="-27.451030121144324" CssClass="form-control" />
                        <label>Long.:</label>
                        <asp:TextBox runat="server" ID="txtLong" Text="-58.9790330079947" CssClass="form-control" />
                    </div>

                    <!-- Altas, bajas y modificacion de ubicaciones -->
                    <div class="form-group">
                        <asp:Button ID="btnAgregar" CssClass="btn btn-success" runat="server" Text="Agregar" UseSubmitBehavior="false" />
                        <asp:Button ID="btnModificar" CssClass="btn btn-warning" runat="server" Text="Modificar" UseSubmitBehavior="false" Enabled="false" />
                        <asp:Button ID="btnEliminar" CssClass="btn btn-danger" runat="server" Text="Eliminar" UseSubmitBehavior="false" Enabled="false" />
                        <asp:Button ID="btnLimpiar" CssClass="btn btn-default" runat="server" Text="Limpiar" UseSubmitBehavior="false" />
                    </div>


                </div>
                <div class="col-md-8">
                    <br />
                    <h1>Ubicaciones</h1>
                </div>
            </div>
        </div>
    </form>

    <script>
        $('#ModalMapPreview').locationpicker({
            radius: 0,
            location: {
                latitude: $('#<%=txtLat.ClientID%>').val(),
                longitude: $('#<%=txtLong.ClientID%>').val()
            },
            inputBinding: {
                latitudeInput: $('#<%=txtLat.ClientID %>'),
                longitudeInput: $('#<%=txtLong.ClientID%>'),
                locationNameInput: $('#<%=txtUbicacion.ClientID%>')
            },
            enableAutoComplete: true
        });
    </script>

</body>
</html>
