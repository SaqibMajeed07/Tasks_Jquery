<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Tasks_Jquery.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/knockout-3.4.0.js"></script>
    <script src="Scripts/jquery-3.1.1.min.js"></script>
</head>
<body>
  <div>
      <h2>
          List Of Students
      </h2>
      <table>
          <tr>
              <th>Student ID</th>
              <th>Student Name</th>
              <th>Student Address</th>
          </tr>
          <tbody data-bind="foreach: Students"></tbody>
          <tr>
              <td><span data-bind="text: StudentID" /></td>
              <td><span data-bind="text: StudentName"/></td>
              <td> <span data-bind="text: StudentAddress" /></td>
              <td><button type="submit" data-bind="click: DeleteStudent"> Delete</button></td>
          </tr>
      </table>
      <hr />
  </div>
    <div>
        <h2>Insert New Student</h2>
        <table>
            <tr>
                <td> Student ID:</td>
                <td> <input type="text" data-bind="value: StudentID"/></td>
                <td> <span data-bind="text: StudentID" ></span></td>
            </tr>
            <tr>
                <td>Student Name:</td>
                <td> <input type="text" data-bind="value: StudentName" /> </td>
                <td><span data-bind="text: StudentName" ></span></td>
            </tr>
            <tr>
                <td> Student Address</td>
                <td> <input type="text" data-bind="value: StudentAddress"/></td>
                <td> <span data-bind="text: StudentAddress"></span></td>
            </tr>
            <tr>
            <td> <button type="submit" data-bind="click: SaveStudent" > Insert Student</button></td>
                </tr>
        </table>
    </div>
    <script>
        var StudentViewModel=  function (data)
        {
            var self = this;
            self.StudentID = ko.observable();
            self.StudentName = ko.observable();
            self.StudentAddress = ko.observable();
            self.Students = ko.observableArray(data);
          
            self.SaveStudent = function () {
                $.ajax({
                    type: "POST",
                    url: "Webform2.aspx/SaveStudent",
                    contentType: "application/json; charset=utf-8",
                    success: function (result) {
                        alert(result.d);
                    },
                });
            };

            self.DeleteStudent = function (student) {
                $.ajax({
                    type: "POST",
                    url: "Webform2.aspx/DeleteStudent",
                    contentType: "application/json; charset=utf-8",
                    success: function (result) {
                        alert(result.d);
                        self.Students.remove(student)
                    },
                });
            };

            self.FetchStudents = function () {
                $.ajax({
                    type: "POST",
                    url: "Webform2.aspx/showstudents",
                    contentType: "application/json; charset=utf-8",
                    success: function (result) {
                        alert(result.d);
                        self.Students.remove(student)
                    },
                });
            };

        }
        var viewmodel = new StudentViewModel([
            { StudentID: 1, StudentName: "Saqib Majeed", StudentAddress: "Multan" },
            {
                StudentID: 2, StudentName: "Mehboob Khan", StudentAddress: "Lahore"
            }
        ]);
        ko.applyBindings(viewmodel);
        
   
    </script>
</body>
</html>
