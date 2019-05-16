<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContextMenu.aspx.cs" Inherits="Sample_ContextMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="src/jquery.ui.position.js" type="text/javascript"></script>
    <script src="src/jquery.contextMenu.js" type="text/javascript"></script>
    <script src="screen.js" type="text/javascript"></script>
    <script src="prettify/prettify.js" type="text/javascript"></script>
    <link href="src/jquery.contextMenu.css" rel="stylesheet" type="text/css" />
    <link href="screen.css" rel="stylesheet" type="text/css" />
    <link href="prettify/prettify.sunburst.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-8922143-3']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();


    </script>
    <script type="text/javascript" class="showcase">
        $(function () {
            $.contextMenu({
                selector: '.context-menu-one',
                callback: function (key, options) {
                    var m = "clicked: " + key;
                    window.console && console.log(m) || alert(m);
                },
                items: {
                    "edit": { name: "Edit", icon: "edit" },
                    "cut": { name: "Cut", icon: "cut" },
                    "copy": { name: "Copy", icon: "copy" },
                    "paste": { name: "Paste", icon: "paste" },
                    "delete": { name: "Delete", icon: "delete" },
                    "sep1": "---------",
                    "quit": { name: "Quit", icon: "quit" }
                }
            });

            $('.context-menu-one').on('click', function (e) {
                console.log('clicked', this);
            })
        });
    </script>
</head>
<body>
    <div class="context-menu-one box menu-1">
        <strong>right click me</strong>
    </div>

</body>
</html>
