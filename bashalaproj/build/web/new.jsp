<%-- 
    Document   : new
    Created on : Jul 2, 2024, 1:50:43 PM
    Author     : Parvathi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Record Adding Page</title>
    </head>
    <body>
                <% 
                    String str1 = request.getParameter("username");
                    String str2 = request.getParameter("register_no");
                    String str3 = request.getParameter("quizmark");
                    String str4 = request.getParameter("attendancemark");
                    String str5 = request.getParameter("labmark");
                    String str6 = request.getParameter("allmark");

                    if (str1 != null && str2 != null && str3 != null && str4 != null && str5 != null && str6 != null) {
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bashala", "root", "Root");
                            String query = "INSERT INTO calculate (name, reg_num, quiz_mark, attendance_mark, lab_mark, all_internal_mark) VALUES (?, ?, ?, ?, ?, ?)";
                            PreparedStatement pstmt = con.prepareStatement(query);
                            pstmt.setString(1, str1);
                            pstmt.setString(2, str2);
                            pstmt.setInt(3, Integer.parseInt(str3));
                            pstmt.setInt(4, Integer.parseInt(str4));
                            pstmt.setInt(5, Integer.parseInt(str5));
                            pstmt.setInt(6, Integer.parseInt(str6));

                            int i = pstmt.executeUpdate();
                            if (i > 0) {
                                out.println("Record added successfully.");
                            } else {
                                out.println("Failed to add the record.");
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </div>
        </center>
    </body>
</html>
