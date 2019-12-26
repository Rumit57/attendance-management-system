<%-- 
    Document   : changePassword
    Created on : 26 Dec, 2019, 12:49:55 PM
    Author     : rumit
--%>

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
                          <input id="email" name="to" placeholder="email address" class="form-control"  type="email" required="">
                        </div>
                          <br>
                          <div class="input-group">
                          <span class="input-group-addon"><i class="fa fa-lock "></i></span>
                          <input id="new_password" name="new_password" placeholder="New password" class="form-control"  type="password" required="">
                        </div>
                           <br>
                          <div class="input-group">
                          <span class="input-group-addon"><i class="fa fa-lock "></i></span>
                          <input id="confirm_password" name="confirm_password" placeholder="confirm password" class="form-control"  type="password" required="">
                        </div>
                             <br>
                          <div class="input-group">
                              <span class="input-group-addon"><i class="glyphicon glyphicon-credit-card"></i></span>

                              <input id="code" name="code" placeholder="code" class="form-control"  type="text" required="">
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
    </body>
</html>
