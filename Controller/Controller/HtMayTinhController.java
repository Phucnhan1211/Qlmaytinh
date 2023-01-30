package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.Loaibean;
import bean.maybean;
import bo.loaibo;
import bo.maybo;
/**
 * Servlet implementation class HtMayTinhController
 */
@WebServlet("/HtMayTinhController")
public class HtMayTinhController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HtMayTinhController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			 request.setCharacterEncoding("utf-8");
		     response.setCharacterEncoding("utf-8");
			
			  loaibo loai= new loaibo();
		      maybo mbo= new maybo();
		      ArrayList<maybean> dsmay=mbo.getmay();
		      ArrayList<Loaibean> dsloai=loai.getloai();
			 String ml=request.getParameter("ml");
		     String search=request.getParameter("search");
		     if(ml!=null)
		    	 dsmay=mbo.TimMaloai(ml);
		     else
		    	 if(search!=null)
		    		 dsmay=mbo.Tim(search);
		     
		     request.setAttribute("dsloai", dsloai);
		     request.setAttribute("dsmay", dsmay);
		     RequestDispatcher rd= request.getRequestDispatcher("menumaytinh.jsp");
			 rd.forward(request, response);//Chuyen tiep request va response ve trang maytinh.jsp
			 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
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
