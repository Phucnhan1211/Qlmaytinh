<%@page import="bean.khachhangbean"%>
<%@page import="bean.lichsumuahangbean"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="bo.maybo"%>
<%@page import="bean.maybean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.Loaibean"%>
<%@page import="bo.loaibo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  
<!DOCTYPE html>
<html lang="en">
<head>
  <title>NSTORE</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://code.iconify.design/2/2.1.0/iconify.min.js"></script>
</head>


<nav style=" height:100px" class="navbar navbar-inverse">
  <div class="container-fluid">    
    <ul style="margin-top: 25px ;font-size: 17px;" class="nav navbar-nav">
      <li class="active"><a href="HtMayTinhController"><b>Trang chủ</b></a></li>
      <li><a href="HtGioHangController"><b>Giỏ hàng</b></a></li>
      <li><a href="thanhtoanController"><b>Thanh toán</b></a></li>
      <li><a href="lichsumuahangController"><b>Lịch sử mua hàng</b></a></li>
    </ul>
     <%String a=null; %>
    <form style="margin-top: 33px;" class="navbar-form navbar-left" action="HtMayTinhController?search=<%=a%>">
      <div class="input-group">
        <input style=" width:300px" type="text" class="form-control" placeholder="Search" name="search" value="<%= (request.getParameter("search") != null) ? request.getParameter("search") : "" %>" aria-label="Search">
		    <%   a=request.getParameter("search");%>
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit">
            <i class="glyphicon glyphicon-search"></i>
          </button>
        </div>
      </div>
    </form>
    
<ul class="nav navbar-nav navbar-right">
      <li><a href="#" data-toggle="modal" data-target="#myModal1">
      		<span class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
      <li>      
        <%
         khachhangbean kh= (khachhangbean)session.getAttribute("kh");
      
        if(kh!=null){
      %>
        <a href="#">Xin chào: <%=kh.getHoten()%> </a>
        <a href="logoutController"> <span class="glyphicon glyphicon-off"></span> Đăng xuất</a>
          <%}else{ %>
          <a href="#" data-toggle="modal" data-target="#myModal">
		    <span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
		           <%if(session.getAttribute("tb")!=null){
		        	   out.print("<script>alert('"+session.getAttribute("tb")+"');</script>" );
		        	   }
          }
        %> 
        <%if(session.getAttribute("tbdk")!=null){
		        	   out.print("<script>alert('"+session.getAttribute("tbdk")+"');</script>" );
		        	   session.setAttribute("tbdk", null);
        }%>
        <% if(session.getAttribute("tblichsu")!=null){
		   		out.print("<script>alert('"+session.getAttribute("tblichsu")+"');</script>" );
		   		session.setAttribute("tbdk",null);
  			}
   	%>
    </ul>
  </div>
</nav>

  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Đăng nhập hệ thống</h4>
        </div>
  <div class="modal-body">
          <form method="post" action="ktdnController">
             <label> Tên đăng nhập: </label>
             <input name="txtun" type="text" class="form-control">
             <label> Mật khẩu: </label>
             <div class="form-group">
             <input name="txtpass" type="password" class="form-control"> </div>
             <div class="dangnhap">
             <input name="dangnhap" type="submit" value="Đăng nhập" class="btn-primary"> </div>
         </form>
        </div>
      
      </div>
    </div>
  </div>
  
   <div class="modal fade1" id="myModal1" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Đăng kí</h4>
  		<div class="modal-body">
  		<div class="left" style="width: 45%; float:left">
          <form method="post" action="ktdkController">
          	<div class="form-group">
             <div>
             <input name="txtun" type="text" class="form-control" placeholder="Nhập Username"/> 
             </div>
             </div>
             <div class="form-group">
             <input name="txtpass" type="password" class="form-control" placeholder="Nhập mật khẩu"/> 
             </div>
             <div class="form-group">
             <input name="txtpassrep" type="password" class="form-control" placeholder="Nhập lại mật khẩu"/> 
             </div>
             <div class="form-group">
             <input name="txtemail" type="email" class="form-control" placeholder="Nhập địa chỉ email"/> 
             </div>
             <div class="form-group">
             <input name="txtsdt" type="text" class="form-control" placeholder="Nhập số điện thoại"/> 
             </div>
             <div class="dangki">
             <input name="dangki" type="submit" value="Đăng kí" class="btn-primary"> 
             <input type="checkbox" id="chkdk" name="chkdk" checked /> Tôi đồng ý thoả thuận sử dụng </div>         
        </div>
    	<div class="right" style="width: 50%; float:right">         
          	<div class="form-group">
             <input name="txthoten" type="text" class="form-control" placeholder="Nhập Họ và Tên"/> 
             </div>
             <div class="form-group">
             <select name= "sex" style="height: 200%; width: 40%">
 				  <option value>Giới Tính</option>
 				  <option value="1">Nam</option>
 				  <option value="0">Nữ</option>
 				  </select>
 				  </div>
 			 <div class="form-group">
 			 <select name= "day" style="height: 200%; width: 32%">
 				  <option value>Ngày sinh</option>
 				  <option value="1">1</option>
 				  <option value="2">2</option>
 				  <option value="3">3</option>
 				  <option value="4">4</option>
 				  <option value="5">5</option>
 				  <option value="6">6</option>
 				  <option value="7">7</option>
 				  <option value="8">8</option>
 				  <option value="9">9</option>
 				  <option value="10">10</option>
 				  <option value="11">11</option>
 				  <option value="12">12</option>
 				  <option value="13">13</option>
 				  <option value="14">14</option>
 				  <option value="15">15</option>
 				  <option value="16">16</option>
 				  <option value="17">17</option>
 				  <option value="18">18</option>
 				  <option value="19">19</option>
 				  <option value="20">20</option>
 				  <option value="21">21</option>
 				  <option value="22">22</option>
 				  <option value="23">23</option>
 				  <option value="24">24</option>
 				  <option value="25">25</option>
 				  <option value="26">26</option>
 				  <option value="27">27</option>
 				  <option value="28">28</option>
 				  <option value="29">29</option>
 				  <option value="30">30</option>
 				  <option value="31">31</option>
 				  </select>
 			<select name= "month" style="height: 200%; width: 32%">
 				  <option value>Tháng</option>
 				  <option value="1">1</option>
 				  <option value="2">2</option>
 				  <option value="3">3</option>
 				  <option value="4">4</option>
 				  <option value="5">5</option>
 				  <option value="6">6</option>
 				  <option value="7">7</option>
 				  <option value="8">8</option>
 				  <option value="9">9</option>
 				  <option value="10">10</option>
 				  <option value="11">11</option>
 				  <option value="12">12</option>
 				  </select> 
 			<select name= "year" style="height: 200%; width: 32%">
 				  <option value>Năm</option>
 				  <option value="1995">1995</option>
 				  <option value="1996">1996</option>
 				  <option value="1997">1997</option>
 				  <option value="1998">1998</option>
 				  <option value="1999">1999</option>
 				  <option value="2000">2000</option>
 				  <option value="2001">2001</option>
 				  <option value="2002">2002</option>
 				  <option value="2003">2003</option>
 				  <option value="2004">2004</option>
 				  <option value="2005">2005</option>
 				  <option value="2006">2006</option>
 				  </select>
 			 </div>	
 			 <div class="form-group">
 			 <select name= "txtdiachi" style="height: 200%; width: 40%">
 				  <option value>Địa chỉ</option>
 				  <option value="Hue">Huế</option>
 				  <option value="Da Nang">Đà Nẵng</option>
 				  <option value="Quang Tri">Quảng Trị</option>
 				  <option value="Quang Binh">Quảng Bình</option>
 				  </select>  
 				 </div>
         </form>
        </div>    
      </div>
    </div>
  </div>
  </div>
  </div>

 <%
     request.setCharacterEncoding("utf-8");
     response.setCharacterEncoding("utf-8");
     ArrayList<maybean> dsmay=(ArrayList<maybean>)request.getAttribute("dsmay");
     ArrayList<Loaibean> dsloai=(ArrayList<Loaibean>)request.getAttribute("dsloai");
     
  %>  
 
  <table width="1100" align="center" style="margin-bottom:30px">
     <tr>
		<td width="250" valign="top">
		<h4> <b style="color:#fc0004;" >DANH SÁCH LOẠI MÁY</b></h4>
             <table class="table table-hover" width="100%">
                <%for(Loaibean L:dsloai){ %>
                    <tr class="success">
                        <td><a href="HtMayTinhController?ml=<%=L.getMaloai()%>"><span class="glyphicon glyphicon-chevron-right" style="text-indent:0px"></span><b> <%=L.getTenloai() %></b></a> </td>
                    </tr>
                    <%} %>
             </table>
         </td>	
 		 <td width="900" valign="top">
 		 <table class="table table-hover">	
		 		<h3 align="center"> <b style="color:#0055ff;">LỊCH SỬ MUA HÀNG </b></h3>
				<tr class="info">				
					<th width="10">  </th>
					<th width="100">Hình ảnh</th>
					<th width="300">Tên máy</th>
					<th width="300">Màn hình</th>
					<th width="300">RAM</th>
					<th width="300">CPU</th>
					<th width="200">Ngày mua</th>
					<th width="100">Số Lượng</th>
					
					<th width="100">Tổng Giá</th>
					<th width="110">Tình trạng</th>
				<tr>
				<%ArrayList<lichsumuahangbean> lsmh=(ArrayList<lichsumuahangbean>)request.getAttribute("lsmh"); 
				if(lsmh!=null){
		             DecimalFormat formatter = new DecimalFormat("###,###,###");

					Long tongtien=(long) 0;
					for (lichsumuahangbean l:lsmh){
					tongtien+= l.getTongGia();
					
				%>
				<tr class="danger">				
					<td width="10">  </th>
					<td width="100"> <img src="<%=l.getAnh() %>" height="80px" width="80px"> </td>
					<td width="300"><%=l.getTenmay() %></td>															
					<td width="300"><%=l.getRam() %></td>
					<td width="300"><%=l.getCpu() %></td>
					<td width="300"><%=l.getManhinh() %></td>
					<td width="200"><%=l.getNgayMua() %></td>
					<td width="100"><%=l.getSoLuongMua() %></td>
					
					<td width="100"><%=formatter.format(l.getTongGia()) %> VNĐ</td>
					<td width="90"><%=l.getDamua()==1?"Đã mua":"Đang xử lý" %></td>
				<tr>
				
				<% }%>	
					
					<tr><td width="500" style="position: absolute; color:#fa0004 "> <b>Tổng tiền đã mua: <%=formatter.format(tongtien) %> VNĐ </b></td> </tr>
					<%}%>
						
		 		</table> 
         </td>
        
     </tr>
  </table>

</body>
</html>