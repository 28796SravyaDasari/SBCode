using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using StudbudAPI.Models;

namespace StudbudAPI.Services
{
    public class StudbudService
    {
        //Data Source=182.50.133.109;DATABASE=studbud;Integrated Security=False;User ID=studbud;pwd=Studbud12;Connect Timeout=15;Encrypt=False;Packet Size=4096
        static string strConnTest = "Data Source=182.50.133.109;DATABASE=studbud;Integrated Security=False;User ID=studbud;pwd=Studbud12;Connect Timeout=15;Encrypt=False;Packet Size=4096";
        public DataTable StudentAddUpdate(StudentMaster student)
        {
            SqlConnection sqlcon = new SqlConnection(strConnTest);
            DataTable dt = new DataTable();
            try
            {
                sqlcon.Open();
                SqlCommand sqlcom = new SqlCommand("StudentAddUpdate", sqlcon);
                sqlcom.CommandType = CommandType.StoredProcedure;

                if (student.Type == "AddStudent")
                {
                    sqlcom.Parameters.AddWithValue("@Type", DbType.String).Value = student.Type;
                    sqlcom.Parameters.AddWithValue("@EnrollNo", DbType.String).Value = student.EnrollmentNo;
                    sqlcom.Parameters.AddWithValue("@Name", DbType.String).Value = student.Name;
                    sqlcom.Parameters.AddWithValue("@Password", DbType.String).Value = student.Password;
                    sqlcom.Parameters.AddWithValue("@Lati", DbType.String).Value = student.Lati;
                    sqlcom.Parameters.AddWithValue("@Longi", DbType.String).Value = student.Longi;
                }
                sqlcom.CommandTimeout = 500;
                SqlDataReader dr = sqlcom.ExecuteReader();
                dt.Load(dr);
                sqlcon.Close();
                return dt;
            }
            catch (Exception ex)
            {
                sqlcon.Close();
                dt.Columns.Add("Error");
                dt.Rows.Add(ex.Message);
                return dt;

            }
        }
    }
}