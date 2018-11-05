<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="secuenciador_alta.aspx.cs" Inherits="Seminario.Aplicativo.secuenciador_alta" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link href="../css/bootstrap.css" rel="stylesheet" />
    <script src="../js/jquery-1.10.2.min.js"></script>
    <script src="../js/bootstrap.js"></script>

    <!-- include summernote css/js -->
    <link href="../summernote/dist/summernote.css" rel="stylesheet" />
    <script src="../summernote/dist/summernote.min.js"></script>

    <!--estilo del switch -->
    <style>
        .material-switch > input[type="checkbox"] {
            display: none;
        }

        .material-switch > label {
            cursor: pointer;
            height: 0px;
            position: relative;
            width: 40px;
        }

            .material-switch > label::before {
                background: rgb(0, 0, 0);
                box-shadow: inset 0px 0px 10px rgba(0, 0, 0, 0.5);
                border-radius: 8px;
                content: '';
                height: 16px;
                margin-top: -8px;
                position: absolute;
                opacity: 0.3;
                transition: all 0.4s ease-in-out;
                width: 40px;
            }

            .material-switch > label::after {
                background: rgb(255, 255, 255);
                border-radius: 16px;
                box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
                content: '';
                height: 24px;
                left: -4px;
                margin-top: -8px;
                position: absolute;
                top: -4px;
                transition: all 0.3s ease-in-out;
                width: 24px;
            }

        .material-switch > input[type="checkbox"]:checked + label::before {
            background: inherit;
            opacity: 0.5;
        }

        .material-switch > input[type="checkbox"]:checked + label::after {
            background: inherit;
            left: 20px;
        }
    </style>

    <!-- oculto la columna ID de la grilla clases -->
    <style>
        .Hide {
            display: none;
        }
    </style>


    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">

            <h1>Secuenciador</h1>
            <asp:HiddenField runat="server" ID="tb_id_sec" />

            <div class="row">
                <div class="col-md-3">
                    <ul class="list-group">
                        <li class="list-group-item">Hacer público
                           
                            <div class="material-switch pull-right">
                                <input id="someSwitchOptionSuccess" name="someSwitchOption001" type="checkbox" />
                                <label for="someSwitchOptionSuccess" class="label-success"></label>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

            <div>
                <ul class="nav nav-tabs" id="tab_secuenciador" role="tablist">
                    <li role="presentation" class="active"><a href="#tab_sec_datos_generales" role="tab" data-toggle="tab">
                        <h3>Datos Generales</h3>
                    </a></li>
                    <li role="presentation"><a href="#tab_sec_descripcion" role="tab" data-toggle="tab">
                        <h3>Descripción</h3>
                    </a></li>
                </ul>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="tab_sec_datos_generales">
                        <div class="panel-group" id="acordion_generales" role="tablist" aria-multiselectable="true">
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="enc_sec_gen_nombre">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse" data-parent="#acordion_generales" href="#SecGenNombre" aria-expanded="true" aria-controls="SecGenNombre">Nombre
                                        </a>
                                    </h4>
                                </div>
                                <div id="SecGenNombre" class="panel-collapse collapse" role="tabpanel" aria-labelledby="enc_sec_gen_nombre">
                                    <textarea class="form-control" runat="server" id="tb_sec_gen_nombre"></textarea>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="enc_sec_gen_area">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#acordion_generales" href="#SecGenArea" aria-expanded="false" aria-controls="SecGenArea">Área
                                        </a>
                                    </h4>
                                </div>
                                <div id="SecGenArea" class="panel-collapse collapse" role="tabpanel" aria-labelledby="enc_sec_gen_area">
                                    <textarea class="form-control" runat="server" id="tb_sec_gen_area"></textarea>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="enc_sec_gen_asignatura">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#acordion_generales" href="#SecGenAsignatura" aria-expanded="false" aria-controls="SecGenAsignatura">Asignatura
                                        </a>
                                    </h4>
                                </div>
                                <div id="SecGenAsignatura" class="panel-collapse collapse" role="tabpanel" aria-labelledby="enc_sec_gen_asignatura">
                                    <textarea class="form-control" runat="server" id="tb_sec_gen_asignatura"></textarea>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="enc_sec_gen_curso">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#acordion_generales" href="#SecGenCurso" aria-expanded="false" aria-controls="SecGenCurso">Curso
                                        </a>
                                    </h4>
                                </div>
                                <div id="SecGenCurso" class="panel-collapse collapse" role="tabpanel" aria-labelledby="enc_sec_gen_curso">
                                    <textarea class="form-control" runat="server" id="tb_sec_gen_curso"></textarea>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="enc_sec_gen_institucion">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#acordion_generales" href="#SecGenInstitucion" aria-expanded="false" aria-controls="SecGenInstitucion">Institución
                                        </a>
                                    </h4>
                                </div>
                                <div id="SecGenInstitucion" class="panel-collapse collapse" role="tabpanel" aria-labelledby="enc_sec_gen_institucion">
                                    <textarea class="form-control" runat="server" id="tb_sec_gen_institucion"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="tab_sec_descripcion">
                        <div class="panel-group" id="acordion_descripcion" role="tablist" aria-multiselectable="true">
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="enc_sec_desc_tema">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse" data-parent="#acordion_descripcion" href="#SecDescTema" aria-expanded="true" aria-controls="SecDescTema">Tema General
                                        </a>
                                    </h4>
                                </div>
                                <div id="SecDescTema" class="panel-collapse collapse" role="tabpanel" aria-labelledby="enc_sec_desc_tema">
                                    <textarea class="form-control" runat="server" id="tb_sec_desc_tema"></textarea>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="enc_sec_desc_contenidos">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#acordion_descripcion" href="#SecDescContenidos" aria-expanded="false" aria-controls="SecDescContenidos">Contenidos
                                        </a>
                                    </h4>
                                </div>
                                <div id="SecDescContenidos" class="panel-collapse collapse" role="tabpanel" aria-labelledby="enc_sec_desc_contenido">
                                    <textarea class="form-control" runat="server" id="tb_sec_desc_contenido"></textarea>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="enc_sec_desc_num_clases">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#acordion_descripcion" href="#SecDescClases" aria-expanded="false" aria-controls="SecGenAsignatura">Clases <span class="badge">
                                            <asp:Label Text="0" ID="lbl_cantidad_clases" runat="server" /></span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="SecDescClases" class="panel-collapse collapse" role="tabpanel" aria-labelledby="enc_sec_desc_num_clases">
                                    <div class="panel-body">
                                        <asp:Button Text="Agregar clase" ID="btn_agregar_clase" CssClass="btn btn-success" OnClick="btn_agregar_clase_Click" runat="server" />


                                        <asp:GridView runat="server" ID="gv_clases" AutoGenerateColumns="false" CssClass="table-responsive table table-bordered" OnRowCommand="SeleccionarRegistro">
                                            <Columns>
                                                <asp:BoundField DataField="id" ItemStyle-CssClass="Hide" HeaderStyle-CssClass="Hide" HeaderText="ID" />
                                                <asp:BoundField DataField="numero" HeaderText="Nro" />

                                                <asp:ButtonField CommandName="btn_seleccionar" Text="Seleccionar">
                                                    <ControlStyle CssClass="btn btn-info" />
                                                </asp:ButtonField>

                                            </Columns>
                                        </asp:GridView>


                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="enc_sec_desc_autor">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#acordion_descripcion" href="#SecDescAutor" aria-expanded="false" aria-controls="SecDescAutor">Autor
                                        </a>
                                    </h4>
                                </div>
                                <div id="SecDescAutor" class="panel-collapse collapse" role="tabpanel" aria-labelledby="enc_sec_desc_autor">
                                    <textarea class="form-control" runat="server" id="tb_sec_desc_autor"></textarea>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="enc_sec_desc_capacidades">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#acordion_descripcion" href="#SecDescCapacidades" aria-expanded="false" aria-controls="SecDescCapacidades">Capacidades a desarrollar
                                        </a>
                                    </h4>
                                </div>
                                <div id="SecDescCapacidades" class="panel-collapse collapse" role="tabpanel" aria-labelledby="enc_sec_desc_capacidades">
                                    <textarea class="form-control" runat="server" id="tb_sec_desc_capacidades"></textarea>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="enc_sec_desc_propositos">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#acordion_descripcion" href="#SecDescPropositos" aria-expanded="false" aria-controls="SecDescPropositos">Propósitos
                                        </a>
                                    </h4>
                                </div>
                                <div id="SecDescPropositos" class="panel-collapse collapse" role="tabpanel" aria-labelledby="enc_sec_desc_capacidades">
                                    <textarea class="form-control" runat="server" id="tb_sec_desc_propositos"></textarea>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="enc_sec_desc_objetivos">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#acordion_descripcion" href="#SecDescObjetivo" aria-expanded="false" aria-controls="SecDescObjetivo">Objetivos
                                        </a>
                                    </h4>
                                </div>
                                <div id="SecDescObjetivo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="enc_sec_desc_capacidades">
                                    <textarea class="form-control" runat="server" id="tb_sec_desc_objetivos"></textarea>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="enc_sec_desc_metodologia">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#acordion_descripcion" href="#SecDescMetodologia" aria-expanded="false" aria-controls="SecDescMetodologia">Metodología
                                        </a>
                                    </h4>
                                </div>
                                <div id="SecDescMetodologia" class="panel-collapse collapse" role="tabpanel" aria-labelledby="enc_sec_desc_capacidades">
                                    <textarea class="form-control" runat="server" id="tb_sec_desc_metodologia"></textarea>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="enc_sec_desc_evaluacion">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#acordion_descripcion" href="#SecDescEvaluacion" aria-expanded="false" aria-controls="SecDescEvaluacion">Orientaciones Generales de Evaluación
                                        </a>
                                    </h4>
                                </div>
                                <div id="SecDescEvaluacion" class="panel-collapse collapse" role="tabpanel" aria-labelledby="enc_sec_desc_evaluacion">
                                    <textarea class="form-control" runat="server" id="tb_sec_desc_evaluacion"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <asp:Button Text="Guardar" CssClass="btn btn-lg btn-success" runat="server" ID="btn_sec_guardar" OnClick="btn_sec_guardar_Click" UseSubmitBehavior="false" />
            <asp:Button Text="Eliminar" CssClass="btn btn-lg btn-danger" runat="server" ID="btn_sec_eliminar" OnClick="btn_sec_eliminar_Click" UseSubmitBehavior="false" />
            <asp:Button Text="Volver" CssClass="btn btn-lg btn-default" runat="server" ID="btn_sec_volver" OnClick="btn_sec_volver_Click" UseSubmitBehavior="false" />

            <!-- Modal clase -->
            <div class="modal fade" id="modal_clase" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Datos de la clase</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-3">Nombre/Número clase</div>
                                <div class="col-md-9">
                                    <input type="text" runat="server" id="tb_clase_numero" class="form-control" placeholder="Ej: Clase 1 o Clase de apoyo" /></div>
                            </div>
                            <asp:HiddenField runat="server" ID="tb_ID_clase" />

                            <div>

                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs" role="tablist">
                                    <li role="presentation" class="active"><a href="#tab_apertura" role="tab" data-toggle="tab">Act. apertura</a></li>
                                    <li role="presentation"><a href="#tab_desarrollo" role="tab" data-toggle="tab">Act. desarrollo</a></li>
                                    <li role="presentation"><a href="#tab_cierre" role="tab" data-toggle="tab">Act. cierre</a></li>
                                    <li role="presentation"><a href="#tab_aprendizaje" role="tab" data-toggle="tab">Evidencias aprendizaje</a></li>
                                    <li role="presentation"><a href="#tab_bibliografia" role="tab" data-toggle="tab">Recursos - Bibliografia</a></li>
                                </ul>

                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane active" id="tab_apertura">
                                        <textarea runat="server" id="tb_clase_apertura" class="form-control"></textarea>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="tab_desarrollo">
                                        <textarea runat="server" id="tb_clase_desarrollo" class="form-control"></textarea>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="tab_cierre">
                                        <textarea runat="server" id="tb_clase_cierre" class="form-control"></textarea>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="tab_aprendizaje">
                                        <textarea runat="server" id="tb_clase_aprendizaje" class="form-control"></textarea>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="tab_bibliografia">
                                        <textarea runat="server" id="tb_clase_bibliografia" class="form-control"></textarea>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button Text="Agregar" OnClick="btn_clase_agregar_Click" CssClass="btn btn-success" ID="btn_clase_agregar" runat="server" UseSubmitBehavior="false" />
                            <asp:Button Text="Modificar" CssClass="btn btn-warning" OnClick="btn_clase_modificar_Click" ID="btn_clase_modificar" Enabled="false" runat="server" UseSubmitBehavior="false" />
                            <asp:Button Text="Eliminar" CssClass="btn btn-danger" OnClick="btn_clase_eliminar_Click" ID="btn_clase_eliminar" Enabled="false" runat="server" UseSubmitBehavior="false" />

                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </form>

    <script>
        $(document).ready(function () {
            /*CLASE*/
            $('#<%=tb_clase_apertura.ClientID %>').summernote({
                placeholder: 'Ingrese aquí las actividades de apertura',
                tabsize: 2,
                height: 200
            });
            $('#<%=tb_clase_desarrollo.ClientID %>').summernote({
                placeholder: 'Ingrese aquí las actividades de desarrollo',
                tabsize: 2,
                height: 200
            });
            $('#<%=tb_clase_cierre.ClientID %>').summernote({
                placeholder: 'Ingrese aquí las actividades de cierre',
                tabsize: 2,
                height: 200
            });
            $('#<%=tb_clase_aprendizaje.ClientID %>').summernote({
                placeholder: 'Ingrese aquí las evidencias de aprendizaje',
                tabsize: 2,
                height: 200
            });
            $('#<%=tb_clase_bibliografia.ClientID %>').summernote({
                placeholder: 'Ingrese aquí los recursos bibliográficos',
                tabsize: 2,
                height: 200
            });

            /*SECUENCIADOR*/
            $('#<%=tb_sec_desc_capacidades.ClientID %>').summernote({
                tabsize: 2,
                height: 200
            });
            $('#<%=tb_sec_desc_contenido.ClientID %>').summernote({
                tabsize: 2,
                height: 200
            });
            $('#<%=tb_sec_desc_evaluacion.ClientID %>').summernote({
                tabsize: 2,
                height: 200
            });

            $('#<%=tb_sec_desc_metodologia.ClientID %>').summernote({
                tabsize: 2,
                height: 200
            });

            $('#<%=tb_sec_desc_objetivos.ClientID %>').summernote({
                tabsize: 2,
                height: 200
            });

            $('#<%=tb_sec_desc_propositos.ClientID %>').summernote({
                tabsize: 2,
                height: 200
            });

            $('#<%=tb_sec_desc_tema.ClientID %>').summernote({
                tabsize: 2,
                height: 200
            });

        });
    </script>

</body>
</html>
