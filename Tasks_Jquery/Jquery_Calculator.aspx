<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Jquery_Calculator.aspx.cs" Inherits="Tasks_Jquery.Jquery_Ca_culator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-3.1.1.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#1, #2, #3, #4, #5, #6, #7, #8, #9, #0").click(function () {
                var num= $(this).val();
                $('#result').val($('#result').val() + num);
            });
        });
    </script>
</head>
<body>
      <div>
          <input type="text" id="result" />
           <hr />
           <input type="button" id="1" value="1" /> 
           <input type="button" id="2" value="2" />
           <input type="button" id="3" value="3" />
           <input type="button" id="plus" value="+" /><br />

           <input type="button" id="4" value="4" />
           <input type="button" id="5" value="5" />
           <input type="button" id="6" value="6" />
           <input type="button" id="subtract" value="-" /><br />

           <input type="button" id="7" value="7" />
           <input type="button" id="8" value="8" />
           <input type="button" id="9" value="9" />
           <input type="button" id="divide" value="/" /><br />

           <input type="button" id="0" value="0" />
           <input type="button" id="multiply" value="*" /><br />
     </div>

</body>
</html>
