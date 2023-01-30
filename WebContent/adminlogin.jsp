<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Admin NSTORE</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
  <style>
    body {
    font-family: "Lato", sans-serif;
    background-image: url(image_may/giphy.gif);
}



.main-head{
    height: 150px;
    background: #FFF;
   
}

.sidenav {
    height: 100%;
    background-color: #e6f078;
    overflow-x: hidden;
    padding-top: 20px;
}


.main {
    padding: 0px 10px;
}

@media screen and (max-height: 450px) {
    .sidenav {padding-top: 15px;}
}

@media screen and (max-width: 450px) {
    .login-form{
        margin-top: 10%;
    }

    .register-form{
        margin-top: 10%;
    }
}

@media screen and (min-width: 768px){
    .main{
        margin-left: 40%; 
    }

    .sidenav{
        width: 40%;
        position: fixed;
        z-index: 1;
        top: 0;
        left: 0;
    }

    .login-form{
        margin-top: 80%;
    }

    .register-form{
        margin-top: 20%;
    }
}


.login-main-text{
    margin-top: 10%;
    padding: 110px;
    color: #fff;
}

.login-main-text h2{
    font-weight: 300;
   
}

.btn-black{
    background-color: #000 !important;
    color: #fff;
}
.text-login{
    font-size: 50px;
}
.login-form{
    width: 100%;
    max-width: 400px;
    height: 250px;
    margin: 20px auto;
    background-color: #ffffff;
    padding: 15px;
    border: 2px dotted #cccccc;
    border-radius: 10px;
    margin-top: 200px;
}

  </style>
</head>
<body>
	 <c:if test="${not empty sessionScope.tb}">  	 
	  	 <script>alert('${tb}');</script>
	  	 <c:set scope="session" var="tb" value="${null}" />		   		   		
  	 </c:if>
  	 <c:if test="${dnadmin.isQuyen() == true }"> <li><a href="qlTaiKhoan">QL Tài khoản</a></li></c:if>
	<div class="sidenav">
    <div class="login-main-text text-login">
        <img src="image_may/logo.png" height="250px" width="330px" style="border-radius: 100px;"> 
        <h6></h6>
        <h4><b style="color:#f20004">Uy tín - An toàn - Chất lượng!</b></h4> 
    </div>
 </div>
 <div class="main">
    <div class="col-md-6 col-sm-12">
       <div class="login-form">
          <form action="ktdnadminController" method="post">
             <div class="form-group">
                <label style="color:#cc0003"><b>Tên đăng nhập</b></label> <br>
                <input type="text" class="form-control"  name="TenDangNhap"placeholder="Nhập username">
             </div>
             <div class="form-group">
                <label style="color:#cc0003"><b>Mật khẩu</b></label> <br>
                <input type="password" class="form-control" name="MatKhau" placeholder="Nhập mật khẩu">
             </div>
             <button type="submit" class="btn btn-black" style="float:right">Login</button>
          </form>
       </div>
    </div>
 </div>
 
</body>
</html>