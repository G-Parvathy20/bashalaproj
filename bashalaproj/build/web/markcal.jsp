<%-- 
    Document   : markcal
    Created on : Jun 29, 2024, 12:32:23?PM
    Author     : Parvathi
--%>

<%@page contentType="text/html" language="java" import="java.sql.*"%>
<html>
<head>
    <title>Internal Mark Calculation</title>
    <style type="text/css">
        body {
            background-color: burlywood;
            font-family: courier;
            color: blue;
        }
    </style>
</head>
<body>
    <h2 style="text-align: center;">Calculation Site</h2>
    <p>
        <a href="index.html">Back to Main Page</a>
    </p>
    <hr/>
    <% 
        String quiz = "";
        String attendance = "";
        String lab = "";
        String internal_mark = "";
        try {
            String str1 = request.getParameter("student");
            out.println("<p>Welcome, " + str1 + "</p>");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bashala", "root", "Root");
            PreparedStatement pstmt = con.prepareStatement("SELECT * FROM calculate WHERE name = ? LIMIT 1");
            pstmt.setString(1, str1);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                quiz = rs.getString("quiz_mark");
                attendance = rs.getString("attendance_mark");
                lab = rs.getString("lab_mark");
                internal_mark = rs.getString("all_internal_mark");
                out.println("<p>Your Quiz Mark: " + quiz + "% </p>");
                out.println("<p>Your Attendance Mark: " + attendance + "% </p>");
                out.println("<p>Your Lab Mark: " + lab + "% </p>");
                out.println("<p>Your Total Internal Mark: " + internal_mark + "% </p>");
            } else {
                out.println("<p>No data found for the student: " + str1 + "</p>");
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    <button onclick="calculate()">Calculate</button>
    <div id="result"></div>

    <script>
        function calculate() {
            var quiz = "<%= quiz %>";
            var attendance = "<%= attendance %>";
            var lab = "<%= lab %>";
            var internal_mark="<%= internal_mark %>"

            if (quiz && attendance && lab && internal_mark) {
                var total = parseInt(quiz) + parseInt(attendance) + parseInt(lab) + parseInt(internal_mark);
                var percentage = (total * 100) / 400;
                document.getElementById("result").innerHTML = "<p>Total: " + total + "</p><p>Percentage: " + percentage + "%</p>";
            } else {
                document.getElementById("result").innerHTML = "<p>Invalid or missing data for calculations.</p>";
            }
        }
    </script>
</body>
</html>
