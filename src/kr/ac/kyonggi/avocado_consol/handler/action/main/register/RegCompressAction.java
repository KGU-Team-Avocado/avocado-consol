package kr.ac.kyonggi.avocado_consol.handler.action.main.register;

import kr.ac.kyonggi.avocado_consol.common.controller.Action;
import kr.ac.kyonggi.avocado_consol.handler.dao.settings.RegisterDAO;
import kr.ac.kyonggi.avocado_consol.handler.dto.settings.RegisterDTO;
import kr.ac.kyonggi.avocado_consol.handler.zip.CompressZip;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

public class RegCompressAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String boardId = request.getParameter("id");
        String path = request.getSession().getServletContext().getRealPath("/uploaded/bbs_reg/reg"+boardId); // 압축할 파일이 저장된 위치
        RegisterDAO dao = RegisterDAO.getInstance();
        RegisterDTO checkReg = dao.getReg(boardId);
        String unZipPath = request.getSession().getServletContext().getRealPath("/uploadFile/"); // 압축할 파일 저장할 위치
        String unZipFile = checkReg.title; //압축할 파일 이름

        //압축하기
        CompressZip compressZip = new CompressZip();
        try{
            if (!compressZip.compress(path, unZipPath, unZipFile)){
                return "fail";
            }
        } catch (Throwable e){
            e.printStackTrace();
        }

        String savePath = unZipPath;
        // 서버에 실제 저장된 파일명
        String filename = unZipFile+".zip";

        // 실제 내보낼 파일명
        String orgfilename = unZipFile+"파일답변.zip";

        InputStream in = null;
        OutputStream os = null;
        File file = null;
        boolean skip = false;
        String client = "";

        try{
            // 파일을 읽어 스트림에 담기
            try{
                file = new File(savePath, filename);
                in = new FileInputStream(file);
            }catch(FileNotFoundException fe){
                skip = true;
            }

            client = request.getHeader("User-Agent");

            // 파일 다운로드 헤더 지정
            response.reset() ;
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Description", "JSP Generated Data");

            if(!skip){
                // IE
                if(client.indexOf("MSIE") != -1){
                    response.setHeader ("Content-Disposition", "attachment;filename="+new String(orgfilename.getBytes("KSC5601"),"ISO8859_1"));
                }else{
                    // 한글 파일명 처리
                    orgfilename = new String(orgfilename.getBytes("utf-8"),"iso-8859-1");

                    response.setHeader("Content-Disposition", ("attachment; filename=\"" + orgfilename + "\""));
                    response.setHeader("Content-Type", "application/octet-stream;charset=utf-8");
                }

                response.setHeader ("Content-Length", ""+file.length());

                os = response.getOutputStream();
                byte b[] = new byte[(int)file.length()];
                int leng = 0;

                while( (leng = in.read(b)) > 0 ){
                    os.write(b,0,leng);
                }

            }

            in.close();
            os.close();

        }catch(Exception e){
            e.printStackTrace();
        }
        try {
            File deleteFile = new File(savePath, filename);
            deleteFile.delete();
        }catch(Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
