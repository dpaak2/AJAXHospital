<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--Pulling Awesome Font -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

<style>
body {
    padding-top: 90px;
}
.panel-login {
   border-color: #ccc;
   -webkit-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
   -moz-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
   box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
}
.panel-login>.panel-heading {
   color: #00415d;
   background-color: #fff;
   border-color: #fff;
   text-align:center;
}
.panel-login>.panel-heading a{
   text-decoration: none;
   color: #666;
   font-weight: bold;
   font-size: 15px;
   -webkit-transition: all 0.1s linear;
   -moz-transition: all 0.1s linear;
   transition: all 0.1s linear;
}
.panel-login>.panel-heading a.active{
   color: #029f5b;
   font-size: 18px;
}
.panel-login>.panel-heading hr{
   margin-top: 10px;
   margin-bottom: 0px;
   clear: both;
   border: 0;
   height: 1px;
   background-image: -webkit-linear-gradient(left,rgba(0, 0, 0, 0),rgba(0, 0, 0, 0.15),rgba(0, 0, 0, 0));
   background-image: -moz-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
   background-image: -ms-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
   background-image: -o-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
}
.panel-login input[type="text"],.panel-login input[type="email"],.panel-login input[type="password"] {
   height: 45px;
   border: 1px solid #ddd;
   font-size: 16px;
   -webkit-transition: all 0.1s linear;
   -moz-transition: all 0.1s linear;
   transition: all 0.1s linear;
}
.panel-login input:hover,
.panel-login input:focus {
   outline:none;
   -webkit-box-shadow: none;
   -moz-box-shadow: none;
   box-shadow: none;
   border-color: #ccc;
}
.btn-login {
   background-color: #59B2E0;
   outline: none;
   color: #fff;
   font-size: 14px;
   height: auto;
   font-weight: normal;
   padding: 14px 0;
   text-transform: uppercase;
   border-color: #59B2E6;
}
.btn-login:hover,
.btn-login:focus {
   color: #fff;
   background-color: #53A3CD;
   border-color: #53A3CD;
}
.forgot-password {
   text-decoration: underline;
   color: #888;
}
.forgot-password:hover,
.forgot-password:focus {
   text-decoration: underline;
   color: #666;
}

.btn-register {
   background-color: #1CB94E;
   outline: none;
   color: #fff;
   font-size: 14px;
   height: auto;
   font-weight: normal;
   padding: 14px 0;
   text-transform: uppercase;
   border-color: #1CB94A;
}
.btn-register:hover,
.btn-register:focus {
   color: #fff;
   background-color: #1CA347;
   border-color: #1CA347;
}
.btn-addr {
   background-color: #d34343;
   outline: none;
   color: #fff;
   font-size: 10px;
   height: auto;
   font-weight: normal;
   padding: 14px 0;
   text-transform: uppercase;
   border-color: #d34343;
}
.btn-confirm {
   background-color: #1cbf63;
   outline: none;
   color: #fff;
   font-size: 14px;
   height: auto;
   font-weight: normal;
   padding: 14px 0;
   width:99%;
   text-transform: uppercase;
   border-color: #1cbf63;
}
</style>
<div id="login-wrapper">
<div class="container">
       <div class="row">
         <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-login">
               <div class="panel-heading">
                  <div class="row">
                     <div class="col-xs-6">
                        <a href="#" class="active" id="login-form-link">Login</a>
                     </div>
                     <div class="col-xs-6">
                        <a href="#" id="register-form-link">Register</a>
                     </div>
                  </div>
                  <hr>
               </div>
               <div class="panel-body">
                  <div class="row">
                     <div class="col-lg-12">
                        <form id="login-form" action="#" method="post" role="form" style="display: block;">
                           <div class="form-group">
                              <input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
                           </div>
                           <div class="form-group">
                              <input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
                           </div>
                           <div class="form-group text-center">
                              <input type="checkbox" tabindex="3" class="" name="remember" id="remember">
                              <label for="remember"> Remember Me</label>
                           </div>
                           <div class="form-group">
                              <div class="row">
                                 <div class="col-sm-6 col-sm-offset-3">
                                    <input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
                                 </div>
                              </div>
                           </div>
                           <div class="form-group">
                              <div class="row">
                                 <div class="col-lg-12">
                                    <div class="text-center">
                                       <a href="http://phpoll.com/recover" tabindex="5" class="forgot-password">Forgot Password?</a>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </form>
                        <form id="register-form" action="#" method="post" role="form" style="display: none;">
                           <label class="radio-inline"><input type="radio" name="group" value="patient" checked="checked">고객</label>
						<label class="radio-inline"><input type="radio" name="group" value="doctor">의사</label>
						<label class="radio-inline"><input type="radio" name="group" value="nurse">간호사</label>
                        <label class="radio-inline"><input type="radio" name="group" value="admin">관리자</label>
                        <div id="register-info">
                        <!-- id,pass,name,gen,phone,  -->
                           <div class="form-group" >
                              <input type="text" name="id" id="id" tabindex="1" class="form-control" placeholder="User ID" value="">
                           </div>
                           <div class="form-group">
                              <input type="password" name="password" id="password" tabindex="1" class="form-control" placeholder="Password">
                           </div>
                           <div class="form-group">
                              <input type="password" name="confirm-password" id="confirm-password" tabindex="2" class="form-control" placeholder="Confirm Password">
                           </div>
                             <div class="form-group">
                              <input type="button" name="btn-confirm" id="btn-confirm" tabindex="1" class="btn-confirm" value="Confirm"/>
                           </div>
                            <div class="form-group">
                              <input type="text" name="name" id="name" tabindex="1" class="form-control" placeholder="Name">
                           </div>
                             <label class="radio-inline"><input type="radio" name="gen" value="male" checked="checked">남</label>
						<label class="radio-inline"><input type="radio" name="gen" value="female">여</label>
						  <div class="form-group">
                              <input type="text" name="phone" id="phone" tabindex="1" class="form-control" placeholder="phone number">
                           </div>
                           <div class="form-group">
                              <input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="Email Address" value="">
                           </div>
                           <div id="incommon-info">
                          		 <div class="form-group">
                          	    <input type="text" name="job" id="job" tabindex="1" class="form-control" placeholder="job" value="">
                         	  </div>
                        	   <div class="form-group">
                              <input type="text" name="birth" id="birth" tabindex="1" class="form-control" placeholder="Birth" value="">
                           </div>
                           <div class="form-group">
                              <input type="text" name="address" id="addr" tabindex="1" class="form-control" placeholder="Address" value="">
                           </div>
                           	<span style="display: inline-block; width: 100px">우편번호</span> <input type="text" name="" class="postcodify_postcode5" value="" />
							<input type="button" class="btn-addr" id="postcodify_search_button" value="검색"/><br />
							<span style="display: inline-block;width: 100px;">도로명 주소</span><input type="text" name="" class="postcodify_address" value="" /><br />
							<span style="display: inline-block;width: 100px;">상세주소</span><input type="text" name="" class="postcodify_details" value="" /><br />
							<span style="display: inline-block;width: 100px;">참고항복</span><input type="text" name="" class="postcodify_extra_info" value="" /><br />
                             
                              <div class="form-group">
                              <div class="row">
                                 <div class="col-sm-6 col-sm-offset-3">
                                    <input type="submit" name="register-patient" id="register-patient" tabindex="4" class="form-control btn btn-register" value="Register Now">
                                 </div>
                                 </div>
                                 </div>
                                 
                              </div>
                           </div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   </div>
   <script>
   app.permission.execute();
   </script>