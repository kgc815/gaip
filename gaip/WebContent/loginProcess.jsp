<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<%
   String id = request.getParameter("id");
   String pw = request.getParameter("pw");
   String sql = "select id,pw from member";
   Connection conn = null;
   try {
      Context init = new InitialContext();
      DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
      conn = ds.getConnection();
      int f = 0;
      PreparedStatement stmt = conn.prepareStatement(sql);
      ResultSet rs = stmt.executeQuery();
      while (rs.next()) {
         String id1 = rs.getString(1);
         String pw1 = rs.getString(2);
         if (id1.equals(id) && pw1.equals(pw)) {
            f = 1;
            if (id.equals("admin")) {
            	
            	session.setAttribute("id", id);
            	out.println("<script>alert('관리자로 로그인 하셨습니다.');location.href='Member_list.jsp'</script>");
            	out.print(session.getAttribute("id"));
            	//response.sendRedirect("Member_list.jsp");
            } else {
               
               session.setAttribute("id", id);
               out.println("<script>alert('안뇽');location.href='Main.jsp'</script>");
            }
         }
      }
      if (f == 0) {
         out.println("<script>alert('다시 로그인 해주세요.');history.back();</script>");
      }
   } catch (Exception e) {

      e.printStackTrace();
   }
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <a href=""></a>

</body>
</html>
