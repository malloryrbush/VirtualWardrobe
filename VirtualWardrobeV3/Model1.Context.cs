﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace VirtualWardrobeV3
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class VirtualWardobeV3Entities : DbContext
    {
        public VirtualWardobeV3Entities()
            : base("name=VirtualWardobeV3Entities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Accessory> Accessories { get; set; }
        public virtual DbSet<Bottom> Bottoms { get; set; }
        public virtual DbSet<Clothing> Clothings { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<Sho> Shoes { get; set; }
        public virtual DbSet<Top> Tops { get; set; }
    }
}
