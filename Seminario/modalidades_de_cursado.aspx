<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="modalidades_de_cursado.aspx.cs" Inherits="Seminario.modalidades_de_cursado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
    <meta name="generator" content="2017.0.2.363" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <script type="text/javascript">
        // Update the 'nojs'/'js' class on the html node
        document.documentElement.className = document.documentElement.className.replace(/\bnojs\b/g, 'js');

        // Check that all required assets are uploaded and up-to-date
        if (typeof Muse == "undefined") window.Muse = {}; window.Muse.assets = { "required": ["museutils.js", "museconfig.js", "jquery.watch.js", "jquery.musemenu.js", "require.js", "modalidades-de-cursado.css"], "outOfDate": [] };
</script>

    <link rel="shortcut icon" href="images/favicon.ico?crc=424358116" />
    <title>Modalidades de CursadoUTN-FRRE</title>
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="css/site_global.css?crc=509060146" />
    <link rel="stylesheet" type="text/css" href="css/master_a-p_g_-maestra.css?crc=4032443142" />
    <link rel="stylesheet" type="text/css" href="css/modalidades-de-cursado.css?crc=477286938" id="pagesheet" />
    <!-- JS includes -->
    <!--[if lt IE 9]>
  <script src="scripts/html5shiv.js?crc=4241844378" type="text/javascript"></script>
  <![endif]-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_cuerpo" runat="server">

    <div class="clearfix grpelem" id="u10075">
        <!-- column -->
        <div class="clearfix colelem" id="u5405-4">
            <!-- content -->
            <p>Modalidades de Cursado</p>
        </div>
        <div class="clearfix colelem" id="u4711-5">
            <!-- content -->
            <p>&nbsp;</p>
            <p>Se proponen dos sistemas de cursado</p>
        </div>
        <div class="clearfix colelem" id="u10072">
            <!-- column -->
            <div class="clearfix colelem" id="pu4712">
                <!-- group -->
                <div class="grpelem" id="u4712">
                    <!-- simple frame -->
                </div>
                <div class="clearfix grpelem" id="u4713-5">
                    <!-- content -->
                    <p>Semipresencial (Blended Learning). <span id="u4713-2">En esta modalidad se combinan encuentros presenciales y de e-learning.</span></p>
                </div>
            </div>
            <div class="clearfix colelem" id="u4714-25">
                <!-- content -->
                <p>Se cuenta con dos turnos:</p>
                <p>&nbsp;</p>
                <ul class="list0 nls-None" id="u4714-7">
                    <li><span id="u4714-4">Primer turno</span>: se desarrolla entre los meses de mayo y noviembre, donde los alumnos cursan los días sábados por la mañana de manera presencial, en el horario de 8 a 12:10 hs</li>
                </ul>
                <p>El desarrollo de las actividades se continúa en el aula virtual del campus de la facultad.</p>
                <p>Los materiales respectivos a cada módulo son digitales a los cuales se accede, en el aula del campus virtual, una vez comenzado el cursado mediante un usuario y contraseña.</p>
                <p>Pueden cursarlo estudiantes que se encuentran en el último año del Nivel Secundario.</p>
                <p>&nbsp;</p>
                <ul class="list0 nls-None" id="u4714-18">
                    <li><span id="u4714-15">Segundo Turno:</span> este turno es intensivo y se desarrolla durante el mes de febrero de lunes a viernes por la tarde&nbsp; en el horario de 17 a 21 hs, y sábados por la mañana de 8 a 12:10 hs.</li>
                </ul>
                <p>Los estudiantes tendrán acceso a talleres presenciales y actividades virtuales. Los materiales se dispondrán en el aula virtual.</p>
                <p>&nbsp;</p>
                <p>Sistema de acreditación en la modalidad semipresencial: Cada módulo cuenta con talleres de avances que los alumnos deben transitar y aprobar, e instancias de recuperación.</p>
            </div>
            <div class="clearfix colelem" id="pu4715">
                <!-- group -->
                <div class="grpelem" id="u4715">
                    <!-- simple frame -->
                </div>
                <div class="clearfix grpelem" id="u4717-4">
                    <!-- content -->
                    <p>Libre</p>
                </div>
            </div>
            <div class="clearfix colelem" id="u4718-8">
                <!-- content -->
                <p>Esta&nbsp; modalidad se aplica para aquellos aspirantes que no deseen acceder a los talleres presenciales. Tendrán acceso al aula virtual, donde podrán consultar los materiales de estudio y realizar actividades virtuales de autoevaluación.</p>
                <p>Los estudiantes que elijan esta modalidad accederán a un taller de revisión donde podrán realizar las consultas necesarias para acceder al examen final llamado prueba de competencia.</p>
                <p>Una prueba de competencia consiste en un examen integrador de los contenidos del módulo.</p>
            </div>
        </div>
    </div>
    <!-- Other scripts -->
    <script type="text/javascript">
        window.Muse.assets.check = function (d) {
            if (!window.Muse.assets.checked) {
                window.Muse.assets.checked = !0; var b = {}, c = function (a, b) { if (window.getComputedStyle) { var c = window.getComputedStyle(a, null); return c && c.getPropertyValue(b) || c && c[b] || "" } if (document.documentElement.currentStyle) return (c = a.currentStyle) && c[b] || a.style && a.style[b] || ""; return "" }, a = function (a) {
                    if (a.match(/^rgb/)) return a = a.replace(/\s+/g, "").match(/([\d\,]+)/gi)[0].split(","), (parseInt(a[0]) << 16) + (parseInt(a[1]) << 8) + parseInt(a[2]); if (a.match(/^\#/)) return parseInt(a.substr(1),
                 16); return 0
                }, g = function (g) {
                    for (var f = document.getElementsByTagName("link"), h = 0; h < f.length; h++) if ("text/css" == f[h].type) { var i = (f[h].href || "").match(/\/?css\/([\w\-]+\.css)\?crc=(\d+)/); if (!i || !i[1] || !i[2]) break; b[i[1]] = i[2] } f = document.createElement("div"); f.className = "version"; f.style.cssText = "display:none; width:1px; height:1px;"; document.getElementsByTagName("body")[0].appendChild(f); for (h = 0; h < Muse.assets.required.length;) {
                        var i = Muse.assets.required[h], l = i.match(/([\w\-\.]+)\.(\w+)$/), k = l && l[1] ?
                        l[1] : null, l = l && l[2] ? l[2] : null; switch (l.toLowerCase()) { case "css": k = k.replace(/\W/gi, "_").replace(/^([^a-z])/gi, "_$1"); f.className += " " + k; k = a(c(f, "color")); l = a(c(f, "backgroundColor")); k != 0 || l != 0 ? (Muse.assets.required.splice(h, 1), "undefined" != typeof b[i] && (k != b[i] >>> 24 || l != (b[i] & 16777215)) && Muse.assets.outOfDate.push(i)) : h++; f.className = "version"; break; case "js": h++; break; default: throw Error("Unsupported file type: " + l); }
                    } d ? d().jquery != "1.8.3" && Muse.assets.outOfDate.push("jquery-1.8.3.min.js") : Muse.assets.required.push("jquery-1.8.3.min.js");
                    f.parentNode.removeChild(f); if (Muse.assets.outOfDate.length || Muse.assets.required.length) f = "Puede que determinados archivos falten en el servidor o sean incorrectos. Limpie la cache del navegador e inténtelo de nuevo. Si el problema persiste, póngase en contacto con el administrador del sitio web.", g && Muse.assets.outOfDate.length && (f += "\nOut of date: " + Muse.assets.outOfDate.join(",")), g && Muse.assets.required.length && (f += "\nMissing: " + Muse.assets.required.join(",")), alert(f)
                }; location && location.search && location.search.match && location.search.match(/muse_debug/gi) ? setTimeout(function () { g(!0) }, 5E3) : g()
            }
        };
        var muse_init = function () {
            require.config({ baseUrl: "" }); require(["jquery", "museutils", "whatinput", "jquery.watch", "jquery.musemenu"], function (d) {
                var $ = d; $(document).ready(function () {
                    try {
                        window.Muse.assets.check($);/* body */
                        Muse.Utils.transformMarkupToFixBrowserProblemsPreInit();/* body */
                        Muse.Utils.prepHyperlinks(true);/* body */
                        Muse.Utils.resizeHeight('.browser_width');/* resize height */
                        Muse.Utils.requestAnimationFrame(function () { $('body').addClass('initialized'); });/* mark body as initialized */
                        Muse.Utils.fullPage('#page');/* 100% height page */
                        Muse.Utils.initWidget('.MenuBar', ['#bp_infinity'], function (elem) { return $(elem).museMenu(); });/* unifiedNavBar */
                        Muse.Utils.showWidgetsWhenReady();/* body */
                        Muse.Utils.transformMarkupToFixBrowserProblems();/* body */
                    } catch (b) { if (b && "function" == typeof b.notify ? b.notify() : Muse.Assert.fail("Error calling selector function: " + b), false) throw b; }
                })
            })
        };
    </script>
    <!-- RequireJS script -->
    <script src="scripts/require.js?crc=4234670167" type="text/javascript" async data-main="scripts/museconfig.js?crc=4152223963" onload="if (requirejs) requirejs.onError = function(requireType, requireModule) { if (requireType && requireType.toString && requireType.toString().indexOf && 0 <= requireType.toString().indexOf('#scripterror')) window.Muse.assets.check(); }" onerror="window.Muse.assets.check();"></script>

</asp:Content>
