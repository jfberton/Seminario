﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class seminarioDBContainer : DbContext
    {
        public seminarioDBContainer()
            : base("name=seminarioDBContainer")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Ubicacion> Ubicaciones { get; set; }
        public virtual DbSet<Secuenciador> Secuenciadores { get; set; }
        public virtual DbSet<Clase> Clases { get; set; }
        public virtual DbSet<Usuario> Usuarios { get; set; }
        public virtual DbSet<Localidad> Localidades { get; set; }
        public virtual DbSet<Region_Educativa> Regiones_Educativas { get; set; }
    }
}
