package adminController;

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
import bean.adminbean;
import bean.maybean;
import bo.loaibo;
import bo.maybo;

/**
 * Servlet implementation class qlySachController
 */
@WebServlet("/qlyMayController")
public class qlyMayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public qlyMayController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
		     response.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			adminbean admin = (adminbean) session.getAttribute("admin");
			
		     
			 
			if(admin!=null){
				loaibo loai= new loaibo();
			     maybo mbo=new maybo();
			      ArrayList<maybean> dsmay=mbo.getmay();
			     ArrayList<Loaibean> dsloai=loai.getloai();
			     request.setAttribute("dsloai", dsloai);
			     request.setAttribute("dsmay", dsmay);
			     
			     String key=request.getParameter("search");
			     if(key!=null)
			    		 dsmay=mbo.Tim(key);
		    	 session.setAttribute("admin", admin);
		    	 RequestDispatcher rd= request.getRequestDispatcher("adminqlymay.jsp");
				 rd.forward(request, response);
		     }
		     else {
		    	 
		    	 RequestDispatcher rd= request.getRequestDispatcher("adminloginController");
				 rd.forward(request, response);
		     }
		} catch (Exception e) {
			System.out.print(e);
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
