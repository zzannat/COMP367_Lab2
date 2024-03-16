<html>
<head>
    <title>Welcome to COMP367</title>
    <script>
        function displayGreeting() {
            var today = new Date();
            var hour = today.getHours();
            var greeting;

            if (hour < 12) {
                greeting = "Good morning";
            } else if (hour < 18) {
                greeting = "Good afternoon";
            } else {
                greeting = "Good evening";
            }

            var name = prompt("Please enter your name:");
            var message = greeting + ", " + (name ? name : "Guest") + ", Welcome to COMP367";
            document.getElementById("greeting").innerText = message;
        }
    </script>
</head>
<body onload="displayGreeting()">
    <h2 id="greeting"></h2>


</html>
