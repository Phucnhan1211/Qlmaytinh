package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import bean.khachhangbean;
import bo.khachhangbo;

/**
 * Servlet implementation class ktdnController
 */
@WebServlet("/ktdnController")
public class ktdnController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ktdnController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	     try {
	    	 String un=request.getParameter("txtun");
		     String pass=request.getParameter("txtpass");
		     khachhangbo khbo= new khachhangbo();
		     khachhangbean kh = khbo.ktdn(un, pass);
		     HttpSession session = request.getSession();
		     if(kh!=null){
		    	 session.setAttribute("kh", kh);
		    	 RequestDispatcher rd= request.getRequestDispatcher("HtMayTinhController");
		    	 rd.forward(request, response);
		     }
		     else {
		    	 session.setAttribute("tb", "Đăng nhập sai");
		    	 RequestDispatcher rd= request.getRequestDispatcher("HtMayTinhController");
		    	 rd.forward(request, response);
		     }
		     
		} catch (Exception ex) {
			ex.printStackTrace();
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
