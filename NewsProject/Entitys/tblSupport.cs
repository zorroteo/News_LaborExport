namespace NewsProject.Entitys
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblSupport")]
    public partial class tblSupport
    {
        public int Id { get; set; }

        public int? Creators { get; set; }

        [Required]
        [StringLength(50)]
        public string FullName { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(20)]
        public string Phone { get; set; }

        [Required]
        [StringLength(50)]
        public string Country { get; set; }

        [StringLength(50)]
        public string City { get; set; }

        [StringLength(50)]
        public string GradeLevel { get; set; }

        [Required]
        [StringLength(50)]
        public string Major { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime TimeExpected { get; set; }

        [Required]
        public string Question { get; set; }

        public short Status { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime CreateDate { get; set; }
    }
}
