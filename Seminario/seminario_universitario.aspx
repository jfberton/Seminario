<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="seminario_universitario.aspx.cs" Inherits="Seminario.seminario_universitario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
    <meta name="generator" content="2017.0.2.363" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <script type="text/javascript">
        // Update the 'nojs'/'js' class on the html node
        document.documentElement.className = document.documentElement.className.replace(/\bnojs\b/g, 'js');

        // Check that all required assets are uploaded and up-to-date
        if (typeof Muse == "undefined") window.Muse = {}; window.Muse.assets = { "required": ["museutils.js", "museconfig.js", "jquery.watch.js", "jquery.musemenu.js", "require.js", "seminario-universitario.css"], "outOfDate": [] };
</script>

    <link rel="shortcut icon" href="images/favicon.ico?crc=424358116" />
    <title>Seminario UniversitarioUTN-FRRE</title>
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="css/site_global.css?crc=509060146" />
    <link rel="stylesheet" type="text/css" href="css/master_a-p_g_-maestra.css?crc=4032443142" />
    <link rel="stylesheet" type="text/css" href="css/seminario-universitario.css?crc=48821636" id="pagesheet" />
    <!-- JS includes -->
    <!--[if lt IE 9]>
  <script src="scripts/html5shiv.js?crc=4241844378" type="text/javascript"></script>
  <![endif]-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_cuerpo" runat="server">


            <div class="clearfix colelem" id="pu5366">
                <!-- group -->
                <div class="grpelem" id="u5366">
                    <!-- content -->
                    <div class="fluid_height_spacer"></div>
                </div>
                <div class="clip_frame grpelem" id="u5005">
                    <!-- image -->
                    <img class="block" id="u5005_img" src="images/logo1.jpg?crc=3914113445" alt="" width="794" height="622" />
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
