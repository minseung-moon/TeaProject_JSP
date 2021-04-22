<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="./media/logo&favicon/favicon-32x32.png" type="image/x-icon">
<title>House TEA</title>
<link rel="stylesheet" href="./css/index.css">
</head>
<body>
<%
	Cookie[] cookies = request.getCookies();
	for(Cookie cookie : cookies) {
		if(cookie.getName().equals("loginResult")){
			if(cookie.getValue().equals("1")){
				%>
					<script type="text/javascript">
						alert("로그인 성공 하셨습니다.");
					</script>
				<%
			}else if(cookie.getValue().equals("2")){
				%>
				<script type="text/javascript">
					alert("없는 계정 입니다!");
				</script>
			<%
			}else {
				%>
				<script type="text/javascript">
					alert("비활성화 계정 입니다!");
				</script>
			<%
			}
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
	}
%>
	<jsp:include page="./header.jsp" />

	<div id="main">
		<section class="banner">
			<video src="./media/teaframVedio.mp4" autoplay loop muted></video>
			<div class="cover"></div>
			<div class="inner">
				<p>House TEA</p>
				<p>Enjoy Together</p>
			</div>
		</section>
		<section class="about-tea">
			<div class="inner">
				<a href="#">
					<div class="card">
						<img src="./media/greentea.jpg" alt="greentea">
						<p>Green Tea(녹차)</p>
					</div>
				</a> <a href="#">
					<div class="card">
						<img src="./media/bluetea.jpg" alt="bluetea">
						<p>Blue Tea(우롱차)</p>
					</div>
				</a> <a href="#">
					<div class="card">
						<img src="./media/blacktea.jpg" alt="blacktea">
						<p>Black Tea(홍차)</p>
					</div>
				</a> <a href="#">
					<div class="card">
						<img src="./media/darktea.jpg" alt="darktea">
						<p>Dark Tea(보이차)</p>
					</div>
				</a>
			</div>
		</section>
		<section class="for-the-table">
			<div class="inner">
				<a href="#"><span class="mark">TEA CUP</span><img
					src="./media/teacup.png" alt="teacup"></a> <a href="#"><span
					class="mark">TEA POT</span><img src="./media/teapot.png"
					alt="teapot"></a> <a href="#"><span class="mark">COOKIE</span><img
					src="./media/cookie.png" alt="cookie"></a>
			</div>
		</section>
		<section class="brand-shop">
			<div class="brand brand01">
				<div class="content">
					<h2>TWG</h2>
					<a class="brandBtn" href="http://www.twgkorea.com/web/home.php">바로
						가기</a>
				</div>
			</div>
			<div class="brand brand02">
				<div class="content">
					<h2>Fortnum&Mason</h2>
					<a class="brandBtn" href="https://www.fortnumandmason.com/">바로
						가기</a>
				</div>
			</div>
			<div class="brand brand03">
				<div class="content">
					<h2>MariageFreres</h2>
					<a class="brandBtn"
						href="https://www.mariagefreres.com/FR/accueil.html">바로 가기</a>
				</div>
			</div>
		</section>
	</div>

	<jsp:include page="./footer.jsp" />
</body>
</html>