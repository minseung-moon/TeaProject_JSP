<%@page import="java.util.regex.Pattern"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	table, td, th {
		border : 1px solid black;
	}
</style>
<%
	request.setCharacterEncoding("UTF-8");
	String idx = request.getParameter("idx");
	
	Connection con = null;
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		String driverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Class.forName(driverName);
		con = DriverManager.getConnection(url, "board", "1234");
		out.println("Oracle 데이터베이스 db에 성공적으로 접속했습니다");

		sql = "select * from board where idx = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, idx);
		rs = pstmt.executeQuery();
		rs.next();
%>
</head>
<body>
	<h1>게시글</h1>
	<table>
		<tr>
			<th>번호</th>
			<td><%=rs.getString("idx") %></td>
			<th>작성자</th>
			<td><%=rs.getString("writer") %></td>
			<th>날짜</th>
			<td><%=rs.getString("regdate") %></td>
			<th>조회수</th>
			<td><%=rs.getString("count") %></td>
		</tr>
		<tr>
			<th colspan="2">제목</th>
			<td colspan="6"><%=rs.getString("title") %></td>
		</tr>
		<tr>
			<th colspan="2">내용</th>
			<td colspan="6"><%=rs.getString("content") %></td>
		</tr>
	</table>
	<a href="delete.jsp?idx=<%=rs.getString("idx")%>">게시글 삭제</a>
	<a href="list.jsp">목록으로</a>
	<%		
				con.close();
			} catch (Exception e) {
				out.println("Oracle 데이터베이스 db 접속 실패<hr>");
				out.println(e.getMessage());
				e.printStackTrace();
			}
	%>
</body>
</html>