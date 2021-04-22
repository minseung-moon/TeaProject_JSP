package tea.teaUser;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import tea.DBConn;

public class UserDAO {
	
	private DBConn conn = null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	
	public UserDAO() {
		try {
			conn = new DBConn();
			con = conn.conn;
		} catch (Exception e) {
			System.out.println("DB���� ����");
		}
	}
	
	public boolean checkId(String userId) {
		boolean check = false;
		
		try {
			sql = "select userId from teaUser where userId = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			check = rs.next();
		} catch (SQLException e) {
			System.out.println("ID��ȸ ����");
		}
		return check;
	}
	
	public boolean registerUser(UserDTO userDTO) {
		boolean check = false;
		try {
			sql = "insert into teaUser(userId,userPw,userName,userPhone,userAddr) values(?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userDTO.userId);
			pstmt.setString(2, userDTO.userPw);
			pstmt.setString(3, userDTO.userName);
			pstmt.setString(4, userDTO.userPhone);
			pstmt.setString(5, userDTO.userAddr);
			check = pstmt.executeUpdate() != 0 ? true : false;
		} catch (SQLException e) {
			System.out.println("ȸ������ ����");
		}
		return check;
	}
	
	public boolean loginUser(String userId, String userPw) {
		boolean check = false;
		try {
			sql = "select userPw from teaUser where userId = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			rs.next();
			check = rs.getString(1).equals(userPw) ? true : false;
		} catch (SQLException e) {
			System.out.println("�α��� ����");
		}
		return check;
	}
	
	public UserDTO getUser(String userId) {
		UserDTO userDTO = null;
		try {
			sql = "select * from teaUser where userId = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			rs.next();
			userDTO = new UserDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
			userDTO.setUserGrade(rs.getString(6));
			userDTO.setUserState(rs.getString(7));
		} catch (SQLException e) {
			System.out.println("����ȹ�� ����");
		}
		return userDTO;
	}
}