package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.giohangbo;

/**
 * Servlet implementation class giohangController
 */
@WebServlet("/giohangController")
public class giohangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public giohangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8") ;
	    response.setCharacterEncoding("utf-8");
	    HttpSession session = request.getSession();
		String mamay = request.getParameter("mm");
		String tenmay = request.getParameter("tm");
		String manhinh = request.getParameter("mh");
		String ram = request.getParameter("tr");
		String cpu = request.getParameter("tc");
		String ocung = request.getParameter("to");
		String giatam = request.getParameter("gia");
		//Nguoi dau tien.
		if(mamay!=null){		
			giohangbo gh=null;
			if(session.getAttribute("gh") == null){
				gh = new giohangbo();
				session.setAttribute("gh", gh);
		}
			//gan session vao bien
			//thay doi bien
			gh = (giohangbo)session.getAttribute("gh");
			gh.Them(mamay, tenmay,manhinh,ram ,cpu,ocung, Long.parseLong(giatam), (long)1);
			session.setAttribute("gh", gh);
			//hien thi gio hang	     
		}
	      
	     response.sendRedirect("HtGioHangController");
		
	   
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
