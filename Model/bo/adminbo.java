package bo;

import bean.adminbean;
import dao.admindao;

public class adminbo {
	public  adminbean ktadmin(String TenDangNhap,String MatKhau) throws Exception{
		return admindao.ktadmin(TenDangNhap, MatKhau);
	}
}
