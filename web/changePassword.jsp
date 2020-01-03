<%-- 
    Document   : changePassword
    Created on : 26 Dec, 2019, 12:49:55 PM
    Author     : rumit
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AMS</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <style>
            .form-gap {
            padding-top: 70px;
        }
        </style>
    </head>
    <body>
        <% 
            response.setHeader("Pragma","no-cache");
            response.setHeader("Cache-Control","no-store");
            response.setHeader("Expires","0");
            response.setDateHeader("Expires",-1);
        %>
           <!--progress-->
    <link href="css/style_1.css" rel="stylesheet">
    <script src="js/common.min.js"></script>
    <script src="js/custom.min.js"></script>
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    
    <%
         String code = request.getParameter("code");
         //String email = request.getParameter("email");
          try{
                Class.forName("com.mysql.jdbc.Driver"); 
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/AMS","root","mysql");
            Statement st=cn.createStatement(); 
           int count1=0;
         
           String q1="SELECT * FROM AMS.USER_DETAILS where STATUS='Active' AND CODE='"+code+"'";
            ResultSet rs = st.executeQuery(q1);
            
            if(rs.next())
            {
              
            
            %>
                
                <div class="form-gap"></div>
        <div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
              <div class="panel-body">
                <div class="text-center">
                  <h3><i class="fa fa-unlock fa-4x"></i></h3>
                  <h2 class="text-center">Change Password</h2>
                  <p>You can Change your password here.</p>
                  <div class="panel-body">
    
                      <form id="register-form" action="change_password"  autocomplete="off" class="form" method="post">
    
                      <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                          <input id="email" name="email" value="<%=rs.getString("email") %>" readonly class="form-control"  type="email" >
                        </div>
                          <br>
                          <div class="input-group">
                          <span class="input-group-addon"><i class="fa fa-lock "></i></span>
                          <input id="new_password" name="new_password" placeholder="New password" class="form-control"  type="password" required="">
                          <span class="input-group-addon"><i id="pass-status" class="fa fa-eye" aria-hidden="true" onClick="viewPassword()"></i></span>
                        </div>
                           <br>
                          <div class="input-group">
                          <span class="input-group-addon"><i class="fa fa-lock "></i></span>
                          <input id="confirm_password" name="confirm_password" placeholder="confirm password" class="form-control"  type="password" required="">
                          <span class="input-group-addon"><i id="pass-status2" class="fa fa-eye" aria-hidden="true" onClick="viewPassword2()"></i></span>
                        </div>
                             <br>
                          <div class="input-group">
                              <span class="input-group-addon"><i class="glyphicon glyphicon-credit-card"></i></span>

                              <input id="code" name="code" value="<%=code %>" class="form-control" readonly  type="text" >
                        </div>
                      </div>
                      <div class="form-group">
                        <input name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Submit" type="submit">
                      </div>
                    </form>
    
                  </div>
                </div>
              </div>
            </div>
          </div>
	</div>
        </div>
                        <script>
                            function viewPassword()
                        {
                          var passwordInput = document.getElementById('new_password');
                          var passwordInput2 = document.getElementById('confirm_password');
                          var passStatus = document.getElementById('pass-status');
                          var passStatus = document.getElementById('pass-status');

                          if (passwordInput.type == 'password'){
                            passwordInput.type='text';
                            passStatus.className='fa fa-eye-slash';

                          }
                          else{
                            passwordInput.type='password';
                            passStatus.className='fa fa-eye';
                          }
                        }
                        function viewPassword2()
                        {
                          var passwordInput2 = document.getElementById('confirm_password');
                          var passStatus2 = document.getElementById('pass-status2');

                          if (passwordInput2.type == 'password'){
                            passwordInput2.type='text';
                            passStatus2.className='fa fa-eye-slash';

                          }
                          else{
                            passwordInput2.type='password';
                            passStatus2.className='fa fa-eye';
                          }
                        }

                            </script>
                
                <%
                
            }
            else
            {
                response.sendRedirect("pageNotFound.jsp");
            }   
          }catch(Exception ex)
          {
              System.out.println(ex);
          }
        %>
        
                        
                        
                        
    </body>
</html>
