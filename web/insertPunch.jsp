<%-- 
    Document   : insertPunch
    Created on : 18 Dec, 2019, 11:28:36 AM
    Author     : rumit
--%>

<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%   
         try{
            Calendar calendar = Calendar.getInstance();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //System.out.println(formatter.format(calendar.getTime()));
        Class.forName("com.mysql.jdbc.Driver"); 
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/AMS","root","mysql");
            Statement st=cn.createStatement(); 
            
            String q1="SELECT * FROM AMS.manage where idmanage='"+session.getAttribute("id")+"'";
            ResultSet rs = st.executeQuery(q1);
            
            if(rs.next())
            {
                String q="UPDATE AMS.manage SET punch_in='"+formatter.format(calendar.getTime())+"' where idmanage='"+session.getAttribute("id")+"'";
                int i =st.executeUpdate(q);
            }
          
          
          
     
            
        }catch (ClassNotFoundException ex) {
            System.out.println(ex);
        } catch (SQLException ex) {
            System.out.println(ex);
        }
     %>
    </body>
</html>
