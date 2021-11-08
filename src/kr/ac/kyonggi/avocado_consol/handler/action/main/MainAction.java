package kr.ac.kyonggi.avocado_consol.handler.action.main;

import com.google.gson.Gson;
import kr.ac.kyonggi.avocado_consol.common.controller.Action;
import kr.ac.kyonggi.avocado_consol.handler.dao.TestDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        /**
         * 데이터 요청을 하는 부분
         * */

        Gson gson = new Gson();
        request.setAttribute("team", gson.toJson(TestDAO.getInstance().getTeam()));

        return "RequestDispatcher:jsp/main/main.jsp";
    }
}
