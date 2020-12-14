<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="bean.CartVO"%>
<%@page import="bean.CartDAO"%>
<%@page import="bean.ReviewDAO"%>
<%@page import="bean.ProductDAO"%>
<%@page import="bean.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%		
	//오늘날짜획득
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String datestr = sdf.format(cal.getTime());

   	// 1. VO를 만들어서(저장)
   	ReviewVO vo = new ReviewVO();
	ProductDAO pdao = new ProductDAO();

   	// 2. 전달되는 값 받은 다음, VO에 넣어야 한다.
   	String user_id = request.getParameter("user_id");
   	int product_id = Integer.parseInt(request.getParameter("product_id"));
   	String review_content = request.getParameter("review_content");
   	Double review_score = Double.parseDouble(request.getParameter("star"));
   	
   	vo.setUser_id(user_id);
   	vo.setProduct_id(product_id);
   	vo.setReview_content(review_content);
   	vo.setReview_score(review_score);
   	vo.setReview_date(datestr);

   	// 3. DAO이용해서, insert처리함.
   	ReviewDAO dao = new ReviewDAO();
   	boolean result = dao.create(vo);

   	// 4. 처리결과를 client에게 알려주어야 함.
   	String check = "저장 실패!";
   	if (result) { 
   		check="작성 완료!";
}%><%=check %>
	