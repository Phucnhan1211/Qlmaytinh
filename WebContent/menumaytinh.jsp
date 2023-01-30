<%@page import="bean.khachhangbean"%>
<%@page import="bo.maybo"%>
<%@page import="bean.maybean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.Loaibean"%>
<%@page import="bo.loaibo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.text.DecimalFormat"%>  
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


<nav style=" height:100px; b" class="navbar navbar-inverse">
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
 				  <option value>Tỉnh</option>
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
 		 <td width="950" valign="top">
 		 <div class="col-md-6 col-md-offset-3" style="float: right;height: 100%; width: 100%"> 
   			<div id="myCarousel" class="carousel slide" > 
    			<ol class="carousel-indicators"> 
			     <li data-target="#myCarousel" data-slide-to="0" class="active"></li> 
			     <li data-target="#myCarousel" data-slide-to="1"></li> 
			     <li data-target="#myCarousel" data-slide-to="2"></li> 
			     <li data-target="#myCarousel" data-slide-to="3"></li> 
			     <li data-target="#myCarousel" data-slide-to="4"></li> 
			    </ol> 
    		<div class="carousel-inner"> 
			     <div class="item active" > <img class="thumbnail" src="image_may/h1.jfif"   alt="Slide1" > 
			     </div> 
			     <div class="item" > <img class="thumbnail" src="image_may/h2.jfif"  alt="Slide2"> 
			     </div> 
			     <div class="item" > <img class="thumbnail" src="image_may/h3.jfif"   alt="Slide3"> 
			     </div> 
			     <div class="item" > <img class="thumbnail" src="image_may/h4.jfif"   alt="Slide4"> 
			     </div>
			     <div class="item" > <img class="thumbnail" src="image_may/h5.jfif"   alt="Slide5"> 
			     </div>  
			       	<a class="left carousel-control" style="background-image:''" href="#myCarousel" role="button" data-slide="prev">
    				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span><span class="sr-only"></span>
 					 </a>
 					 <a class="right carousel-control" style="background-image:''" href="#myCarousel" role="button" data-slide="next">
    				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><span class="sr-only"></span>
  					</a>
			    </div> 
			   </div> 
			  </div>
              <table class="table table-hover">
             <%  DecimalFormat formatter = new DecimalFormat("###,###,###");
                int n=dsmay.size();
             for(int i=0;i<n;i++){
            	 maybean m=dsmay.get(i);%>
            	 <tr>
            	   <div> <td style="text-align:center;">									
					<img src="<%=m.getAnh() %>"><br>
					<b><%=m.getTenmay() %> <br></b>
					<form action="" style="text-align:left;background-color:#f7eba8;margin-left: 25px;margin-right: 10px;border-radius: 6px" >
					<span style="margin-left: 10px" data-title="Màn hình">
						<i class="iconify" data-icon="whh:tabletscreensize"></i><%=m.getManhinh() %> <br>
					</span>
					<span style="margin-left: 10px" data-title="CPU">
						<i class="iconify" data-icon="bi:cpu"></i><%=m.getCpu() %> <br>
					</span>
					<span style="margin-left: 10px" data-title="RAM">
						<i class="iconify" data-icon="gg:smartphone-ram"></i><%=m.getRam() %> <br>
					</span>
					<span style="margin-left: 10px" data-title="Ổ cứng">
						<i class="iconify" data-icon="el:hdd"></i><%=m.getOcung() %> <br> 
					</span>
					</form>					
					<b style="color:#ff4000;font-size:14px">Giá: <%=formatter.format(m.getGia())%> VNĐ</b> <br>				
            	        <a href="giohangController?mm=<%=m.getMamay()%>&tm=<%=m.getTenmay()%>&mh=<%=m.getManhinh()%>&tc=<%=m.getCpu()%>&tr=<%=m.getRam()%>&to=<%=m.getOcung()%>&gia=<%=m.getGia()%>"> 
            	       <img src="image_may/mua.png" height="40px" width="140px"> 
            	    </a>         	              	          
            	    </td>  
            	  </div>
            	 <%i++;
            	 	if(i<n){	
            	    	m=dsmay.get(i); %>
            	    <td style="text-align:center;">									
					<img src="<%=m.getAnh() %>"><br>
					<b><%=m.getTenmay() %> <br></b>
					<form action="" style="text-align:left;background-color:#f7eba8;margin-left: 25px;margin-right: 10px;border-radius: 6px" >
					<span style="margin-left: 10px" data-title="Màn hình">
						<i class="iconify" data-icon="whh:tabletscreensize"></i><%=m.getManhinh() %> <br>
					</span>
					<span style="margin-left: 10px" data-title="CPU">
						<i class="iconify" data-icon="bi:cpu"></i><%=m.getCpu() %> <br>
					</span>
					<span style="margin-left: 10px" data-title="RAM">
						<i class="iconify" data-icon="gg:smartphone-ram"></i><%=m.getRam() %> <br>
					</span>
					<span style="margin-left: 10px" data-title="Ổ cứng">
						<i class="iconify" data-icon="el:hdd"></i><%=m.getOcung() %> <br> 
					</span>
					</form>					
					<b style="color:#ff4000;font-size:14px">Giá: <%=formatter.format(m.getGia())%> VNĐ</b> <br>				
            	        <a href="giohangController?mm=<%=m.getMamay()%>&tm=<%=m.getTenmay()%>&mh=<%=m.getManhinh()%>&tc=<%=m.getCpu()%>&tr=<%=m.getRam()%>&to=<%=m.getOcung()%>&gia=<%=m.getGia()%>"> 
            	       <img src="image_may/mua.png" height="40px" width="140px"> 
            	    </a>         	              	          
            	    </td>  
            	    <%} %>
            	    <%i++;
            	    if(i<n){
            	    	m=dsmay.get(i); %>
            	    <td style="text-align:center;">									
					<img src="<%=m.getAnh() %>"><br>
					<b><%=m.getTenmay() %> <br></b>
					<form action="" style="text-align:left;background-color:#f7eba8;margin-left: 25px;margin-right: 10px;border-radius: 6px" >
					<span style="margin-left: 10px" data-title="Màn hình">
						<i class="iconify" data-icon="whh:tabletscreensize"></i><%=m.getManhinh() %> <br>
					</span>
					<span style="margin-left: 10px" data-title="CPU">
						<i class="iconify" data-icon="bi:cpu"></i><%=m.getCpu() %> <br>
					</span>
					<span style="margin-left: 10px" data-title="RAM">
						<i class="iconify" data-icon="gg:smartphone-ram"></i><%=m.getRam() %> <br>
					</span>
					<span style="margin-left: 10px" data-title="Ổ cứng">
						<i class="iconify" data-icon="el:hdd"></i><%=m.getOcung() %> <br> 
					</span>
					</form>					
					<b style="color:#ff4000;font-size:14px">Giá: <%=formatter.format(m.getGia())%> VNĐ</b> <br>				
            	        <a href="giohangController?mm=<%=m.getMamay()%>&tm=<%=m.getTenmay()%>&mh=<%=m.getManhinh()%>&tc=<%=m.getCpu()%>&tr=<%=m.getRam()%>&to=<%=m.getOcung()%>&gia=<%=m.getGia()%>"> 
            	       <img src="image_may/mua.png" height="40px" width="140px"> 
            	    </a>         	              	          
            	    </td>         	    
            	    <%} %>					
            	    </tr>
            	    <%} %>
             </table>
         </td>
        
     </tr>
  </table>
   <script>   
$('#myCarousel').carousel({ 
    interval:   2000    
});
</script>
</body>
</html>