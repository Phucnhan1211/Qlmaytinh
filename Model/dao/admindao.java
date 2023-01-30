package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.adminbean;

public class admindao {
	public static adminbean ktadmin(String TenDangNhap,String MatKhau) throws Exception{
		adminbean admin=null;
		//b1: ket noi vao csdl
		DungChung dc= new DungChung();
		dc.KetNoi();
		//b2: Lay du lieu ve
		String sql="select * from DangNhap where TenDangNhap = ? and MatKhau=? and Quyen=1";
		
		PreparedStatement cmd=dc.cn.prepareStatement(sql);
		//b3: Truyen tham so vao cau lenh sql
		cmd.setString(1, TenDangNhap);
		cmd.setString(2, MatKhau);
//b4: Thuc hien cau lieu
		ResultSet rs= cmd.executeQuery();
		//kiem tra xem nguoi dung dang nhap dung hay khong
		if(rs.next()){ 
			String tdn=rs.getString("TenDangNhap");
			String mk=rs.getString("MatKhau");
			int Quyen =rs.getInt("Quyen");
			admin = new adminbean(tdn,mk,Quyen);
		}
		
		rs.close();
		dc.cn.close();
		return admin;
	}
}
