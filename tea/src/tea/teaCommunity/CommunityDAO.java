package tea.teaCommunity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import tea.DBConn;

public class CommunityDAO {
	private DBConn conn = null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	
	public CommunityDAO() {
		try {
			conn = new DBConn();
			con = conn.conn;
		} catch (Exception e) {
			System.out.println("DB연결 오류");
		}
	}
	
	public ArrayList<CommunityDTO> selectAllCommunity() {
		ArrayList<CommunityDTO> dtos = new ArrayList<CommunityDTO>();
		
		try {
			sql = "select idx, userId, title, content, to_char(regdate, 'yyyy?mm?dd?') as regdate, count from teaCommunity";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "년");
			pstmt.setString(2, "월");
			pstmt.setString(3, "일");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CommunityDTO dto = new CommunityDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setUserId(rs.getString("userId"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setCount(rs.getString("count"));
				
				dtos.add(dto);
			}
		}catch(SQLException e){
			System.out.println("select community error");
		}
	}
}
