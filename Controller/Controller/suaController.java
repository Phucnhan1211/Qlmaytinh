package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.giohangbo;

/**
 * Servlet implementation class suaController
 */
@WebServlet("/suaController")
public class suaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public suaController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		HttpSession session = request.getSession();
		String mm=request.getParameter("mm");
		String sl=request.getParameter("txtsl");
		giohangbo  gh=(giohangbo)session.getAttribute("gh");
		if(mm!=null){
			
		    if(request.getParameter("butxoa")!=null)
		    	gh.Xoa(mm);
		    if(request.getParameter("butsua")!=null)
		    	gh.Them(mm, "", "", "", "","", (long)0, Long.parseLong(sl));
		      session.setAttribute("gh", gh);
		}
		if(request.getParameter("trasach")!=null)
			gh=null;
			session.setAttribute("gh", gh);
			  RequestDispatcher rd= request.getRequestDispatcher("HtGioHangController");
			  rd.forward(request, response);
			  }	
		



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
