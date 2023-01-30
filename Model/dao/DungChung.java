package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DungChung {
	public Connection cn;
	public void KetNoi() throws Exception{
    	//B1: Xac dinh HQTCSDL
    	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    	System.out.println("Da xac dinh HQTCSDL");
    	//B2: Ket noi vao csdl
    	String url="jdbc:sqlserver://LAPCN-NHANTP\\SQLEXPRESS01:1433;databaseName=QlMaytinh;user=sa; password=123";
    	cn=DriverManager.getConnection(url);
    	System.out.println("Da ket noi");
}
}
