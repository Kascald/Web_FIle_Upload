<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>파일 업로드</title>
</head>
<body>
<form action="uploadAction.jsp" method="post" enctype="multipart/form-data">
    파일:&nbsp;&nbsp;<input type="file" name="file1"><br>
    파일:&nbsp;&nbsp;<input type="file" name="file2"><br>
    파일:&nbsp;&nbsp;<input type="file" name="file3"><br>
    <br>
    <input type="submit" value="업로드"><br>
    
    <a href="${pageContext.request.contextPath}/fileDownload.jsp">파일 다운로드로 가기</a>
</form>
</body>
</html>