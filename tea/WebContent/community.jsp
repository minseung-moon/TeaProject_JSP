<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>About TEA</title>
<style>
	#main {
		min-height: 100vh;
		display: flex;
		justify-content : center;
		align-items : center;
	}
	#main table {
		width : 100%;
		margin : 0 auto;
		text-align: center;
	}
	#main table tr {
		display: flex;
		justify-content : space-between;
		align-items : center;
	}
	#main table th {
		
		font-weight: 700;
	}
	#main table th, #main table td {
		overflow: hidden;
		text-overflow: ellipsis;
  		white-space: nowrap;
  		width: 10vw;
  		padding : 5px;
	}
	#main table th:first-child, #main table th:last-child,
	#main table td:first-child, #main table td:last-child{
		width: 5.5vw;
	}
	#main table th:nth-child(2), #main table th:nth-child(3),
	#main table td:nth-child(2), #main table td:nth-child(3){
		width: 15vw;
	}
	#main table td a:hover {
		text-decoration: underline;
	}
	#main .btn-group {
		text-align: right;
		margin : 5px 0;
	}
	#main .btn {
		font-size:1rem;
		background-color: #79ff2b;
		color : #fff;
		outline: none;
		border: 1px solid #418718;
		border-radius : 3px;
		padding: 2px 5px;
		cursor: pointer;
	}
	#main .btn:hover {
		border : 1px solid #79ff2b;
		background-color: #418718;
	}
</style>
</head>
<body>
	<jsp:include page="./header.jsp" />
	
	<div id="main">
		<div class="inner">
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>123</td>
						<td><a href="#">녹차 맛있네요.</a></td>
						<td>녹차 맛있네요.녹차 맛있네요.녹차 맛있네요.녹차 맛있네요.녹차 맛있네요.녹차 맛있네요.녹차 맛있네요.녹차 맛있네요.녹차 맛있네요.녹차 맛있네요.녹차 맛있네요.녹차 맛있네요.녹차 맛있네요.녹차 맛있네요.녹차 맛있네요.녹차 맛있네요.녹차 맛있네요.녹차 맛있네요.녹차 맛있네요.녹차 맛있네요.녹차 맛있네요.녹차 맛있네요.녹차 맛있네요.녹차 맛있네요.녹차 맛있네요.녹차 맛있네요.녹차 맛있네요.</td>
						<td>ansalstmd0</td>
						<td>2021-05-21</td>
						<td>1000</td>
					</tr>
				</tbody>
			</table>
			<div class="btn-group">
				<button class="btn">글쓰기</button>
			</div>
		</div>
	</div>
	
	<jsp:include page="./footer.jsp" />
</body>
</html>