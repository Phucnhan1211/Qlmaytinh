package bo;

import java.util.ArrayList;

import bean.viewgdbean;
import dao.viewgddao;

public class viewgdbo {
	public  ArrayList<viewgdbean> getdsHD() throws Exception {
		return viewgddao.getdsGD();
	}
}
