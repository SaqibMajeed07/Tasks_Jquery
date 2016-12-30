<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gifts.aspx.cs" Inherits="Tasks_Jquery.gifts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/knockout-3.4.0.js"></script>
</head>
<body>

    <div>
    <table>
        <thead>
            <th> ID</th>
            <th> Gift Name</th>
            <th> Price</th>
        
        </thead>
        <tbody data-bind="foreach: gifts">
            <tr>
                <td> <span data-bind="text: id"></span></td>
                <td> <span data-bind="text: name"></span></td>
                <td> <span data-bind="text: price"></span></td>
                <td> <button type="submit" data-bind="click: deletegift"> Delete</button></td>
            </tr>
        </tbody>
    </table>
    </div>
    <div>
        <h2> Insert New Gift</h2>
        <input type="text" data-bind="value: id" /> <br />
        <input type="text" data-bind="value: name" /> <br />
        <input type="text" data-bind="value: price" /> <br />
        <button type="submit" data-bind="click: insertgift"> Add Gift</button>
    </div>
    <script>
        var giftviewmodel = function (data) {
            var self = this;
            self.id = ko.observable();
            self.name = ko.observable();
            self.price = ko.observable();
            self.gifts = ko.observableArray(data);
            self.insertgift = function () {
                self.gifts.push({ id: self.id(), name: self.name(), price: self.price() });

            };
            self.deletegift = function (gift) {
                self.gifts.remove(gift);
            };
        }

        var record = new giftviewmodel([{ id: "1", name: "flower", price: "1000" },
                                          { id: "2", name: "pen", price: "500" }]);
        ko.applyBindings(record);
    </script>
</body>
</html>
