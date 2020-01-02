<%-- 
    Document   : forgotPassword
    Created on : 26 Dec, 2019, 12:05:28 PM
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
        <div class="form-gap"></div>
        <div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
              <div class="panel-body">
                <div class="text-center">
                  <h3><i class="fa fa-lock fa-4x"></i></h3>
                  <h2 class="text-center">Forgot Password?</h2>
                  <p>You can reset your password here.</p>
                  <div class="panel-body">
    
                      <form id="register-form" action="mail"  autocomplete="off" class="form" method="post">
    
                      <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                          <input id="email" name="to" placeholder="email address" class="form-control"  type="email" >
                        </div>
                      </div>
                      <div class="form-group">
                        <input id="submit" name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Forgot Password" type="submit">
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
        $('#submit').click(function(){
        if($.trim($('#email').val()) == ''){
           alert('Input can not be left blank');
           return false;
        }
     });
            </script>
    </body>
</html>
