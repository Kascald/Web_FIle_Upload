<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="file.FileDTO" %>
<%@ page import="file.FileDAO" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Download Page</title>
</head>
<body>
    <%
//         String directory = application.getRealPath("/upload/");
//    	String directory = "H:\\jsp\\upload";
//        String files[] = new File(directory).list();

        ArrayList<FileDTO> filelist = new FileDAO().getList();


        for(FileDTO file : filelist){
            out.write("<a href=\"" + request.getContextPath() + "/DownloadAction?file=" +
                    URLEncoder.encode(file.getFileRealName(), StandardCharsets.UTF_8) + "\">" +
                    file.getFileName() + " - (다운로드 횟수 : "+ file.getDownloadCount() + ") </a><br>");
        }
    %>
	<br>
    <a href="${pageContext.request.contextPath}/index.jsp">메인으로 가기</a>
</body>
</html>