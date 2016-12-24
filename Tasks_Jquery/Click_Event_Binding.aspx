<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Click_Event_Binding.aspx.cs" Inherits="Tasks_Jquery.Click_Event_Binding" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/knockout-3.4.0.js"></script>
    <style>
        .select{
            color:red;
        }
    </style>
            <script>
        $(document).ready(function () {
            $("#newbtn").click(function () {
                var myaccount = new Accounts($("#newid").val(), $("#newname").val(), $("#newbalance").val());
                Accounts.push(myaccount);
            });
        });
    </script>
</head>
   
<body>
     <table>
        <thead>
        <th>Serial No.</th>
         <th> ID</th>
         <th>Name</th>
         <th>Balance</th>
    
            </thead>
        <tbody  data-bind="foreach: Accounts">
        <tr data-bind="css: {select: (ID==(selectedaccount()==null?-1:selectedaccount().ID))}">
            <td data-bind="text: ($index()+1 + '/' + count())"></td>
            <td data-bind="text:ID">
                </td>
            <td data-bind="text:Name"></td>
            <td data-bind="text: Balance"></td>
            <td>   <button data-bind="click:selectaccount">Select</button></td>
        </tr>
            
            </tbody>
    </table>
         <hr />
    <h3>
        Insert New Account Holder
    </h3>
    <br />
    ID:      <input type="text" id="newid" /> <br />
    Name:    <input type="text" id="newname" /><br />
    Balance: <input type="text" id="newbalance" /><br />
    <button data-bind="click:Addaccount" > Enter New Account</button>

    <script>
    var Accounts = function(id, name, balance)
    {
        this.ID = id;
        this.Name= name;
        this.Balance = balance;
    }
    var accountviewModel = function () {
        this.Accounts = ko.observableArray([
            new Accounts(1, 'Saqib', 1000),
        new Accounts(2, 'Mehboob', 2000),
        new Accounts(3, 'Basit', 3000),
        ]);
        this.count = ko.computed(function () {
            return this.Accounts().length;
        }, this)
         var current = this;
         this.selectedaccount = ko.observable(null);
        this.selectaccount = function (account) {
            current.selectedaccount(account);
            return alert(account.Name);
        }

        this.Addaccount = function () {
            var myaccount = new Accounts($("#newid").val(), $("#newname").val(), $("#newbalance").val());
            current.Accounts.push(myaccount);
        }

    }
    ko.applyBindings(accountviewModel);
        </script>

</body>
</html>
