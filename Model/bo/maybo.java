package bo;

import java.util.ArrayList;

import bean.maybean;
import dao.maydao;
import dao.maydao;

public class maybo {
	maydao mdao = new maydao();
	public ArrayList<maybean> getmay() throws Exception{
		return mdao.getmay();
	}
	public ArrayList<maybean> TimMaloai(String maloai) throws Exception{
	    	ArrayList<maybean> tam= new ArrayList<maybean>();
	    	ArrayList<maybean> ds=getmay();
	    	for(maybean m: ds)
	    		if(m.getMaloai().equals(maloai))
	    			tam.add(m);
	    	return tam;
	    }
	public ArrayList<maybean> Tim(String key) throws Exception{
    	ArrayList<maybean> tam= new ArrayList<maybean>();
    	ArrayList<maybean> ds=getmay();
    	for(maybean m: ds)
    		if(m.getTenmay().toLowerCase().trim().contains(key.toLowerCase().trim()) ||
    				m.getCpu().toLowerCase().trim().contains(key.toLowerCase().trim()))
    			tam.add(m);
    	return tam;
    }
	public Long Dem(String maloai) throws Exception{
    	Long d=(long)0;
    	ArrayList<maybean> ds=getmay();
    	for(maybean m: ds)
    		if(m.getMaloai().equals(maloai))
    			d++;
    	return d;
    }
	public boolean updateMay(String Mamay, String TenMay,String Manhinh,String Ram,String Cpu,String Ocung, Long Gia,Long Soluong, String Maloai,String masachbandau) throws Exception {
		return maydao.updateMay(Mamay, TenMay, Manhinh, Ram,Cpu,Ocung,Gia, Soluong, Maloai,masachbandau);
	}
	public  boolean deleteMay(String Mamay) throws Exception{
		return maydao.deleteMay(Mamay);
	}
	public boolean insertMay(String Mamay, String TenMay,Long soluong,Long gia,String maloai,String Manhinh,String Ram,String Cpu,String Ocung,String anh) throws Exception{
		return maydao.insertMay(Mamay, TenMay, soluong, gia, maloai,Manhinh,Ram,Cpu,Ocung, anh);
	}
	public boolean ktMaMayTonTai(String mamay)throws Exception{
		return maydao.ktMaMayTonTai(mamay);
	}
}
