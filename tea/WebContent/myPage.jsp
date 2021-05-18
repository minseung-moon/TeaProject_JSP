<%@page import="tea.teaUser.UserDTO"%>
<%@page import="tea.teaUser.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyPage</title>
<link rel="stylesheet" href="./css/myPage.css">
</head>
<%
	UserDTO user = (UserDTO) session.getAttribute("user");
%>
<body>
	<jsp:include page="./header.jsp" />

	<div id="main">
		<div class="container">
			<table>
				<tr>
					<th>성함 : </th>
					<td><%=user.getUserName() %></td>
				</tr>
				<tr>
					<th>아이디 : </th>
					<td><%=user.getUserId() %></td>
				</tr>
				<tr>
					<th>휴대전화 : </th>
					<td><%=user.getUserPhone() %></td>
				</tr>
				<tr>
					<th>주소 : </th>
					<td><%=user.getUserAddr() %></td>
				</tr>
				<tr>
					<th>등급 : </th>
					<td><%=user.getUserGrade() %></td>
				</tr>
				<tr>
					<td colspan="2" class="btn-group">
						<button class="btn btn-flip" onclick="javascript:location.href='updateUser.jsp'">수정하기</button>
						<button class="btn btn-flip" onclick="javascript:confirm('정말 탈퇴하시겠습니까?(데이터 전부 삭제 됩니다!')?location.href='deleteUser.jsp?userId=<%=user.getUserId()%>':alert('취소하셨습니다!')">탈퇴</button>
					</td>
				</tr>
			</table>
		</div>
	</div>

	<jsp:include page="./footer.jsp" />	
</body>
</html>