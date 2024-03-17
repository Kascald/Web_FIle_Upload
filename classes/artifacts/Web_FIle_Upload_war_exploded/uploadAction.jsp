<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="file.FileDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload Action</title>
</head>
<body>
<%
    String directory = application.getRealPath("/upload/"); //저장할 경로
    int maxSize = 1024 * 1024 * 100; //100mb 제한
    String encoding = "UTF-8";

    MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize ,encoding, new DefaultFileRenamePolicy());

    String fileName = multipartRequest.getOriginalFileName("file"); //
    String fileRealName = multipartRequest.getFilesystemName("file"); //파일 실제 이름

    new FileDAO().upload(fileName,fileRealName); //upload 실행단
    out.write("파일명: " + fileName + "<br>");
    out.write("실제파일명: " + fileRealName + "<br>");
%>
</body>
</html>