<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <button id="submit">Call a C# Function</button> 
<button id="submitError">Call a Non-Existing C# Function To Generate Error</button>
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $("#reset").click(function (e) {
            $("#dbData").html("")
        });
 
        $(document).ajaxStart(function () {
            $("#data").html("Triggered ajaxStart Event.<br/>");
        });
 
        $(document).ajaxSend(function (event, jqxhr, settings) {
            $("#data").append("Triggered ajaxSend Event.<br/>");
        });
 
        $(document).ajaxComplete(function (event, jqxhr, settings) {
            $("#data").append("Triggered ajaxComplete Event.<br/>");
        });
 
        $(document).ajaxStop(function () {
            $("#data").append("Triggered ajaxStop Event.<br/>");
        });
 
        $(document).ajaxSuccess(function (event, jqxhr, settings) {
            $("#data").append("Triggered ajaxSuccess Event.<br/>");
        });
 
        $(document).ajaxError(function (event, jqxhr, settings, thrownError) {
            $("#data").append("Triggered ajaxError Event.<br/>");
        });
 
        $("#submit").click(function (e) {
            $.ajax({
                type: "POST",
                url: "result.aspx/welcome",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result, status, xhr) {
                    $("#data").append(result.d);
                },
            });
        });
 
        $("#submitError").click(function (e) {
            $.ajax({
                type: "POST",
                url: "result.aspx/welcome1",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result, status, xhr) {
                    $("#data").append(result.d);
                },
            });
        });
    });
</script>

  </body>
</html>