package kr.ac.kyonggi.avocado_consol.handler.action.main.page;

import kr.ac.kyonggi.avocado_consol.common.controller.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MarketAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "RequestDispatcher:jsp/promodise/market.jsp";
    }
}
