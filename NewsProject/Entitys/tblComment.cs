namespace NewsProject.Entitys
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblComment")]
    public partial class tblComment
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblComment()
        {
            tblComment1 = new HashSet<tblComment>();
        }

        public long Id { get; set; }

        public long? ParentId { get; set; }

        public int News { get; set; }

        [Required]
        [StringLength(64)]
        public string Name { get; set; }

        [StringLength(64)]
        public string Email { get; set; }

        [StringLength(64)]
        public string PhoneNumber { get; set; }

        public string Content { get; set; }

        public short? Status { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime CreateDate { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime ModifyDate { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblComment> tblComment1 { get; set; }

        public virtual tblComment tblComment2 { get; set; }

        public virtual tblNew tblNew { get; set; }
    }
}
