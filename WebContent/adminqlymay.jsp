<%@page import="bean.Loaibean"%>
<%@page import="bean.maybean"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="bean.adminbean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin NSTORE</title>
  <meta charset="utf-8">
  
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 

 </style> 
  
</head>

<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
   
    <ul class="nav navbar-nav" style="font-size: 15px;">
      <li class="active"><a href="qlyMayController">Quản lý Máy</a></li>
      <li ><a href="adminqlyloaiController"> Quản lý Loại Máy</a></li>
      <li ><a href="adminqlykhController"> Quản lý Khách Hàng</a></li>
      <li><a href="adminqlyhoadonController">Quản Lý Hóa đơn</a></li>
      
    </ul>
    <ul class="nav navbar-nav navbar-right">
     
      
      
      <li style="display:flex;">
      
	   <c:if test="${sessionScope.admin!=null}"> 
	   <a>Xin Chào: ${admin.getTenDangNhap() } </a>
	   <a href=adminlogoutController><span class="glyphicon glyphicon-off"></span> Đăng xuất</a>
	   </c:if>
	   <c:if test="${sessionScope.admin==null}">
	   <a href="adminloginController"type="button"  ><span class="glyphicon glyphicon-log-in"></span> 	Đăng nhập</a>
	   </c:if>
	   </li>
	   <c:if test="${not empty sessionScope.tb}">  	 
  	 <script>alert('${tb}');</script>	
  	 <c:set scope="session" var="tb" value="${null}" />	   		   		
  	 </c:if>
    </ul>
  </div>
</nav>
<div class="tbsachctner">
<table id="tbsach"class="table table-hover" >	
				<tr class="danger" style="witdh:100%">	
    			<th width="110"> Ảnh</th>
				<th width="20"> Mã Máy </th>
				<th width="200">Tên Máy</th>
				<th width="100">Màn Hình</th>
				<th width="100">RAM</th>
				<th width="100">CPU</th>
				<th width="100">Ổ cứng</th>
				<th width="100">Giá</th>
				<th width="20">Số Lượng</th>
				
				<th width="80">Mã loại</th>
				<th> </th>
		</tr>		
		<form method="post" action="adminthemmayController" enctype="multipart/form-data">
		<tr class="info">							
    			<th ><input style="width:110px" type="file" name="image" placeholder="image"></th>   						
				<th > <input style="width: 60px" name="mamay" placeholder="Mã Máy" > </th>
				<th ><input style="width: 220px" name="tenmay" placeholder="Tên Máy"></th>										
				<th ><input style="width: 150px" name="manhinh" placeholder="Màn Hình"></th>
				<th ><input style="width: 150px"name="ram" placeholder="RAM"></th>
				<th ><input style="width: 100px" name="cpu" placeholder="CPU"></th>
				<th ><input style="width: 100px" name="ocung" placeholder="Ổ cứng"></th>				
				<th ><input style="width: 100px" name="gia" placeholder="Giá""></th>
				<th ><input  style="width: 40px"name="soluong" placeholder="Số Lượng"></th>
				<th> <div class="form-group">			
 				 <select name= "maloai" style="width: 80px">
 				 <option value="">Mã loại</option> 				 
 				 <c:forEach items="${dsloai}" var="loai">				  				 				  				  
 				  <option value="${loai.getMaloai()}">${loai.getMaloai()}</option>
 				  </c:forEach>
 				 </select> 				 
 				  </div>
 				</th>  				       								
				<th><button type="submit"  class="btn btn-info" >Thêm +</button> </th>
		</tr>				
		</form>	
	
	<c:forEach items="${dsmay}" var="may">
	
	<form method="post" action="suaMayController">
 		<tr class="success">	
 				<th > <img name="image" src="${may.getAnh()}" style="witdh:100px; height:100px;"></th>		
				<th  style="display: none;"> <input name="mamaybandau" value="${may.getMamay()} "> </th>
											
				<th > <input style="width: 60px" name="mamay" value="${may.getMamay()}" > </th>
				<th ><input style="width: 220px" name="tenmay"value="${may.getTenmay()}"></th>										
				<th ><input style="width: 150px" name="manhinh" value="${may.getManhinh()}"></th>
				<th ><input style="width: 150px"name="ram" value="${may.getRam()}"></th>
				<th ><input style="width: 100px" name="cpu" value="${may.getCpu()}"></th>
				<th ><input style="width: 100px" name="ocung" value="${may.getOcung()}"></th>				
				<th ><input style="width: 100px" name="gia"value="${may.getGia()}"></th>
				<th ><input  style="width: 40px"name="soluong"value="${may.getSoluong()}"></th>
				<th ><input style="width: 80px" name="maloai"value="${may.getMaloai()}"></th>
				<th > <button type="submit" name="butsua" class="btn btn-info">Sửa</button>
				<button type="submit" name="butxoa" class="btn btn-info btn2">Xóa</button>	</th>
				
 		</tr>
	</form>
	
</c:forEach>
</table>
</div>


</body>
</html>	