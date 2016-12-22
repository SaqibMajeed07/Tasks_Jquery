//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;
//using BCL;
//namespace DAL
//{
//   public class StudentHandler
//    {
//        StudentContext dbobj = new StudentContext();
//        public List<Student> show()
//        {
//            var data = (from s in dbobj.Students select s).ToList();
//            return data;
//        }
//        public string SaveStudent(Student[] data)
//        {
//            Student student = new Student();
//            foreach (Student user in data)
//            {
//                student.StudentID = user.StudentID;
//                student.FirstName = user.FirstName;
//                student.LastName = user.LastName;
//                student.Gender = user.Gender;
//                student.Address = user.Address;
//            }
//                dbobj.Students.Add(student);

//            return "Data Saved Successfully";
//        }
//    }
//}
