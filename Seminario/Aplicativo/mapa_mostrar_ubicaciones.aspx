<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mapa_mostrar_ubicaciones.aspx.cs" Inherits="Seminario.Aplicativo.mapa_mostrar_ubicaciones" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/jquery.gmaps.css" rel="stylesheet" />
    <script src="../js/jquery-1.10.2.min.js"></script>
    <script src="../js/jquery.gmaps.js"></script>

    <title></title>

    <style>
        .gmaps {
            height: 500px;
            width: 100%;
        }

        .table-borderless td,
        .table-borderless th {
            border: none !important;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div data-key="API_KEY"
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
                            <h3><%# DataBinder.Eval(Container.DataItem, "ubicacion_nombre") %></h3>
                            <p style="font-size: medium; font-style: italic; font-weight: bold; color: grey"><%# DataBinder.Eval(Container.DataItem, "ubicacion_descripcion") %></p>
                            <table class="table table-hover">
                                <tr>
                                    <td style="border-right: solid; border-right-color: black; border-right-width: medium;">
                                        <asp:Image ImageUrl="~/img/pin_map.png" runat="server" />
                                    </td>
                                    <td>
                                        <table class="table table-borderless table-hover text-left">
                                            <tr>
                                                <td><b><u>Dirección:</u></b></td>
                                                <td><%# DataBinder.Eval(Container.DataItem, "ubicacion_direccion") %></td>
                                            </tr>
                                            <tr>
                                                <td><b><u>Teléfono:</u></b></td>
                                                <td><%# DataBinder.Eval(Container.DataItem, "ubicacion_telefono") %></td>
                                            </tr>
                                            <tr>
                                                <td><b><u>E-mail:</u></b></td>
                                                <td><a href="mailto:<%# DataBinder.Eval(Container.DataItem, "ubicacion_mail") %>"><%# DataBinder.Eval(Container.DataItem, "ubicacion_mail") %></a></td>
                                            </tr>
                                            <tr>
                                                <td><b><u>Página:</u></b></td>
                                                <td><a href="http://<%# DataBinder.Eval(Container.DataItem, "ubicacion_web") %>" target="_blank"><%# DataBinder.Eval(Container.DataItem, "ubicacion_web") %></a></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
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
