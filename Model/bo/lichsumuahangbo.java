package bo;

import java.util.ArrayList;

import bean.giohangbean;
import bean.lichsumuahangbean;
import dao.lichsumuahangdao;

public class lichsumuahangbo {
	ArrayList<lichsumuahangbean> lsmh= new ArrayList<lichsumuahangbean>();
	public ArrayList<lichsumuahangbean> getlichsumuahang(String makh)throws Exception{
		return lichsumuahangdao.getlichsumuahang(makh);
	}
	
	public void sortName(){
		for (int i=1;i<lsmh.size();i++) {
			if(lsmh.get(i).getMaMay().equals(lsmh.get(i-1).getMaMay())) {
				Long sl=lsmh.get(i).getSoLuongMua()+lsmh.get(i-1).getSoLuongMua();
				lsmh.get(i-1).setSoLuongMua(sl);
				lsmh.remove(i);
				i--;
			}
			
		}
		
		
	}
	public Long Tongtien() {
    	long s=0;
    	for(lichsumuahangbean l:lsmh) 
    		s=s+l.getTongGia();
    	return s;
    }
}

