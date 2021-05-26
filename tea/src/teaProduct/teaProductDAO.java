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
			sql = "select * from productCategory order by idx asc";
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
	
	public boolean insertProduct(teaProductDTO dto) {
		boolean check = false;
		
		try {
			sql = "insert into product values(productSEQ.nextval, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPrice());
			pstmt.setString(3, dto.getCategory());
			pstmt.setString(4, dto.getStock());
			pstmt.setString(5, dto.getDescription());
			pstmt.setString(6, dto.getSaveFilename());
			pstmt.setString(7, dto.getOriginalFilename());
			
			check = pstmt.executeUpdate() == 1 ? true : false;
		}catch(SQLException e){
			System.out.println("insert product error");
		}
		
		return check;
	}
	
	public ArrayList<teaProductDTO> selectAllProduct() {
		ArrayList<teaProductDTO> dtos = new ArrayList<teaProductDTO>();
		
		try {
			sql = "select p.idx, p.name, p.price, c.category, p.stock, p.description, p.saveFilename, p.originalFilename from product p inner join productCategory c on p.category = c.idx order by p.idx asc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				teaProductDTO dto = new teaProductDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getString("price"));
				dto.setCategory(rs.getString("category"));
				dto.setStock(rs.getString("stock"));
				dto.setDescription(rs.getString("description"));
				dto.setSaveFilename(rs.getString("saveFilename"));
				dto.setOriginalFilename(rs.getString("originalFilename"));
				dtos.add(dto);
			}
		}catch(SQLException e){
			System.out.println("slect product error");
		}
		
		return dtos;
	}
	
	public teaProductDTO selectProduct(String idx) {
		teaProductDTO dto = new teaProductDTO();
		
		try {
			sql = "select p.idx, p.name, p.price, c.category, p.stock, p.description, p.saveFilename, p.originalFilename from product p inner join productCategory c on p.category = c.idx where p.idx = ? order by p.idx asc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, idx);
			rs = pstmt.executeQuery();
			
			rs.next();
			dto.setIdx(rs.getString("idx"));
			dto.setName(rs.getString("name"));
			dto.setPrice(rs.getString("price"));
			dto.setCategory(rs.getString("category"));
			dto.setStock(rs.getString("stock"));
			dto.setDescription(rs.getString("description"));
			dto.setSaveFilename(rs.getString("saveFilename"));
			dto.setOriginalFilename(rs.getString("originalFilename"));
		}catch(SQLException e){
			System.out.println("slect product error");
		}
		
		return dto;
	}
}
