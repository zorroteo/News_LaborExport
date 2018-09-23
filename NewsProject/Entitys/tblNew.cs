namespace NewsProject.Entitys
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Web.Mvc;

    public partial class tblNew
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblNew()
        {
            tblComments = new HashSet<tblComment>();
        }

        public int Id { get; set; }

        public int Creators { get; set; }

        public short Group { get; set; }

        [Required]
        [StringLength(1024)]
        public string Titles { get; set; }

        [StringLength(1024)]
        public string Describe { get; set; }

        [Required]
        [AllowHtml]
        public string Content { get; set; }

        [StringLength(512)]
        public string Img { get; set; }

        [StringLength(512)]
        public string ImgResizer { get; set; }

        public short? Status { get; set; }

        public short? Position { get; set; }

        public short? Order { get; set; }

        public int? View { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime CreateDate { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime ModifyDate { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblComment> tblComments { get; set; }

        public virtual tblGroup tblGroup { get; set; }
    }
}
