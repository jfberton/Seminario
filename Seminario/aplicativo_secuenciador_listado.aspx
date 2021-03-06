﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Aplicativo/Site1.Master" AutoEventWireup="true" CodeBehind="aplicativo_secuenciador_listado.aspx.cs" Inherits="Seminario.aplicativo_secuenciador_listado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_titulo" runat="server">
    Secuenciadores
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_cuerpo" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h3>Secuencias</h3>
            <asp:Button Text="Agregar secuencia" CssClass="btn btn-lg btn-link" OnClick="btn_agregar_secuenciador_Click" ID="btn_agregar_secuenciador" runat="server" />
            <br />
            <div class="alert alert-info">
                <div class="row">
                    <div class="col-md-11">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="input-group">
                                    <span class="input-group-addon">Area:</span>
                                    <select id="tb_filtro_area" runat="server" style="width: 100%">
                                        <option value="">Todos</option>
                                        <option value="Matemática">Matemática</option>
                                        <option value="Lengua">Lengua</option>
                                        <option value="Ciencias Sociales">Ciencias Sociales</option>
                                        <option value="Ciencias Naturales">Ciencias Naturales</option>
                                        <option value="Artistística">Artistística</option>
                                        <option value="Educacion Física">Educacion Física</option>
                                        <option value="Tecnología">Tecnología</option>
                                        <option value="Informática">Informática</option>
                                        <option value="Otro">Otro</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="input-group">
                                    <span class="input-group-addon">Asignatura:</span>
                                    <input type="text" name="tb_filtro_asignatura" id="tb_filtro_asignatura" runat="server" class="form-control" placeholder="Filtro asignatura" value="" />
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="input-group">
                                    <span class="input-group-addon">Instituto:</span>
                                    <input type="text" name="tb_filtro_asignatura" id="tb_filtro_instituto" runat="server" class="form-control" placeholder="Filtro instituto" value="" />
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="input-group">
                                    <span class="input-group-addon">Curso:</span>
                                    <select runat="server" id="tb_filtro_curso" style="width: 100%">
                                        <option value="">Todos</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-1">
                        <div class="row">
                            <div class="col-md-12 text-right">
                                <asp:Button Text="Buscar" runat="server" CssClass="btn btn-default" ID="btn_filtrar" OnClick="btn_filtrar_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:GridView runat="server" ID="gv_secuenciadores" AutoGenerateColumns="false" CssClass="table-responsive table table-bordered" OnRowCommand="SeleccionarRegistro">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" />
                    <asp:CheckBoxField ReadOnly="true" DataField="publico" HeaderText="Publico" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre secuencia" />
                    <asp:BoundField DataField="area" HeaderText="Área Académica" />
                    <asp:BoundField DataField="asignatura" HeaderText="Asignatura" />
                    <asp:BoundField DataField="curso" HeaderText="Curso" />
                    <asp:BoundField DataField="institucion" HeaderText="Institución" />

                    <asp:ButtonField CommandName="btn_seleccionar" Text="Seleccionar">
                        <ControlStyle CssClass="btn btn-info" />
                    </asp:ButtonField>

                    <asp:ButtonField CommandName="btn_imprimir" Text="Imprimir">
                        <ControlStyle CssClass="btn btn-default" />
                    </asp:ButtonField>

                </Columns>
            </asp:GridView>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            /*CLASE*/
            $('#<%=tb_filtro_area.ClientID %>').select2();

            $('#<%=tb_filtro_curso.ClientID %>').select2();

        });
    </script>

</asp:Content>
