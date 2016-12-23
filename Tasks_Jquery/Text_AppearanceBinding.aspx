<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Text_AppearanceBinding.aspx.cs" Inherits="Tasks_Jquery.Text_AppearanceBinding" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/knockout-3.4.0.js"></script>
</head>
<body>

    <div>
    <input type="range" min="1" max="100" data-bind="value:num" />
        Number is: <span data-bind="visible: IsEven()">Even</span>
        <span data-bind="visible: IsEven()==false"> Odd</span>
        <br />
        The Number Is: <span data-bind="text: num"></span>

    </div>
    <script>
        var myviewmodel = function () {
            this.num = ko.observable(1);
            this.IsEven = ko.computed(function () {
                return this.num() % 2 == 0;
            },this)
        }
        ko.applyBindings(myviewmodel);
    </script>
</body>
</html>
