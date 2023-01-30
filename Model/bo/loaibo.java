package bo;

import java.util.ArrayList;

import bean.Loaibean;
import dao.loaidao;

public class loaibo {
	loaidao ldao=new loaidao();
	public ArrayList<Loaibean> getloai() throws Exception{
		return ldao.getloai();
	}
	public boolean insertLoai(String maloai,String tenloai)throws Exception {
		return loaidao.insertLoai(maloai, tenloai);
	}
	public boolean ktloaitontai(String maloai) throws Exception{
		return loaidao.ktloaitontai(maloai);
	}
	public boolean updateLoai(String maloai,String tenloai,String maloaibandau) throws Exception{
		return loaidao.updateLoai(maloai, tenloai,maloaibandau);		
	}
	public  boolean deleteLoai(String maloai) throws Exception{
		return loaidao.deleteLoai(maloai);
	}
}
