package adminController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.loaibo;

/**
 * Servlet implementation class sualoaiController
 */
@WebServlet("/sualoaiController")
public class sualoaiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sualoaiController() {
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
		     String maloaithem =request.getParameter("maloaithem");
		     String tenloaithem =request.getParameter("tenloaithem");
		     loaibo lbo = new loaibo();
		     if(request.getParameter("butthem")!=null)
			     if(!lbo.ktloaitontai(maloaithem))
			     {	
			    	 if(maloaithem==""&&tenloaithem=="") session.setAttribute("tb", "Vui lòng không được để trống");
			    	 else if(lbo.insertLoai(maloaithem, tenloaithem))
						 session.setAttribute("tb", "Thêm loại thành công: "+tenloaithem+", "+maloaithem);
				     else session.setAttribute("tb", "Thêm loại thất bại");
			     }
			     else session.setAttribute("tb", "Mã loại đã tồn tại");
		     String maloai =request.getParameter("maloai");
		     String maloaibandau =request.getParameter("maloaibandau");
		     String tenloai =request.getParameter("tenloai");
		     if(request.getParameter("butsua")!=null)
		    	if(maloai==""&&tenloai=="") session.setAttribute("tb", "Vui lòng không được để trống");
		    	else if(lbo.updateLoai(maloai, tenloai,maloaibandau))
		    			session.setAttribute("tb", "Sửa loại thành công: "+tenloai+", "+maloai);
		    		 	else session.setAttribute("tb", "Sửa loại thất bại");
		    	
		     if(request.getParameter("butxoa")!=null) {
		    	 if(lbo.deleteLoai(maloai))
		    		 session.setAttribute("tb", "Xóa loại thành công: "+tenloai+", "+ maloai);
		    	 else session.setAttribute("tb", "Xóa loại thất bại");
		     }
		     response.sendRedirect("adminqlyloaiController");
			 
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
