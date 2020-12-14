<%@page import="bean.MemberDAO"%><%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%String user_id = request.getParameter("user_id");//user_id 전달받음
	String user_password = request.getParameter("user_password");//user_password 전달받음
	MemberDAO dao = new MemberDAO();//dao 메서드 사용
	int result = dao.read(user_id, user_password);//검색결과 저장    
	if(result == 1){//검색있음
		session.setAttribute("user_id", user_id);//세션 저장
		response.sendRedirect("../index.jsp");//메인페이지로
		}else{//검색없음%>
	<script>
    	alert("아이디와 비번을 다시 확인해 주세요."); history.go(-1);
    	</script>
    <%}%>