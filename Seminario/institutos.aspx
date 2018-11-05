<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="institutos.aspx.cs" Inherits="Seminario.institutos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css/jquery.gmaps.css" rel="stylesheet" />
    <script src="js/jquery.gmaps.js"></script>

    <link rel="shortcut icon" href="images/favicon.ico?crc=424358116" />
    <title>Institutos UTN-FRRE</title>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_cuerpo" runat="server">
    <h2>Institutos</h2>
    <div class="row">
        <div class="col-md-6">
            <div class="input-group">
                <span class="input-group-addon">Filtrar por categoría:</span>
                <asp:DropDownList runat="server" CssClass="form-control" ID="ddl_categoria" OnSelectedIndexChanged="ddl_categoria_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Text="Todos" />
                    <asp:ListItem Text="Secundario" />
                    <asp:ListItem Text="Terciario" />
                    <asp:ListItem Text="Facultad" />
                    <asp:ListItem Text="Universidad" />
                    <asp:ListItem Text="Instituto" />
                    <asp:ListItem Text="Organización" />
                    <asp:ListItem Text="Otros" />
                </asp:DropDownList>
            </div>
        </div>
    </div>
    <br />
    <div data-key="AIzaSyAErdqW0B1ui1G-SeDOu_rk5nzU2TCLZcE"
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
                        <h4><%# DataBinder.Eval(Container.DataItem, "ubicacion_categoria") %></h4></h4>
                        <h5><%# DataBinder.Eval(Container.DataItem, "ubicacion_nombre") %></h5>
                        <p style="font-size: small; font-style: italic; font-weight: bold; color: grey"><%# DataBinder.Eval(Container.DataItem, "ubicacion_descripcion") %></p>
                        <table class="table table-borderless table-hover text-left" style="font-size:small">
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
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <script>
        $(document).ready(function () {
            $('.gmaps').gmaps();
        });
    </script>
</asp:Content>
