package kr.ac.kyonggi.avocado_consol.handler.action.test;

import com.google.gson.Gson;
import kr.ac.kyonggi.avocado_consol.common.controller.Action;
import kr.ac.kyonggi.avocado_consol.handler.dao.TestDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TuesdayAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Gson gson = new Gson();
        request.setAttribute("tuesdayData", gson.toJson(TestDAO.getInstance().getTest()));
        return "RequestDispatcher:jsp/test/tuesday.jsp";
    }
}
