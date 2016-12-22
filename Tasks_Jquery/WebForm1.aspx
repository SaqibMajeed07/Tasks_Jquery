<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Tasks_Jquery.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/knockout-3.4.0.js"></script>

</head>
<body>
    <form id="form1" runat="server">
   
  <div>
      <h2> Friends List</h2>
      <div data-bind="template:{name:'friend-template', data:friend1}"></div>
      <div data-bind="template: { name: 'friend-template', data: friend2 }"></div>
  </div>
 
    </form>
    <script id="friend-template" type="text/html">
        <h3 data-bind="text:name"></h3>
        <p>Contact number: <span data-bind="text:phone"></span></p>
        <p>Email: <span data-bind="text:email"></span></p>
        <button type="button" data-bind="click: $root.removecontact"> Remove</button>
    </script>
        <script>
            function mydata() {
                this.friend1 = { name: "Saqib", phone: 03434450990, email: 'Saqib_Majeed07@yahoo.com' };
                this.friend2 = { name: "Basit", phone: 03054992825, email: "Basit_Majeed03@yahoo.com" };
            }

            ko.applyBindings(new mydata());
        </script>
</body>
</html>
