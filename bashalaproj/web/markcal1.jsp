<%-- 
    Document   : markcal1
    Created on : Jul 2, 2024, 11:43:52 AM
    Author     : Parvathi
--%>

<%-- 
    Document   : internalmark
    Created on : 28-Jun-2024, 9:00:15 PM
    Author     : barat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Internal Mark Calculation</title>
        <style>
            body{
                background-color: skyblue;
                font-size: 30px;
            }
        </style>
    </head>
    <body>
        <%
        String str1 = request.getParameter("username");
        String str2=request.getParameter("register no");
        out.println("<h3>Welcome "+str1+" !</h3>");
        out.println("<h3>Register No:"+str2+"<h3>");
        
       
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bashala","root","Root");
        PreparedStatement pstmt = con.prepareStatement("SELECT * FROM calculate WHERE name = ? LIMIT 1");
        pstmt.setString(1, str1);
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){
            String quiz = rs.getString("quiz_mark");
            String attendance = rs.getString("attendance_mark");
            String lab = rs.getString("lab_mark");
            String internal_mark = rs.getString("all_internal_mark");
            out.println("<p>Your Quiz Mark: "+ quiz + "% </p>");
            out.println("<p>Your Attendance Mark: "+ attendance + "% </p>");
            out.println("<p>Your Lab Mark: "+ lab + "% </p>");
            out.println("<p>Your All Internal Mark: "+ internal_mark + "% </p>");
            
            
            if(quiz!= null && attendance!=null && lab!=null && internal_mark!=null){
                int total = Integer.parseInt(quiz) + Integer.parseInt(attendance) + Integer.parseInt(lab) + Integer.parseInt(internal_mark);
                int percentage = (total*100) / 400;
                out.println("total: " +total);
                out.println("Percentage: " + percentage +"%");
            }
            }
        %>
    </body>
</html>

