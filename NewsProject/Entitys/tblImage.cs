namespace NewsProject.Entitys
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblImage")]
    public partial class tblImage
    {
        public int Id { get; set; }

        public int? Creators { get; set; }

        [Required]
        [StringLength(512)]
        public string Img { get; set; }

        [StringLength(512)]
        public string ImgResizer { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime CreateDate { get; set; }
    }
}
