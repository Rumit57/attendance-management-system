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
         <%  try{
            Calendar calendar = Calendar.getInstance();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //System.out.println(formatter.format(calendar.getTime()));
        Class.forName("com.mysql.jdbc.Driver"); 
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/AMS","root","mysql");
            Statement st=cn.createStatement(); 
          //  System.out.println(formatter.format(calendar.getTime()));
          String punch_in="";
          String punch_out="";
           String q3="UPDATE AMS.manage SET punch_out='"+formatter.format(calendar.getTime())+"' where idmanage='"+session.getAttribute("id")+"'";
            int i =st.executeUpdate(q3);
          String q1="SELECT * FROM AMS.manage WHERE idmanage='"+session.getAttribute("id")+"'";
          ResultSet rs = st.executeQuery(q1);
          while(rs.next())
            {
                punch_in=rs.getString("punch_in");
                punch_out=rs.getString("punch_out");
               
            }
          
          String q2=" SELECT TIMEDIFF('"+punch_out+"','"+punch_in+"')";
           ResultSet rs1 = st.executeQuery(q2);
               
            String wh1="";
            while(rs1.next())
            {
                wh1=rs1.getString("TIMEDIFF('"+punch_out+"','"+punch_in+"')");
               
            }
          
          
       
        String q4="UPDATE AMS.manage SET workinghour='"+wh1+"' where idmanage='"+session.getAttribute("id")+"'";
           
            int i1 =st.executeUpdate(q4);
        }catch (ClassNotFoundException ex) {
            System.out.println(ex);
        } catch (SQLException ex) {
            System.out.println(ex);
        }
       
    %>
    </body>
</html>
