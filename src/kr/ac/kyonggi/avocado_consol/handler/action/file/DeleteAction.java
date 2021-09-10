package kr.ac.kyonggi.avocado_consol.handler.action.file;

import com.google.gson.Gson;
import kr.ac.kyonggi.avocado_consol.common.controller.Action;
import kr.ac.kyonggi.avocado_consol.handler.dao.settings.FileDAO;
import kr.ac.kyonggi.avocado_consol.handler.dto.settings.UploadedFileDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;

public class DeleteAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String folder = request.getParameter("folder");
        String fileID = request.getParameter("fileId");
        Gson gson = new Gson();
        String path = request.getSession().getServletContext().getRealPath(folder);
        FileDAO dao = FileDAO.getInstance();
        UploadedFileDTO it = dao.getFile(fileID);
        File deleteFile = new File(path, it.newFileName);
        deleteFile.delete();
        dao.deleteFileWithName(it.newFileName);
        return gson.toJson(null);
    }
}
