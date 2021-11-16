package kr.ac.kyonggi.avocado_consol.handler.action.main.page;

import com.google.gson.Gson;
import kr.ac.kyonggi.avocado_consol.common.controller.Action;
import kr.ac.kyonggi.avocado_consol.handler.dao.main.HomeDAO;
import kr.ac.kyonggi.avocado_consol.handler.dao.with.WithDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InformationAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = request.getParameter("num");
        System.out.println(id);
        Gson gson = new Gson();
        request.setAttribute("information", gson.toJson(HomeDAO.getInstance().getInformation(id)));
        System.out.println(HomeDAO.getInstance().getInformation(id));
        return "RequestDispatcher:jsp/main/page/information.jsp";
    }
}
