using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCL;
using System.Web.Services;

namespace Tasks_Jquery
{
    public partial class WebForm2 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static Student[] showstudents()
        {
            MyStudentsEntities db = new MyStudentsEntities();
            var data = (from s in db.Students select s).ToArray();
            return data;
        }
        [WebMethod]
        public static string SaveStudent(Student[] data)
        {
            MyStudentsEntities db = new MyStudentsEntities();
            Student student = new Student();
            foreach (Student user in data)
            {
              
                student.StudentId = user.StudentId;
                student.StudentName = user.StudentName;
                student.StudentAddress = user.StudentAddress;
            }
            db.Students.Add(student);
            return "Data Saved Successfully";

        }
        [WebMethod]
        public static void DeleteStudent(Student data)
        {
            MyStudentsEntities db = new MyStudentsEntities();
            var deletestudent = db.Students.FirstOrDefault(user => user.StudentId == data.StudentId);
            db.Students.Remove(deletestudent);
        }
    }
}

      