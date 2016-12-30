<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="Tasks_Jquery.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/knockout-3.4.0.js"></script>
</head>
<body>

    <div class='liveExample'> 
    
    <form action='/'>
        <p>You have asked for <span data-bind='text: gifts().length'>&nbsp;</span> gift(s)</p>
        <table data-bind='visible: gifts().length > 0'>
            <thead>
                <tr>
                    <th>Gift name</th>
                    <th>Price</th>
                    <th />
                </tr>
            </thead>
            <tbody data-bind='foreach: gifts'>
                <tr>
                    <td><input class='required' data-bind='value: name, uniqueName: true' /></td>
                    <td><input class='required number' data-bind='value: price, uniqueName: true' /></td>
                    <td><a href='#' data-bind='click: $root.removeGift'>Delete</a></td>
                    <td><a href='#' data-bind='click: $root.editGift'>Edit</a></td>
                </tr>
            </tbody>
        </table>
     
        <button data-bind='click: addGift'>Add Gift</button>
        <button data-bind='enable: gifts().length > 0, click: save' type='submit'>Submit</button>
    </form>
    <input class='required number' data-bind='value: name, uniqueName: true' />
    <span data-bind='text: name'></span>
    <input class='required number' data-bind='value: price, uniqueName: true' />
    <span data-bind='text: price'></span>
</div>

    <script>
        function vieModel() {
            return {
                id: "",
                name: "",
                price: ""
            }
        }

        var GiftModel = function (giftss) {
            var self = this;
            self.id = ko.observable("0");
            self.name = ko.observable();
            self.price = ko.observable();
            self.gifts = ko.observableArray(giftss);
            var vire = vieModel();
            self.addGift = function () {
                var res = 0;
                vire.id = self.id();
                if (self.id() == "0") {
                    vire.id = self.gifts().length + 1;
                }
                vire.name = self.name();
                vire.price = self.price();

                self.name("")
                self.price("")
                self.gifts.push({ id: vire.id, name: vire.name, price: vire.price });
            };

            self.removeGift = function (gift) {
                self.gifts.remove(gift);
            };

            self.editGift = function (gift) {
                alert(gift.name)
            };

            self.save = function (form) {
                //alert("Could now transmit to server: " + ko.utils.stringifyJson(self.gifts));

                $.ajax({
                        type: "POST",
                        url: "/test.aspx/UserData",
                        contentType: "application/json; charset=utf-8",
                        data: "{ 'dataJson': '" + ko.utils.stringifyJson(self.gifts) + "' }",
                        dataType: "json",
                        async: true,
                        cache: false,
                        success: function (data) {
                            console.log(data);
                            //console.log(data.d.Name);
                            //viewModel.dataRows.push({ name: data.d.Name, sales: 0, price: 100 });
                        },
                        error: function (xhr) {
                            console.log(xhr);
                        }
                    });
                // To actually transmit to server as a regular form post, write this: ko.utils.postJson($("form")[0], self.gifts);
            };
        };

        var viewModel = new GiftModel([
            { id: "1", name: "Tall Hat", price: "39.95" },
            { id: "2", name: "Long Cloak", price: "120.00" }
        ]);
        ko.applyBindings(viewModel);
        //$("form").validate({ submitHandler: viewModel.save });
    </script>
    <style>
        body { font-family: arial; font-size: 14px; }

.liveExample { padding: 1em; background-color: #EEEEDD; border: 1px solid #CCC; max-width: 655px; }
.liveExample input { font-family: Arial; }
.liveExample b { font-weight: bold; }
.liveExample p { margin-top: 0.9em; margin-bottom: 0.9em; }
.liveExample select[multiple] { width: 100%; height: 8em; }
.liveExample h2 { margin-top: 0.4em; font-weight: bold; font-size: 1.2em; }

.liveExample table, .liveExample td, .liveExample th { padding: 0.2em; border-width: 0; }
.liveExample td input { width: 13em; }
tr { vertical-align: top; }
.liveExample input.error { border: 1px solid red; background-color: #FDC; }
.liveExample label.error { display: block; color: Red; font-size: 0.8em; } 
.liveExample th { font-weight: bold; }

li { list-style-type: disc; margin-left: 20px; }

    </style>
</body>
</html>
