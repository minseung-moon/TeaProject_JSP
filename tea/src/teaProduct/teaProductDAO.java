package teaProduct;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import tea.DBConn;

public class teaProductDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	
	public teaProductDAO() {
		try {
			con = DBConn.getConnection();
		} catch (Exception e) {
			System.out.println("DB연결 오류");
		}
	}
	
	public ArrayList<teaProductCategoryDTO> selectCategory() {
		ArrayList<teaProductCategoryDTO> dtos = new ArrayList<teaProductCategoryDTO>();
		
		try {
			sql = "select * from productCategory order by asc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				teaProductCategoryDTO dto = new teaProductCategoryDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setCategory(rs.getString("category"));
				dtos.add(dto);
			}
		}catch(SQLException e){
			System.out.println("slect category error");
		}
		
		return dtos;
	}
}
