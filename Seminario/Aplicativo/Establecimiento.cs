//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Seminario.Aplicativo
{
    using System;
    using System.Collections.Generic;
    
    public partial class Establecimiento
    {
        public int establecimiento_id { get; set; }
        public int region_educativa_id { get; set; }
        public string establecimiento_nombre { get; set; }
        public string establecimiento_ambito { get; set; }
        public string establecimiento_modalidad { get; set; }
        public string establecimiento_sector { get; set; }
        public int localidad_id { get; set; }
        public string establecimiento_direccion { get; set; }
        public string establecimiento_telefono { get; set; }
        public string establecimiento_mail { get; set; }
        public string establecimiento_web { get; set; }
        public string establecimiento_orientaciones { get; set; }
        public string establecimiento_longitud { get; set; }
        public string establecimiento_latitud { get; set; }
    
        public virtual Region_Educativa Region_Educativa { get; set; }
        public virtual Localidad Localidad { get; set; }
    }
}
