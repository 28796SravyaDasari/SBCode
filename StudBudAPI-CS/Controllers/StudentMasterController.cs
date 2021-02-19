using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Data;
using StudbudAPI.Models;
using StudbudAPI.Services;

namespace StudbudAPI.Controllers
{
    public class StudentMasterController : ApiController
    {
        public DataTable Post(StudentMaster student) 
        {
            StudbudService ss = new StudbudService();
            return ss.StudentAddUpdate(student);
        }
    }
}
