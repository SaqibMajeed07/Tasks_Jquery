<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Tasks_Jquery.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/knockout-3.4.0.js"></script>
    <script src="Scripts/jquery-3.1.1.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
   <table>
            <tr>
                <td>
                    <!--Bind the TextBoxes in the Table to the observable properties defined into the ViewModel -->
                    <table id="tbldml">
                        <tr>
                            <td>StudentNo</td>
                            <td>
                                <input type="text" id="txteno" data-bind="value: $root.CustNo" disabled="disabled" /></td>
                        </tr>
                        <tr>
                            <td>Student Name</td>
                            <td>
                                <input type="text" id="txtename" data-bind="value: $root.CustName" /></td>
                        </tr>
                        <tr>
                            <td>Student Address</td>
                            <td>
                                <input type="text" id="txtsal" data-bind="value: $root.Salary" /></td>
                        </tr>
                        
                        <tr>
                            <!--The click binding has the JavaScirpt methods passed to it-->
                            <td>
                                <button data-bind="click :$root.save">Save</button></td>
                            <td>
                                <button data-bind="click: $root.update">Update</button></td>
                        </tr>
                    </table>
                                 
                    
                    
                    <div class="FixedContainer">
                         <table data-bind="visible:  Customers().length>0" style="border: double">
                            <thead>
                                <tr>
                                    <td>Student ID</td>
                                    <td>Student Name</td>
                                    <td>Student Address</td>
                                    <td></td>
                                </tr>
                            </thead>
                            <!--Iterate through an observableArray using foreach-->
                            <tbody data-bind="foreach: Customers">
                                <tr style="border: solid" data-bind="click: $root.getselectedcustomer" id="updtr">
                                    <td><span data-bind="text:  StudentId"></span></td>
                                    <td><span data-bind="text:  StudentName"></span></td>
                                    <td><span data-bind="text: Salary"></span></td>
                                    <td><span data-bind="text: DeptName"></span></td>                  
                                    <td>
                                        <button data-bind="click: $root.deleterec">Delete</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
    </form>
    <script>
   
       
   
    </script>
</body>
</html>
