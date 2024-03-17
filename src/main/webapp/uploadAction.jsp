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
//     String directory = application.getRealPath("/upload/"); //저장할 경로
	String directory = "H:\\jsp\\upload";  //app 내부의 upload 폴더가 아닌 외부의 폴더를 경로로 수정
    int maxSize = 1024 * 1024 * 100; //100mb 제한
    String encoding = "UTF-8";

    MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize ,encoding, new DefaultFileRenamePolicy());

    String fileName = multipartRequest.getOriginalFileName("file"); //
    String fileRealName = multipartRequest.getFilesystemName("file"); //파일 실제 이름


    if(!fileName.endsWith(".gif") && !fileName.endsWith(".png") &&
    !fileName.endsWith(".jpg") && !fileName.endsWith(".txt"))  //gif, png, jpg, txt 확장자만 업러드에 허용하겠다.
    {
       File file = new File(directory + "/" + fileRealName);  //일단 불러들인 후
       file.delete();                                         // 삭제를 실행함
       out.write("업로드할 수 없는 확장자 입니다.");
    }else {
        new FileDAO().upload(fileName,fileRealName); //upload 실행단
        out.write("파일명: " + fileName + "<br>");
        out.write("실제파일명: " + fileRealName + "<br>");
    }

%>

<a href="${pageContext.request.contextPath}/index.jsp">메인으로 돌아가기</a>
</body>
</html>