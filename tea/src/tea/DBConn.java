package tea;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
	// jdbc:mysql://localhost:3306/database_name?serverTimezone=UTC
			private String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
			private String id = "system";
			private String password = "1234";
			public Connection conn;
			
			// ������
			public DBConn() {
				try {
					Class.forName("oracle.jdbc.OracleDriver"); // JDBC
					System.out.println("DB ������ ...");
					conn = DriverManager.getConnection(dbURL,id,password); // DB ����
					System.out.println("������ ���̽� ���� ����");
				} catch (ClassNotFoundException e) {
					System.out.println("JDBC ����̹� ã�� �� ����");
				} catch ( SQLException e) {
					System.out.println("�����ͺ��̽� ���ῡ ����");
				}
			}
			
//			public static void main(String[] args) {
//				new DBConn();
//			}
}
