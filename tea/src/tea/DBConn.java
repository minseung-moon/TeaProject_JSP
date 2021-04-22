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
			
			// 생성자
			public DBConn() {
				try {
					Class.forName("oracle.jdbc.OracleDriver"); // JDBC
					System.out.println("DB 연결중 ...");
					conn = DriverManager.getConnection(dbURL,id,password); // DB 연결
					System.out.println("데이터 베이스 연결 성공");
				} catch (ClassNotFoundException e) {
					System.out.println("JDBC 드라이버 찾을 수 없다");
				} catch ( SQLException e) {
					System.out.println("데이터베이스 연결에 실패");
				}
			}
			
//			public static void main(String[] args) {
//				new DBConn();
//			}
}
