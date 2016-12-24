<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountsForEach.aspx.cs" Inherits="Tasks_Jquery.AccountsForEach" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/knockout-3.4.0.js"></script>
</head>
<body>
    <table>
        <thead>
        <th>Serial No.</th>
         <th> ID</th>
         <th>Name</th>
         <th>Balance</th>
            <th> Deposits</th>
            </thead>
        <tbody  data-bind="foreach: Accounts">
        <tr>
            <td data-bind="text: ($index()+1 + '/' + count())"></td>
            <td data-bind="text:ID">
                </td>
            <td data-bind="text:Name"></td>
            <td data-bind="text: Balance"></td>
            <td>
                <ul data-bind="foreach: {data: Deposit, as: 'amount' }">
                    <li data-bind="text: (amount)"></li>
                </ul>
            </td>
        </tr>
            </tbody>
    </table>
<script>
    var Accounts = function(id, name, balance, deposit)
    {
        this.ID = id;
        this.Name= name;
        this.Balance = balance;
        this.Deposit = deposit;
    }
    var accountviewModel = function () {
        this.Accounts = ko.observableArray([
            new Accounts(1, 'Saqib', 1000, [100, 1200, 1900]),
        new Accounts(2, 'Mehboob', 2000, [200, 2200,2900]),
        new Accounts(3, 'Basit', 3000, [300, 3200, 3900]),
        ]);
        this.count = ko.computed(function () {
            return this.Accounts().length;
        },this)
    }
    ko.applyBindings(accountviewModel);
</script>
</body>
</html>
