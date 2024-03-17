<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Download Page</title>
</head>
<body>
    <%
        String directory = application.getRealPath("/upload/");
        String files[] = new File(directory).list();

        for(String file : files){
            out.write("<a href=\"" + request.getContextPath() + "/downloadAction?file=" +
                    java.net.URLEncoder.encode(file, "UTF-8") + "\">" + file + "</a><br>");
        }
    %>

    <a href="${pageContext.request.contextPath}/index.jsp">메인으로 가기</a>
</body>
</html>