namespace NewsProject.Commons
{
    public enum Status
    {
        Deleted = 0, InActive = 1, Active = 2, New = 3, Handling = 4, NotHandling = 5
    }

    public enum NumberPaging
    {
        Small = 5, Medium = 10, Normal = 15, Big = 20, VeryBig = 30
    }

    /// <summary>
    /// Decentralize in function
    /// </summary>
    public enum Decentralize
    {
        /// <summary>
        /// All rights reserved
        /// </summary>
        Client = -1,

        /// <summary>
        /// All rights reserved
        /// </summary>
        Admin = 1,

        /// <summary>
        /// Has the ability to add, edit, delete, view post details
        /// </summary>
        Employees = 2,

        /// <summary>
        /// Have permission to view post details, not add, edit, delete
        /// </summary>
        Limit = 3
    }

    public enum Session
    {
        UserName = 1, Email = 2, Decentralize = 3, Status = 4, Id = 5
    }

    public enum Permissions
    {
        View = 1,
        Create = 2,
        Edit = 3,
        Delete = 4
    }
}