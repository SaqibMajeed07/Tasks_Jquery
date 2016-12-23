<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="Tasks_Jquery.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/knockout-3.4.0.js"></script>
    <script>
        $(document).ready(function () {
            $("#btn").click(function () {
                accViewModel.Balance(accViewModel.Balance() + Number($("#txtamount").val()));
            });
            $("#btn2").click(function () {
                var acc = new Account($("#idtxt").val(), $("#nametxt").val(), $("#blnctxt").val());
                accounts.push(acc);
            });
            $("#btnremove").click(function () {
                accounts.pop();
            });
            $("#selectedaccount").change(function () {
                var index = document.getElementById("selectedaccount").selectedIndex;
            })
        });
    </script>
</head>
<body>
    <div>
        <select id="selectedaccount" data-bind="options: accounts, optionsText: 'Name', optionsValue:'Id'"></select> <br />
       
    </div>
  <hr />
    <div>
    Id: <span data-bind="text:Id"></span> <br />
    Name: <span data-bind="text:Name"></span> <br />
    Balance: <span data-bind="text:Balance"></span> <br />
     Amount:   <input type="text" id="txtamount" />
        <button type="submit" id="btn">Deposit</button>
        <hr />
        New Balance: <input type="text" data-bind="value:Balance" id="txtbox" />
    </div>
    <hr />
    <div>
        <h3>Insert new Account</h3>
        ID: <input type="text" id="idtext" />
        Name: <input type="text" id="nametxt"/>
        Balance: <input type="text" id="blnctxt" />
        <button type="submit" id="btn2"> Add New Account</button>
        <button type="submit" id="btnremove">Remove Last Account</button>
    </div>
    <div>
        Total number of Accounts: <span data-bind="text: accounts().length"></span>
    </div>
    <script>
        function Account(id, name, balance) {
            this.Id = id;
            this.Name = name;
            this.Balance = balance;
        }
        function AccountViewModel(myacc) {
            this.Id = myacc.Id;
            this.Name = myacc.Name;
            this.Balance = ko.observable(myacc.Balance);
            this.selectedindexarray = ko.observable();

        }
        var myacc = new Account(1, "Waqas", 55000);
        var a1 = new Account(2, "Saqib", 58000);
        var a2 = new Account(3, "Mehboob", 78000);
        var a3 = new Account(4, "Basit", 55555);
        this.accounts = ko.observableArray([myacc, a1, a2, a3]);
        var accViewModel = new AccountViewModel(myacc);
        ko.applyBindings(accViewModel);
    </script>
</body>
</html>
