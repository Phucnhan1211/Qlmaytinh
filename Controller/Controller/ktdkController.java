package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.khachhangbo;

/**
 * Servlet implementation class ktdk
 */
@WebServlet("/ktdkController")
public class ktdkController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ktdkController() {
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
		     String passrep=request.getParameter("txtpassrep");
		     String name=request.getParameter("txthoten");
		     String address=request.getParameter("txtdiachi");
		     String phonenumber=request.getParameter("txtsdt");
		     String email=request.getParameter("txtemail");
		     khachhangbo khbo= new khachhangbo();
		     HttpSession session= request.getSession();
		     if(un!=""&&pass!=""&&passrep!=""&&(passrep.equals(pass)))
			     if(khbo.kttaikhoantontai(un)) {
			    	 khbo.taotaikhoan(un, passrep, name, address, phonenumber,email);
			    	 session.setAttribute("tbdk", "Đăng kí thành công");
			     }
			     else 
			     {
			    	 session.setAttribute("tbdk", "Tên đăng nhập tồn tại!");
			     }
		     else{ session.setAttribute("tbdk", "Vui lòng điền tên đăng nhập");
				}
		     RequestDispatcher rd= request.getRequestDispatcher("HtMayTinhController");
		     rd.forward(request, response);
		     
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
