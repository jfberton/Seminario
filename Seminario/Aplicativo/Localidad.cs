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
    
    public partial class Localidad
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Localidad()
        {
            this.Establecimientos = new HashSet<Establecimiento>();
        }
    
        public int localidad_id { get; set; }
        public string localidad_nombre { get; set; }
        public string localidad_departamento { get; set; }
        public string localidad_tipo { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Establecimiento> Establecimientos { get; set; }
    }
}
