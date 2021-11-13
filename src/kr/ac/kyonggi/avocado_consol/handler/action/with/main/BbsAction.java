package kr.ac.kyonggi.avocado_consol.handler.action.with.main;

import com.google.gson.Gson;
import kr.ac.kyonggi.avocado_consol.common.controller.Action;
import kr.ac.kyonggi.avocado_consol.handler.dao.test.TestDAO;
import kr.ac.kyonggi.avocado_consol.handler.dao.with.BbsDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BbsAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Gson gson = new Gson();
        String mode = request.getParameter("mode");

        if(mode == null) {
            mode = "list";
        }

        if(mode.equals("list")) {
            request.setAttribute("getBBSList", gson.toJson(BbsDAO.getInstance().getBbs()));
            return "RequestDispatcher:jsp/with/bbs/list.jsp";
        } else if (mode.equals("view")) {
            return "RequestDispatcher:jsp/with/bbs/view.jsp";
        } else if (mode.equals("write")) {
            return "RequestDispatcher:jsp/with/bbs/write.jsp";
        } else {
            return "RequestDispatcher:jsp/with/bbs/modify.jsp";
        }

    }
}