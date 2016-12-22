//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using BCL;
//namespace Tasks_Jquery
//{
//    public partial class WebForm2 : System.Web.UI.Page
//    {
       
//        protected void Page_Load(object sender, EventArgs e)
//        {
 
//        }


           

//            public static List<Student> show()
//            {
//            StudentContext dbobj = new StudentContext();
//            var data = (from s in dbobj.Students select s).ToList();
//                return data;
//            }
//            public static string SaveStudent(Student[] data)
//            {
//            StudentContext dbobj = new StudentContext();
//            Student student = new Student();
//                foreach (Student user in data)
//                {
//                    student.StudentID = user.StudentID;
//                    student.FirstName = user.FirstName;
//                    student.LastName = user.LastName;
//                    student.Gender = user.Gender;
//                    student.Address = user.Address;
//                }
//                dbobj.Students.Add(student);
//                dbobj.SaveChanges();

//                return "Data Saved Successfully";
//            }
//        }
//    }
