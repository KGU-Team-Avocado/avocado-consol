package kr.ac.kyonggi.avocado_consol.handler.action;

import kr.ac.kyonggi.avocado_consol.common.controller.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestGuroAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "RequestDispatcher:jsp/test/test_guro.jsp";
    }
}
