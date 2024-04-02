namespace IBASEmployeeService.Models
{
    /// <summary>
    /// POCO for employee data
    /// </summary>
    public class Employee
    {
        public string? Id { get; set; }

        public string Name { get; set; }

        public string? Email { get; set; }

        public Department? Department { get; set; }

        public Employee()
        {
            this.Name = "undefined";
        }

    }
}
