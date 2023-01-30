package bo;
import java.util.ArrayList;
import bean.khachhangbean;
import dao.khachhangdao;

public class khachhangbo {
	khachhangdao khdao=new khachhangdao();
	
	public khachhangbean ktdn(String makh, String matkhau)throws Exception {
		return khachhangdao.ktdn(makh,matkhau);		
	}
	public boolean kttaikhoantontai(String un) throws Exception{
		return khachhangdao.kttaikhoantontai(un);
	}
	public boolean taotaikhoan(String un,String pass,String name,String address, String phonenumber,String email) throws Exception{
		return  khachhangdao.taotaikhoan( un,pass,name, address, phonenumber,email);
	}
	public ArrayList<khachhangbean> getKH() throws Exception{
		return khachhangdao.getKH();
	}
	public boolean deleteKH(String makh) throws Exception{
		return khachhangdao.deleteKH(makh);
	}
}