<%@page import="teaProduct.teaProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="teaProduct.teaProductDAO"%>
<%@page import="teaProduct.teaProductCategoryDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Community</title>
<style>
	#main {
		min-height: 100vh;
		display: flex;
		justify-content : center;
		align-items : center;
	}
	#main .inner {
		display: flex;
		flex-direction : column;
		justify-content : center;
		align-items : center;
	}
	#main .search {
		width : 100%;
		text-align: right;
	}
	#main .search .btn {
		font-size: 1rem;
		padding : 0;
	}
	#main .category-group {
		width : 100%;
		display: flex;
		justify-content : space-around;
		align-items : center;
		padding : 10px 0;
	}
	#main .category-group a {
		display : inline-block;
		padding : 10px 0;
	}
	#main .category-group a:hover {
		text-decoration: underline;
	}
	#main .product-group {
		display: flex;
		justify-content : center;
		align-items : center;
	}
	#main .product-group .product-card {
		width: 150px;
		padding : 5px 0;
		overflow: hidden;
		cursor: pointer;
		font-size: 1.3rem;
		display: flex;
		flex-direction : column;
		justify-content : center;
		align-items : center;
	}
	#main .product-group .product-card img {
		width: 100%;
	}
	#main .btn-group {
		width : 100%;
		text-align: right;
		margin : 15px 0;
	}
</style>
</head>
<body>
	<jsp:include page="./header.jsp" />
	
	<div id="main">
		<div class="inner">
			<form action="community.jsp" method="get" class="search">
				<input type="text" name="search" placeholder="검색값을 입력하세요.">
				<input type="submit" value="검색" class="btn">
			</form>
			
			<ul class="category-group">
				<%
					teaProductDAO dao = new teaProductDAO();
					ArrayList<teaProductCategoryDTO> categories = dao.selectCategory();
					for(teaProductCategoryDTO dto : categories) {
				%>
				<li><a href="product.jsp?category=<%=dto.getIdx()%>"><%=dto.getCategory() %></a></li>
				<%
					}
				%>
			</ul>
			
			<div class="product-group">
				<%
					ArrayList<teaProductDTO> products = dao.selectAllProduct();
					for(teaProductDTO dto : products) {
				%>
				<div class="product-card">
					<img alt="<%=dto.getOriginalFilename() %>" src="./media/product/<%=dto.getSaveFilename()%>">
					<span><%=dto.getName() %></span>
					<span><%=dto.getPrice() %>원</span>
				</div>
				<%
					}
				%>
			</div>
			
			<div class="btn-group">
				<button type="button" class="btn" onclick="javascript:location.href='writeProduct.jsp'">글쓰기</button>
			</div>
		</div>
	</div>
	
	<jsp:include page="./footer.jsp" />
</body>
</html>