package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Loaibean;
import bean.hoadonbean;
import bean.khachhangbean;
import bean.lichsumuahangbean;
import bean.maybean;
import bo.giohangbo;
import bo.hoadonbo;
import bo.lichsumuahangbo;
import bo.loaibo;
import bo.maybo;

/**
 * Servlet implementation class lichsumuahangController
 */
@WebServlet("/lichsumuahangController")
public class lichsumuahangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public lichsumuahangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			loaibo loai= new loaibo();
		     maybo mbo=new maybo();
		      ArrayList<maybean> dsmay=mbo.getmay();
		     ArrayList<Loaibean> dsloai=loai.getloai();
		     String ml=request.getParameter("ml");
		     String key=request.getParameter("search");
		     if(ml!=null)
		    	 dsmay=mbo.TimMaloai(ml);
		     else
		    	 if(key!=null)
		    		 dsmay=mbo.Tim(key);
		     
		     request.setAttribute("dsloai", dsloai);
		     request.setAttribute("dsmay", dsmay);
		     
		     HttpSession session = request.getSession();
		     hoadonbo hd= new hoadonbo();
			 khachhangbean kh= (khachhangbean)session.getAttribute("kh");
			 if(kh!=null)
			 {
				 lichsumuahangbo lsmhbo= new lichsumuahangbo();
			     ArrayList<lichsumuahangbean> lsmh=lsmhbo.getlichsumuahang(kh.getMakh());
			     //sort lại lịch sử mua hàng những cuốn trùng mã sách
			     for (int i=0;i<lsmh.size();i++) {
			    	 for(int j=i+1;j<lsmh.size();j++)
						if(lsmh.get(i).getMaMay().equals(lsmh.get(j).getMaMay())&&i!=j&&(lsmh.get(i).getDamua()==lsmh.get(j).getDamua())) {
							Long sl=lsmh.get(i).getSoLuongMua()+lsmh.get(j).getSoLuongMua();
							lsmh.get(i).setSoLuongMua(sl);
							lsmh.remove(j);
							
							j--;
						}
						
					}
			    request.setAttribute("lsmh", lsmh);
			    
			    RequestDispatcher rd= request.getRequestDispatcher("lichsumuahang.jsp");
				rd.forward(request, response);
			 }
			 else {
				 session.setAttribute("tb","Vui lòng đăng nhập để xem lịch sử mua hàng");
				 RequestDispatcher rd= request.getRequestDispatcher("HtMayTinhController");
					rd.forward(request, response);
			 }
				
			
		} catch (Exception ex) {
			System.out.print(ex);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
