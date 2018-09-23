namespace NewsProject.Entitys
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblGroup")]
    public partial class tblGroup
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblGroup()
        {
            Childrens = new HashSet<tblGroup>();
            News = new HashSet<tblNew>();
        }

        public short Id { get; set; }

        public int? Creators { get; set; }

        public short? ParentId { get; set; }

        [Required]
        [StringLength(1024)]
        public string Title { get; set; }

        [StringLength(1024)]
        public string Describe { get; set; }

        [Required]
        [StringLength(512)]
        public string Icon { get; set; }

        public short? Status { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime CreateDate { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime ModifyDate { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblGroup> Childrens { get; set; }

        public virtual tblGroup Parent { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblNew> News { get; set; }
    }
}
