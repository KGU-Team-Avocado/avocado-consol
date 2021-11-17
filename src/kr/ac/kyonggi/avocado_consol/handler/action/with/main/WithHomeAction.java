package kr.ac.kyonggi.avocado_consol.handler.action.with.main;

import kr.ac.kyonggi.avocado_consol.common.controller.Action;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WithHomeAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "RequestDispatcher:jsp/promodise/index.jsp";
    }
}
