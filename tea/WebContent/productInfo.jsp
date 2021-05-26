<%@page import="teaProduct.teaProductDTO"%>
<%@page import="teaProduct.teaProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Product</title>
<style>
	#main {
		min-height: 100vh;
		display: flex;
		justify-content : center;
		align-items : center;
	}
	#main table.product {
            border-collapse: collapse;
            margin : 0 auto;
        }
    #main table.product th,
    #main table.product td {
            width: 50px;
            height: 50px;
        }
    #main table.product,
    #main table.product th,
    #main table.product td {
            border: 1px solid #000;
        }
    #main table.product tr td img {
        width: 300px;
     }
</style>
</head>
<body>
	<jsp:include page="./header.jsp" />
	<%--
		String idx = request.getParameter("idx");
		teaProductDAO dao = new teaProductDAO();
		teaProductDTO dto = dao.selectProduct(idx);
	--%>
	<%
	teaProductDAO dao = new teaProductDAO();
	teaProductDTO dto = dao.selectProduct("1");
	%>
	<div id="main">
		<div class="inner">
			<table class="product">
				<tr>
					<td rowspan="5">
						<img alt="<%=dto.getOriginalFilename() %>" src="./media/product/<%=dto.getSaveFilename()%>">
					</td>
					<th> 제품명 </th>
					<td><%=dto.getName() %></td>
				</tr>
				<tr>
					
					<th> 가격 </th>
					<td><%=dto.getPrice() %>원</td>
				</tr>
				<tr>
					
					<th> 카테고리 </th>
					<td><%=dto.getCategory() %></td>
				</tr>
				<tr>
					
					<th> 재고 수 </th>
					<td><%=dto.getStock() %></td>
				</tr>
				<tr>
					
					<td colspan="2">
						<button type="button" class="btn" onclick="javascript:history.back()'">주문하기</button>
						<button type="button" class="btn" onclick="javascript:history.back()'">뒤로가기</button>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<%=dto.getDescription() %>	
					</td>
				</tr>
			</table>
			<div class="btn-group">
	<button type="button" class="btn" onclick="javascript:history.back()'">주문하기</button>
						<button type="button" class="btn" onclick="javascript:history.back()'">뒤로가기</button>
	</div>
		</div>
	</div>
	
	
	
	<jsp:include page="./footer.jsp" />
</body>
</html>