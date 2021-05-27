<%@page import="teaProduct.teaProductDAO"%>
<%@page import="teaProduct.teaProductDTO"%>
<%@page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@page import="tea.teaCommunity.CommunityDAO"%>
<%@page import="tea.teaCommunity.CommunityDTO"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String idx = request.getParameter("idx");
	String name = request.getParameter("name");
	String price = request.getParameter("price");
	String category = request.getParameter("category");
	String stock = request.getParameter("stock");
	String description = request.getParameter("description");
	
	teaProductDTO dto = new teaProductDTO();
	dto.setName(name);
	dto.setPrice(price);
	dto.setCategory(category);
	dto.setStock(stock);
	dto.setDescription(description);
	dto.setIdx(idx);
	
	teaProductDAO dao = new teaProductDAO();
	
	if(dao.updateProduct(dto)) response.sendRedirect("productInfo.jsp?idx="+dto.getIdx());
	else response.sendRedirect(request.getHeader("referer"));
%>