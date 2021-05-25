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
				<li><a href="#">백차</a></li>
				<li><a href="#">녹차</a></li>
				<li><a href="#">우롱차</a></li>
				<li><a href="#">홍차</a></li>
				<li><a href="#">흑차</a></li>
			</ul>
			
			<div class="product-group">
				<div class="product-card">
					<img alt="녹차" src="./media/product/하동녹차.jpg">
					<span>하동녹차</span>
					<span>13000원</span>
				</div>
				
				<div class="product-card">
					<img alt="녹차" src="./media/product/다란홍차아쌈.jpg">
					<span>다란홍차아쌈</span>
					<span>13000원</span>
				</div>
			</div>
			
			<div class="btn-group">
				<button type="button" class="btn" onclick="javascript:location.href='writeProduct.jsp'">글쓰기</button>
			</div>
		</div>
	</div>
	
	<jsp:include page="./footer.jsp" />
</body>
</html>