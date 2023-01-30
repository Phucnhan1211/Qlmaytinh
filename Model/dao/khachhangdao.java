package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import bean.khachhangbean;
import bean.maybean;


public class khachhangdao {
	public static  khachhangbean ktdn(String un, String pass)throws Exception{
		khachhangbean kh=null;
		//b1: ket noi vao csdl
		DungChung dc= new DungChung();
		dc.KetNoi();
		//b2: Lay du lieu ve
		String sql="select * from KhachHang where tendn=? and pass=? ";
		
		PreparedStatement cmd=dc.cn.prepareStatement(sql);
		//b3: Truyen tham so vao cau lenh sql
		cmd.setString(1, un);
		cmd.setString(2, pass);
//b4: Thuc hien cau lieu
		ResultSet rs= cmd.executeQuery();
		//kiem tra xem nguoi dung dang nhap dung hay khong
		if(rs.next()){ 
			String makh=rs.getString("makh");
			String hoten=rs.getString("hoten");
			String diachi=rs.getString("diachi");
			String matkhau=rs.getString("pass");
			String email=rs.getString("email");
			String sodt=rs.getString("sodt");
			kh = new khachhangbean(makh, hoten, diachi, matkhau,email,sodt,un);
		}
		//Nguoc lai: tao ra 01 kh, return kh
		//b6: Dong all 
		rs.close();
		dc.cn.close();
		return kh;
	}
	public static boolean kttaikhoantontai(String un) throws Exception{
		DungChung dc= new DungChung();
		dc.KetNoi();
		//b2: Lay du lieu ve
		String sql="select * from KhachHang where tendn=? ";
		
		PreparedStatement cmd=dc.cn.prepareStatement(sql);
		//b3: Truyen tham so vao cau lenh sql
		cmd.setString(1, un);
		ResultSet rs= cmd.executeQuery();
		if(rs.next()) {
			rs.close();
			dc.cn.close();
			return false;
		}
		else 
		{
			rs.close();
			dc.cn.close();
			return true;
		}
	}
	public static boolean taotaikhoan(String un,String pass,String name,String address, String phonenumber,String email) throws Exception{
		//b1: ket noi vao csdl
		DungChung dc= new DungChung();
		dc.KetNoi();
		//b2: Lay du lieu ve
		String sql="INSERT INTO KhachHang (tendn,pass,hoten,diachi,sodt,email )\r\n"
				+ "VALUES (?,?,?,?,?,?);";
		
		PreparedStatement cmd=dc.cn.prepareStatement(sql);
		//b3: Truyen tham so vao cau lenh sql
		cmd.setString(1, un);
		cmd.setString(2, pass);
		cmd.setString(3, name);
		cmd.setString(4, address);
		cmd.setString(5, phonenumber);
		cmd.setString(6, email);
		int i= cmd.executeUpdate();
		if(i>0) {
			
			dc.cn.close();
			return true;
		}
			
		else {
			dc.cn.close();
			return false;
		}
		
	}
	public static ArrayList<khachhangbean> getKH() throws Exception{
		ArrayList<khachhangbean> kh=new ArrayList<khachhangbean>();
		DungChung dc= new DungChung();
		dc.KetNoi();
		String sql="select * from KhachHang";
		PreparedStatement cmd=dc.cn.prepareStatement(sql);
		ResultSet rs= cmd.executeQuery();
		while (rs.next()) {
			int makh=rs.getInt("makh");			
			String hoten=rs.getNString("hoten");
			String diachi=rs.getNString("diachi");
			String sodt=rs.getNString("sodt");
			String matkhau=rs.getNString("pass");
			String email=rs.getNString("email");
			String tendn=rs.getNString("tendn");
			kh.add(new khachhangbean(String.valueOf(makh),hoten,diachi,matkhau,email,sodt,tendn));
		}
		dc.cn.close();
		return kh;
	}
	public static boolean deleteKH(String makh) throws Exception{
		
		DungChung dc= new DungChung();
		dc.KetNoi();
		String sql ="DELETE FROM KhachHang where makh=?";
		PreparedStatement cmd=dc.cn.prepareStatement(sql);
		cmd.setString(1, makh);
		int rs= cmd.executeUpdate();
		if(rs>0) {
			
			dc.cn.close();
			return true;
		}
			
		else {
			dc.cn.close();
			return false;
		}
	}

}