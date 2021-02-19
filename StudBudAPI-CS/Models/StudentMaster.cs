using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StudbudAPI.Models
{
    public class StudentMaster
    {
        public string Type { get; set; }
        public string Id { get; set; }
        public string Name { get; set; }
        public string Password { get; set; }
        public string EnrollmentNo { get; set; }
        public string Lati { get; set; }
        public string Longi { get; set; }
        public string Email { get; set; }
        public string Mobile { get; set; }
    }
}