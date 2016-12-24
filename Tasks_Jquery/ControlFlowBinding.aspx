<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ControlFlowBinding.aspx.cs" Inherits="Tasks_Jquery.ControlFlowBinding" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/knockout-3.4.0.js"></script>
</head>
<body>
    <input type="checkbox" data-bind="checked:hideshowsection"  /> Show/Hide
    <div data-bind="if: hideshowsection">
        This is my block of code....
    </div>
    <hr />
    <div>
       City: <span data-bind="text:City"></span><br />
       
       Office Phone: <span data-bind="text:phone.office"></span><br />
        Home Phone: <span data-bind="text:phone.Home"></span><br />
    </div>
    <hr />
    <div>
        <ul data-bind="foreach: colors">
            <li data-bind="text: $data"></li>
        </ul>
    </div>
   <script>
       var mymodel = function () {
           this.City = ko.observable("Lahore");
           this.phone = { Home: 03434450990, office: 03466761116 };
           this.hideshowsection = ko.observable(true);
           this.colors = ko.observableArray(["Green", "yellow", "Pink", "Red", "White"]);
       }
       ko.applyBindings(mymodel);
   </script>

</body>
</html>
