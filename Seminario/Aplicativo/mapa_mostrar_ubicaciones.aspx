<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mapa_mostrar_ubicaciones.aspx.cs" Inherits="Seminario.Aplicativo.mapa_mostrar_ubicaciones" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link href="../css/jquery.gmaps.css" rel="stylesheet" />
    <script src="../js/jquery-1.10.2.min.js"></script>
    <script src="../js/jquery.gmaps.js"></script>

    <title></title>

    <style>
        .gmaps {
            height: 500px;
            width: 100%;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div data-key="AIzaSyBo6F5Iq9_IguM9YwArjUW8oSQ1qhYfy0g"
            data-control-zoom="true"
            data-control-type="true"
            data-control-scale="true"
            data-control-streetview="true"
            data-control-rotate="true"
            data-event-mousewheel="true"
            data-zoom="14" role="map" class="gmaps">

            <asp:Repeater runat="server" ID="repetidor">
                <ItemTemplate>
                    <div
                        data-id="<%# DataBinder.Eval(Container.DataItem, "ubicacion_id") %>"
                        data-lat="<%# DataBinder.Eval(Container.DataItem, "ubicacion_latitud") %>"
                        data-lng="<%# DataBinder.Eval(Container.DataItem, "ubicacion_longitud") %>"
                        class="marker">
                        <div class="map-card">
                            <h1><%# DataBinder.Eval(Container.DataItem, "ubicacion_lugar") %></h1>
                            <p><%# DataBinder.Eval(Container.DataItem, "ubicacion_direccion") %></p>
                            <p>Phone: +56753223344</p>
                            <p>e-Mail: fake1@email.com</p>
                        </div>
                    </div>
                </ItemTemplate>

            </asp:Repeater>






        </div>
    </form>

    <script>
        $(document).ready(function () {
            $('.gmaps').gmaps();
        });
    </script>
</body>
</html>
