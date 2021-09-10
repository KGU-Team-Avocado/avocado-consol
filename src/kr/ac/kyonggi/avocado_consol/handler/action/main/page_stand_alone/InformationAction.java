package kr.ac.kyonggi.avocado_consol.handler.action.main.page_stand_alone;

import com.google.gson.Gson;
import kr.ac.kyonggi.avocado_consol.common.controller.CustomAction;
import kr.ac.kyonggi.avocado_consol.handler.dao.settings.HomeDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InformationAction extends CustomAction {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.execute(request,response);
        Gson gson = new Gson();
        //http://localhost:8080/information.kgu?major=main&&num=10
        String major=request.getParameter("major");
        String num=request.getParameter("num");

        request.setAttribute("information", gson.toJson(HomeDAO.getInstance().getText(major,num)));

        request.setAttribute("jsp", gson.toJson("information")); //information.jsp
        return "RequestDispatcher:jsp/page_stand_alone/page_stand_alone.jsp";
    }
}
