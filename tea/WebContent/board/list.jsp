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
		border : 1px solid purple;
	}
	th {
		background-color: purple;
		color : white;
	}
</style>
<%
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

		sql = "select * from board order by idx desc";
		pstmt = con.prepareStatement(sql);

		rs = pstmt.executeQuery();
%>
</head>
<body>
	<h1>게시글</h1>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><a href="content.jsp?idx=<%=rs.getString(1)%>"><%=rs.getString(2)%></a></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
		</tr>
		<%
			}
				con.close();
			} catch (Exception e) {
				out.println("Oracle 데이터베이스 db 접속 실패<hr>");
				out.println(e.getMessage());
				e.printStackTrace();
			}
		%>
	</table>
	<a href="write.jsp">글쓰기</a>
</body>
</html>