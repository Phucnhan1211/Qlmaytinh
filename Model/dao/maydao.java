package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.maybean;

public class maydao {
	public ArrayList<maybean> getmay() throws Exception{
		 ArrayList<maybean> ds= new ArrayList<maybean>();
		 	//b1: ket noi vao csdl
			DungChung dc= new DungChung();
			dc.KetNoi();
			//b2: Lay du lieu ve
			String sql="select * from may";
			PreparedStatement cmd=dc.cn.prepareStatement(sql);
			//b3: Truyen tham so vao cau lenh sql ->bo
			//b4: Thuc hien cau lieu
			ResultSet rs= cmd.executeQuery();
			//b5: Duyet qua tap ket qua: rs
			while(rs.next()) {
				   String mamay=rs.getString("mamay");
				   String tenmay=rs.getString("tenmay");
				   String manhinh=rs.getString("manhinh");
				   String ram=rs.getString("ram");
				   String cpu=rs.getString("cpu");
				   String ocung=rs.getString("ocung");
				   Long gia=rs.getLong("gia");
				   Long soluong=rs.getLong("soluong");
				   String anh=rs.getString("anh");
				   String maloai=rs.getString("maloai");
				   ds.add(new maybean(mamay,  tenmay,  manhinh,  ram,  cpu,  ocung,  gia,
							 soluong,  anh,  maloai));
			}
	//b6: Dong all 
			rs.close();
			dc.cn.close();
		   return ds;
}
	public static int xoaMay(String mamay) {
		DungChung dc = new DungChung();
		try {
			dc.KetNoi();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "delete from may where mamay = ?";
		System.out.println(sql + mamay);
		System.out.println(mamay);
		try {
			PreparedStatement cmd = dc.cn.prepareStatement(sql);
			cmd.setString(1, mamay);
			return cmd.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;

	}
	public static boolean updateMay(String Mamay, String TenMay,String Manhinh,String Ram,String Cpu,String Ocung, Long Gia,Long Soluong, String Maloai,String masachbandau) throws Exception {
		DungChung dc= new DungChung();
		dc.KetNoi();
	    
	    String sql="Update may\r\n"
	    		+ "set  mamay=?,tenmay=?, soluong=?,gia=?,maloai=?,manhinh=?,ram=?,cpu=?,ocung=?\r\n"
	    		+ "where mamay=?";
		PreparedStatement cmd=dc.cn.prepareStatement(sql);
		cmd.setString(1, Mamay);
		cmd.setString(2, TenMay);
		cmd.setString(3, Soluong.toString());
		cmd.setString(4, Gia.toString());
		cmd.setString(5, Maloai);
		cmd.setString(6, Manhinh);
		cmd.setString(7, Ram);
		cmd.setString(8, Cpu);
		cmd.setString(9, Ocung);
		cmd.setString(10, masachbandau);
		
	    int rs = cmd.executeUpdate();
	    if(rs>0) {
	    	dc.cn.close();
			return true;
		}
	    else 
	    {
	    	dc.cn.close();
	    	return false;
	    }
	    
	}
	public static boolean deleteMay(String Mamay) throws Exception{
		DungChung dc= new DungChung();
		dc.KetNoi();
	    
	    String sql="DELETE FROM may WHERE mamay=?\r\n";
		PreparedStatement cmd=dc.cn.prepareStatement(sql);
		cmd.setString(1, Mamay);
	
		int rs = cmd.executeUpdate();
	    if(rs>0) {
	    	dc.cn.close();
			return true;
		}
	    else {
	    	dc.cn.close();
	    	return false;
	    }
	}
	public static boolean insertMay(String Mamay, String TenMay,Long soluong,Long gia,String maloai,String anh,String Manhinh,String Ram,String Cpu,String Ocung) throws Exception{
		DungChung dc= new DungChung();
		dc.KetNoi();
	    
	    String sql="INSERT INTO may(mamay,tenmay,soluong,gia,maloai,anh,manhinh,ram,cpu,ocung,NgayNhap)\r\n"
	    		+ "values(?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement cmd=dc.cn.prepareStatement(sql);
		cmd.setString(1, Mamay);
		cmd.setString(2, TenMay);
		cmd.setString(3, soluong.toString());
		cmd.setString(4, gia.toString());
		cmd.setString(5, maloai);
		cmd.setString(6, anh);
		cmd.setString(7, Manhinh);
		cmd.setString(8, Ram);
		cmd.setString(9, Cpu);
		cmd.setString(10, Ocung);
		cmd.setString(11, java.time.LocalDate.now().toString());
		
		int rs = cmd.executeUpdate();
	    if(rs>0) {
	    	dc.cn.close();
			return true;
		}
	    else {
	    	dc.cn.close();
	    	return false;
	    }
	
	}
	public static boolean ktMaMayTonTai(String mamay)throws Exception{
		DungChung dc= new DungChung();
		dc.KetNoi();
	    
	    String sql="select * from may where mamay=?";
	    PreparedStatement cmd=dc.cn.prepareStatement(sql);
		cmd.setString(1, mamay);
		ResultSet rs = cmd.executeQuery();
	    if(rs.next()) {
	    	dc.cn.close();
			return true;
		}
	    else {
	    	dc.cn.close();
	    	return false;
	    }
	}
	
}
