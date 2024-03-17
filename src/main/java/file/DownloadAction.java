package file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DownloadAction")
public class DownloadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fileName = request.getParameter("file");
		String directory = this.getServletContext().getRealPath("/upload/"); //실제 경로 받아오기
		File file = new File(directory+"/"+fileName);

		String mimeType = getServletContext().getMimeType(file.toString());//file의 mimeType를 획득해온다. /2/Multipurpose Internet Mail Extensions or MIME type
		if (mimeType== null) {
			response.setContentType("application/octet-stream");    //2진 파일을 사용할 경우
		}

		String downloadName = null;
		if(!request.getHeader("user=agent").contains("MSE")) { //HTTP헤더의 식별자가 인터넷 익스플로러를 제외한 브라우저에서 실행한 경우 :Default-Format: User-Agent: <product> / <product-version> <comment>
			downloadName = new String(fileName.getBytes(StandardCharsets.UTF_8), StandardCharsets.ISO_8859_1); //UTF8 to ISO8859_1 String ecode
		}else {
			downloadName = new String(fileName.getBytes("EUC-KR"), StandardCharsets.ISO_8859_1); //EUC-KR to ISO8859_1 String ecode
		}
		response.setHeader("Content-Disposition", "attachment:filename=\""+downloadName+"\";"); //attachment (indicating it should be downloaded; most browsers presenting a 'Save as' dialog, prefilled with the value of the filename parameters if present (ref3)

		FileInputStream fileInputStream = new FileInputStream(file); //file 경로의 파일을 바이트스트림으로 읽어들이는 객체 생성
		ServletOutputStream servletOutputStream = response.getOutputStream();
		byte b[] = new byte[1024];
		int data = 0; //읽어온 데이터를 저장할 변수

		while((data = (fileInputStream.read(b , 0 , b.length))) != -1) { //Reads up to len bytes of data from this input stream into an array of bytes
			servletOutputStream.write(b, 0 , data); // len bytes = > b.length ,  offset = the start offset in the destination array 'b' , len - the maximum number of bytes read.
		}

		servletOutputStream.flush();  //inherited from java.io.OutputStream  ::Flushes this output stream and forces any buffered output bytes to be written out.
		servletOutputStream.close();  //inherited from java.io.OutputStream  ::Closes this output stream and releases any system resources associated with this stream.
		fileInputStream.close(); //Closes this file input stream and releases any system resources associated with the stream.
	}
	//ref1) fileInputstream Refference : https://docs.oracle.com/javase/8/docs/api/java/io/FileInputStream.html
}   //ref2) servletOutputStream Refference : https://docs.oracle.com/javaee%2F7%2Fapi%2F%2F/javax/servlet/ServletOutputStream.html
	//ref3) request-Header(Content-Disposition) : https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Disposition