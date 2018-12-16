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
        <div data-key="AIzaSyAErdqW0B1ui1G-SeDOu_rk5nzU2TCLZcE"
            data-control-zoom="true"
            data-control-type="true"
            data-control-scale="true"
            data-control-streetview="true"
            data-control-rotate="true"
            data-event-mousewheel="true"
            data-zoom="14" role="map" class="gmaps">


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
                    <asp:BoundField DataField="nivel" HeaderText="Nivel" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="sector" HeaderText="Sector" />
                    <asp:BoundField DataField="localidad" HeaderText="Localidad" />
                </Columns>
            </asp:GridView>


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
