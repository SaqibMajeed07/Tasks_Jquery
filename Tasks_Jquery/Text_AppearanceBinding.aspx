<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Text_AppearanceBinding.aspx.cs" Inherits="Tasks_Jquery.Text_AppearanceBinding" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/knockout-3.4.0.js"></script>
    <style>
        .redcolor {
            color: darkred;
            border:solid 5px yellow;
        }
    </style>
</head>
<body>

    <div>
    <input type="range" min="1" max="100" data-bind="value:num" />
        Number is: <span data-bind="visible: IsEven()">Even</span>
        <span data-bind="visible: IsEven()==false"> Odd</span>
        <br />
        The Number Is: <span data-bind="text: num"></span>
        <br />
        The Bold Number:<span data-bind="html: formattednumber"></span>
        <br />
        <span data-bind="style: {color: textcolor}"> Notice My Color</span>
        <br />
        <span data-bind="css: {redcolor: IsEven}">This Text is Red for Even Numbers</span>
    </div>
    <script>
        var myviewmodel = function () {
            this.num = ko.observable(1);
            this.IsEven = ko.computed(function () {
                return this.num() % 2 == 0;
            }, this)
            this.formattednumber = ko.computed(function () {
                return "<b>" + this.num() + "</b>";
            }, this)
            this.textcolor = ko.computed(function () {
                if (this.num() > 50)
                    return "Red";
                else
                    return "Green";
            },this)
        }
        ko.applyBindings(myviewmodel);
    </script>
</body>
</html>
