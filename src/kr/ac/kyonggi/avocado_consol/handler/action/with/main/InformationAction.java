package kr.ac.kyonggi.avocado_consol.handler.action.with.main;

import com.google.gson.Gson;
import kr.ac.kyonggi.avocado_consol.common.controller.Action;
import kr.ac.kyonggi.avocado_consol.handler.dao.test.TestDAO;
import kr.ac.kyonggi.avocado_consol.handler.dao.with.WithDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InformationAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Gson gson = new Gson();
        String num = request.getParameter("num");
        request.setAttribute("information", gson.toJson(WithDAO.getInstance().getInformation(num)));
        //System.out.println(num);
        return "RequestDispatcher:jsp/with/page/information.jsp";
    }
}
