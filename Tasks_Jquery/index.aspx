<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Tasks_Jquery.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-3.1.1.min.js"></script>
    <script>
        $(document).ready(function () {
            var max_fields = 10;
            var x = 1;
            $("#btn").click(function (e) {
                e.preventDefault();
                if (x < max_fields)
                {
                    x++;
                   $(".input_fields").append('<div> <input type="text" class="same" id="textbox[]"> </div>')
                }
            });
            $("#btn2").click(function () {
                var result = 0;
               
                    //var newvalue = $("#textbox[]").val();
        
                    $(".same").each(function () {
                       result= result += Number($(this).val());

                    });
                $("#val").text("Sum:" + result);
            });

        });
    </script>
</head>
<body>
    <div class="input_fields">
        <button type="button" id="btn"> Add More TextBoxes </button>
        <div><input type="text" id="textbox[]" class="same" /> </div>
    </div>
    <div>
        <button type="button" id="btn2"> Add Values Of TextBoxes </button>
    </div>
    <div id="val">

    </div>
</body>
</html>
