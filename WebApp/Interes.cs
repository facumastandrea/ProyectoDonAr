//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebApp
{
    using System;
    using System.Collections.Generic;
    
    public partial class Interes
    {
        public int Id { get; set; }
        public string idUsuario { get; set; }
        public Nullable<int> idTipoProyecto { get; set; }
    
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual TiposProyecto TiposProyecto { get; set; }
    }
}