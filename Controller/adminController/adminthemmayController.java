package adminController;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import bean.adminbean;
import bo.loaibo;
import bo.maybo;


/**
 * Servlet implementation class adminthemmayController
 */
@MultipartConfig
@WebServlet("/adminthemmayController")
public class adminthemmayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminthemmayController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			adminbean admin = (adminbean) session.getAttribute("admin");
			if(admin!=null) {
				String mamay=request.getParameter("mamay");
				String tenmay=request.getParameter("tenmay");
				String manhinh=request.getParameter("manhinh");
				String ram=request.getParameter("ram");
				String cpu=request.getParameter("cpu");
				String ocung=request.getParameter("ocung");
				String gia=request.getParameter("gia");
				String soluong=request.getParameter("soluong");
				String maloai=request.getParameter("maloai");
				
				Part part = request.getPart("image");
				String filename =Path.of(part.getSubmittedFileName()).getFileName().toString();
				String realPath =request.getServletContext().getRealPath("/image_may");
				
				if(!Files.exists(Path.of(realPath)))
				{
					Files.createDirectories(Path.of(realPath));
				}
				String Anh="image_may/"+filename;
						
				
				loaibo lbo= new loaibo();
				maybo mbo= new maybo();
				if(maloai.equals("")||tenmay.equals("")||manhinh.equals("")||ram.equals("")||cpu.equals("")||ocung.equals("")||gia.equals("")||soluong.equals("")||maloai.equals("")||filename.equals(""))
					session.setAttribute("tb", "Vui lòng không để trống");
				else if(mbo.ktMaMayTonTai(mamay)) session.setAttribute("tb", "Mã máy "+mamay+" đã tồn tại");
					else if(!lbo.ktloaitontai(maloai)) session.setAttribute("tb", "Mã loại "+maloai+" không tồn tại");
						else if(mbo.insertMay(mamay, tenmay, Long.parseLong(soluong), Long.parseLong(gia), maloai, Anh, manhinh,ram,cpu,ocung))
							{
								session.setAttribute("tb", "Thêm máy thành công : "+tenmay);
			
								part.write(realPath + "\\" +filename);
								
							}
							else session.setAttribute("tb", "Thêm máy thất bại");
				}
			
			
			response.sendRedirect("qlyMayController");
		} catch (Exception e) {
			System.out.print(e);
		}
	}

}
