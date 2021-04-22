<%@page import="tea.teaUser.UserDAO"%>
<%@page import="tea.teaUser.UserDTO"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");

	UserDAO userDAO = new UserDAO();
	boolean result = userDAO.loginUser(userId, userPw) ? true : false;
	Cookie cookie = null;
	if(result){
		UserDTO user = userDAO.getUser(userId);
		if(user.getUserState().equals("1")){
			session.setAttribute("user", user);
			cookie = new Cookie("loginResult","1");
		}else{
			cookie = new Cookie("loginResult","3");
		}
	}else{
		cookie = new Cookie("loginResult","2");
	}
	response.addCookie(cookie);
	response.sendRedirect("index.jsp");
%>