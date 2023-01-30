package bo;

import java.util.ArrayList;

import bean.giohangbean;
import bean.khachhangbean;
import bo.ChiTietHoaDonbo;
import bo.hoadonbo;

public class giohangbo {
	public ArrayList<giohangbean> ds= new ArrayList<giohangbean>();
    public void Them(String mamay, String tenmay, String manhinh, String ram, String cpu, String ocung,Long gia, Long slmua) {
    	for(giohangbean g:ds) {
    		if(g.getMamay().equals(mamay)) {
    			g.setSlmua(g.getSlmua()+slmua);
    			return;
    		}
    	}
    	ds.add(new giohangbean(mamay, tenmay, manhinh, ram, cpu,ocung, gia, slmua));
    }
    public void Xoa(String mamay) {
    	for(giohangbean g:ds) {
    		if(g.getMamay().equals(mamay)) {
    			ds.remove(g);
    			return;
    		}
    	}
    }
    public void Sua(String mamay,Long slmua) {
        	for(giohangbean g:ds) {
        		if(g.getMamay().equals(mamay)&&slmua>0) {
        			g.setSlmua(slmua);
        			return;
        		}
        }
    }
    public void XoaToanBo() {
    	for(giohangbean g:ds) {
    			ds.remove(g);	
    	}
    	return;
    }
    
    public Long Tongtien() {
    	long s=0;
    	for(giohangbean g:ds) 
    		s=s+g.getThanhtien();
    	return s;
    }
    public boolean muahang(khachhangbean kh) throws Exception{
    	hoadonbo hdbo=new hoadonbo();
		//java.time.LocalDate.now() ham lay time hien tai
		String NgayMua= java.time.LocalDate.now().toString();
		hdbo.insertHoaDon(kh.getMakh(), "0", NgayMua);
		for(giohangbean g:ds) {
			
			
			String maHoaDon=hdbo.getMaHoaDon();
			
			ChiTietHoaDonbo cthdbo=new ChiTietHoaDonbo();
			cthdbo.insertChiTietHoaDon(g.getMamay(), g.getSlmua(),maHoaDon,"0");
			
		}
		return true;
    }
    public void SetSL(String mamay,Long slmua) {
        //Kiem tra xem sach nay da co chua, neu co thi tang soluong
        for(giohangbean g:ds)
                  if(g.getMamay().equals(mamay)) {
                          g.setSlmua(slmua);
                          g.setThanhtien(g.getSlmua()*g.getGia());
                          return;
                  }
    }

	 public int dem() {
		return ds.size();
	}
}
