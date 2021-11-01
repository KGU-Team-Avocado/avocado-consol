package kr.ac.kyonggi.avocado_consol.handler.action.test;

import com.google.gson.Gson;
import kr.ac.kyonggi.avocado_consol.common.controller.Action;
import kr.ac.kyonggi.avocado_consol.handler.dao.TestDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestDynamicAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        /**
         * 데이터 요청을 하는 부분
         * */

        Gson gson = new Gson();
        request.setAttribute("test_data", gson.toJson(TestDAO.getInstance().getTest()));

        return "RequestDispatcher:jsp/test/test_dynamic.jsp";
    }
}
