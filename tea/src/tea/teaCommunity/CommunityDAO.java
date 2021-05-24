package tea.teaCommunity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import tea.DBConn;

public class CommunityDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	
	public CommunityDAO() {
		try {
			con = DBConn.getConnection();
		} catch (Exception e) {
			System.out.println("DB연결 오류");
		}
	}
	
	public ArrayList<CommunityDTO> selectAllCommunity() {
		ArrayList<CommunityDTO> dtos = new ArrayList<CommunityDTO>();
		
		try {
			sql = "select idx, userId, title, content, to_char(regdate, 'yyyy\"년\"mm\"월\"dd\"일\"') as regdate, count from teaCommunity";
			pstmt = con.prepareStatement(sql);
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
		return dtos;
	}
	
	public boolean insertCommunity(CommunityDTO dto) {
		boolean check = false;
		
		try {
			sql = "insert into teaCommunity(idx, userId, title, content) values(teaCommunitySEQ.nextval, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			
			check = pstmt.executeUpdate() == 1 ? true : false;
		}catch(SQLException e){
			System.out.println("insert community error");
		}
		
		return check;
	}
	
	public CommunityDTO selectCommunity(String idx) {
		CommunityDTO dto = new CommunityDTO();
		
		try {
			
			if(updateCount(idx)) System.out.println("success update count");
			else System.out.println("fail update count");
			
			sql = "select idx, userId, title, content, to_char(regdate, 'yyyy\"년\"mm\"월\"dd\"일\"') as regdate, count from teaCommunity where idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, idx);
			rs = pstmt.executeQuery();
			rs.next();
			
			System.out.println(3);
			dto.setIdx(rs.getString("idx"));
			dto.setUserId(rs.getString("userId"));
			dto.setTitle(rs.getString("title"));
			dto.setContent(rs.getString("content"));
			dto.setRegdate(rs.getString("regdate"));
			dto.setCount(rs.getString("count"));
		}catch(SQLException e){
			System.out.println("select community error");
		}
		return dto;
		
	}
	
	public boolean updateCount(String idx) {
		boolean check = false;
		try {
			sql = "UPDATE teaCommunity SET count = count+1 WHERE idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, idx);
			
			check = pstmt.executeUpdate() == 1 ? true : false;
			
		}catch(SQLException e){
			System.out.println("select community error");
		}
		return check;
	}
	
	public boolean deleteCommunity(String idx) {
		boolean check = false;
		try {
			sql = "delete from teaCommunity WHERE idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, idx);
			
			check = pstmt.executeUpdate() == 1 ? true : false;
			
		}catch(SQLException e){
			System.out.println("delete community error");
		}
		return check;
	}
	
	public boolean updateCommunity(CommunityDTO dto) {
		boolean check = false;
		try {
			sql = "UPDATE teaCommunity SET title = ?, content = ? WHERE idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getIdx());
			
			check = pstmt.executeUpdate() == 1 ? true : false;
			
		}catch(SQLException e){
			System.out.println("update community error");
		}
		return check;
	}
}
