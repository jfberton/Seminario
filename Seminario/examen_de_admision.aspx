<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="examen_de_admision.aspx.cs" Inherits="Seminario.Pagina.examen_de_admision" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
    <meta name="generator" content="2017.0.2.363" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <script type="text/javascript">
        // Update the 'nojs'/'js' class on the html node
        document.documentElement.className = document.documentElement.className.replace(/\bnojs\b/g, 'js');

        // Check that all required assets are uploaded and up-to-date
        if (typeof Muse == "undefined") window.Muse = {}; window.Muse.assets = { "required": ["museutils.js", "museconfig.js", "jquery.watch.js", "jquery.musemenu.js", "require.js", "ex_men-de-admisi_n.css"], "outOfDate": [] };
</script>

    <link rel="shortcut icon" href="images/favicon.ico?crc=424358116" />
    <title>Exámen de AdmisiónUTN-FRRE</title>
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="css/site_global.css?crc=509060146" />
    <link rel="stylesheet" type="text/css" href="css/master_a-p_g_-maestra.css?crc=4032443142" />
    <link rel="stylesheet" type="text/css" href="css/ex_men-de-admisi_n.css?crc=358206818" id="pagesheet" />
    <!-- JS includes -->
    <!--[if lt IE 9]>
  <script src="scripts/html5shiv.js?crc=4241844378" type="text/javascript"></script>
  <![endif]-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_cuerpo" runat="server">


    <!-- group -->
    <div class="clearfix grpelem" id="u10078">
        <!-- column -->
        <div class="clearfix colelem" id="u5596-4">
            <!-- content -->
            <p>Examen de Admisión</p>
        </div>
        <div class="clearfix colelem" id="u4780-22">
            <!-- content -->
            <p id="u4780-2">El Examen de Admisión&nbsp; constituye una instancia de evaluación opcional que se puede&nbsp; rendir antes del&nbsp; inicio del cursado de cada turno del Seminario Universitario (SU).&nbsp; Es un examen integral que permite al alumno que decide rendirlo acreditar los Módulos del SU sin necesidad de cursarlos.</p>
            <p id="u4780-4">Dado que es una alternativa no obligatoria, el aspirante puede inscribirse a uno, a dos o a los tres Módulos.</p>
            <p id="u4780-5">&nbsp;</p>
            <p id="u4780-7">Aquellos estudiantes que se aprueben el Examen de Admisión, del módulo elegido, no deberán cursar el mismo. En cambio, el Módulo o los Módulos restantes, no aprobados por Examen de Admisión, deberán cursarse en el turno correspondiente del SU.</p>
            <p id="u4780-8">&nbsp;</p>
            <p id="u4780-10">En caso del que el alumno apruebe los tres Módulos por esta vía, no deberá cursar el SU. Deberá inscribirse directamente al 1° año de la carrera que haya elegido, durante las fechas que determine el Departamento de Alumnado de la Facultad en forma oportuna.</p>
            <p id="u4780-11">&nbsp;</p>
            <p id="u4780-13">Para poder rendir los Exámenes de Admisión el estudiante debe&nbsp; realizar los siguientes pasos:</p>
            <ol class="list0 nls-None" id="u4780-18">
                <li id="u4780-15">Inscribirse al Seminario Universitario.</li>
                <li id="u4780-17">Una vez formalizada la inscripción debés inscribirte para rendir el examen de admisión en el período de tiempo establecido. La inscripción a los exámenes se realiza en la oficina del Seminario Universitario en el horario de 17:00 a 21:00 hs.</li>
            </ol>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
        </div>
        <div class="clearfix colelem" id="pu5685-16">
            <!-- group -->
            <div class="clearfix grpelem" id="u5685-16">
                <!-- content -->
                <p id="u5685-2">Cursos Abiertos</p>
                <p id="u5685-3">&nbsp;</p>
                <p id="u5685-5">Contamos con cursos abiertos en el campus virtual, donde podrás encontrar los materiales necesarios para prepararte para los exámenes de admisión, en el área de Ingreso y Permanencia/Cursos Abiertos para Ingresantes, bajo el perfil de Invitado .</p>
                <p id="u5685-6">&nbsp;</p>
                <p><a class="nonblock" href="http://www.cvfrre.com.ar" target="_blank">http://www.cvfrre.com.ar</a></p>
                <p>&nbsp;</p>
                <p id="u5685-11">&nbsp;</p>
                <p id="u5685-13">Accede a través del siguiente código QR.</p>
                <p id="u5685-14">&nbsp;</p>
            </div>
            <div class="clip_frame grpelem" id="u5803">
                <!-- image -->
                <img class="block" id="u5803_img" src="images/qr%20cursos%20abiertos.jpg?crc=392420176" alt="" width="180" height="180" />
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
