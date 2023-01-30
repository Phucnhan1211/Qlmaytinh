<%@page import="bean.khachhangbean"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="bo.maybo"%>
<%@page import="bean.maybean"%>
<%@page import="bean.giohangbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.Loaibean"%>
<%@page import="bo.loaibo"%>
<%@page import="bo.giohangbo"%>
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
          <form method="post" action="dangnhapController">
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
          <form method="post" action="dangkiController">
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
 
  <table width="1150" align="center" style="margin-bottom:30px">
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
         </td>
 		 <td width="1000" valign="top">
 		 <table class="table table-hover">	
				<tr class="info">				
				<th width="5">  </th>
				<th width="50">Hình ảnh</th>
				<th width="300">Tên máy</th>
				<th width="200">Màn hình</th>
				<th width="200">RAM</th>
				<th width="200">CPU</th>
				<th width="200">Ổ cứng</th>
				<th width="10">Số Lượng</th>
				<th width="240">   </th>
				<th width="10">Tổng Giá</th>
				<th width="20"></th>

			</tr> 
					<%
		             DecimalFormat formatter = new DecimalFormat("###,###,###");

				     giohangbo gh1=(giohangbo)session.getAttribute("gh");
				     if(gh1!=null){
				    	 for(giohangbean g: gh1.ds){%>
				     <form method="post" action="suaController?mm=<%=g.getMamay()%>">
					      <tr class="danger">
					      <%
					      	 maybo mbo1 = new maybo();
					      	 ArrayList<maybean> dsmay1 = mbo1.getmay();
					      	 maybean m1= new maybean();
					      	 for(maybean s:dsmay1){
					      		 if(s.getMamay().equals(g.getMamay())) m1=s;
					      		 
					      	 }
               				%>		
               			<td ><input type="checkbox"  name="cb<%=g.getMamay() %>" value="checked" style="opacity:0;"> </td>			      	
					      	<td > <img src="<%=m1.getAnh() %>" height="80px" width="80px"></td>
					      	
				        	<td ><%=g.getTenmay()%> </td>
				         	<td ><%=g.getManhinh()%> </td>
				         	<td ><%=g.getRam()%> </td>
				         	<td ><%=g.getCpu()%> </td>
				         	<td ><%=g.getOcung()%> </td>
				           	<td ><%=g.getSlmua() %> </td>				
							<td ><input name="txtsl" type="number" style="width: 40%">
				               <button name="butsua" type="submit" class="btn-link" value="sua">
				                  Sửa 
				                </button>
				           </td>
				            <td><%=formatter.format(g.getThanhtien()) %>VND </td>
				            <td >				            
				              <button name="butxoa" type="submit" class="btn-link" value="xoa" >
				                   <span class="glyphicon glyphicon-trash"></span>
				                </button>
				             </td>
					 	</tr>
				       </form>
				       <%} %>
   			</table>
             <b style="color :#fa0004" >Tổng tiền: <%=formatter.format(gh1.Tongtien()) %>VND</b><br/>
             <%} %>
             <table style="float:right">
             <tr>
             
             <td style="width: 31%">
             <form action="suaController"method="post">
             <button name="trasach" type="submit" class="btn btn-outline-success my-2 my-sm-0" > <b>Trả lại toàn bộ</b> </button>
             </form>
             </td>
             
             <td style="width: 37%">
             <form action="HtMayTinhController">
             <button class="btn btn-outline-success my-2 my-sm-0" type="submit"  > <b>Tiếp tục mua hàng </b></button>
             </form></td>
    	     <td style="width: 25%">
    	     <form action="thanhtoanController">
    	     <button class="btn btn-info" type="submit" ><b>Thanh Toán</b></button>
    	     </form></td>
    	     </tr>
    	     </table>
         </td>
        
     </tr>
  </table>

</body>
</html>