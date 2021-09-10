package kr.ac.kyonggi.avocado_consol.handler.action;


import com.google.gson.Gson;
import kr.ac.kyonggi.avocado_consol.common.controller.Action;
import kr.ac.kyonggi.avocado_consol.handler.dao.settings.*;
import kr.ac.kyonggi.avocado_consol.handler.dao.tutorial.TutorialDAO;
import kr.ac.kyonggi.avocado_consol.handler.dao.user.UserDAO;
import kr.ac.kyonggi.avocado_consol.handler.dto.settings.RegisterDTO;
import kr.ac.kyonggi.avocado_consol.handler.dto.user.UserDTO;
import kr.ac.kyonggi.avocado_consol.handler.dto.user.UserTypeDTO;
import kr.ac.kyonggi.avocado_consol.handler.excel.ExcelReader;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class AjaxAction implements Action {
    /**
     * DB를 JSP에서 JAVA로 보낼 때 사용하는 클래스입니다.
     * JSP의 ajax에서 정해준 req, data 값을 가지고 작업을 하게됩니다.
     * req는 필요한 case문을 찾아 들어가는데 사용하고
     * data는 DAO로 넘길 데이터를 의미합니다.
     * data의 경우에는 "일반적으로" JS가 여러 데이터 값을 한줄로 합쳐놓은 상태입니다.
     * 따라서 마지막으로 받는 메소드는 항상 split해줘야 하는지 고민해야 합니다.
     * */


    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Gson gson = new Gson();
        String req = request.getParameter("req"); //JSP에서 넘겨준 req
        HttpSession session = request.getSession(); //Session에 있는 정보로 뭔가 해야할 때 사용
        String data = request.getParameter("data"); //JSP에서 넘겨준 data
        UserDTO user = gson.fromJson((String)session.getAttribute("user"), UserDTO.class);
        UserTypeDTO type = gson.fromJson((String)session.getAttribute("type"), UserTypeDTO.class);
        String result=null;
        String address = null;
        String num= request.getParameter("num");
        switch(req) {
            case "deleteExampleData":   //테스트용
                result = TutorialDAO.getInstance().deleteExampleData(data); //삭제할 oid를 넘겨줍니다.
                break;
            case "addExampleData":
                result = TutorialDAO.getInstance().addExampleData(data); //추가할 데이터 정보를 넘겨줍니다.
                break;
            case "checkId":      //권한 확인 필요 없음(회원가입 중복아이디 체크)
                if (UserDAO.getInstance().checkID(data))
                    result = "";
                else
                    result = "dup";
                break;
            case "registerBig":
                String big[] = data.split("-/-/-");
                if (UserDAO.getInstance().checkID(big[0]))
                    result = UserDAO.getInstance().registerBigID(data);
                if (result.equals("success")) {
                    LogDAO.getInstance().insertLog(big[0],big[2], "-", new Date(),"회원가입("+big[5]+")");
                } else
                    result = "fail";
                break;
            case "registerSmall":
                String small[] = data.split("-/-/-");
                if (UserDAO.getInstance().checkID(small[0]))
                    result = UserDAO.getInstance().registerSmallID(data);
                if (result.equals("success")) {
                    LogDAO.getInstance().insertLog(small[0], small[2], "-", new Date(),"회원가입("+small[5]+")");
                } else
                    result = "fail";
                break;

            case "registerGoogle":
//                System.out.println(data);
                String google[] = data.split("-/-/-");
                //id+"-/-/-"+perID+"-/-/-"+name+"-/-/-"+gender+"-/-/-"+birth+"-/-/-"+hopetype+"-/-/-"+phone+"-/-/-"+major;
                String google_id = (String)session.getAttribute("google_id");;
                String google_img = (String)session.getAttribute("google_imageUrl");;
                String id = google[0];
                String password = "no_password_for_google_account";
                String name = google[2];
                String gender= google[3];
                String birth= google[4];
                String email= (String)session.getAttribute("google_email");;
                String phone= google[6];
                String hope_type= google[5];
                String major= google[7];
                String per_id = google[1];
                String reg_date = google[8];

                if (UserDAO.getInstance().checkID(google[0])){
                    String new_data = google_id+"-/-/-"+google_img+"-/-/-"+id+"-/-/-"+password+"-/-/-"+name+"-/-/-"+gender+"-/-/-"+birth+"-/-/-"+email+"-/-/-"+phone+"-/-/-"+hope_type+"-/-/-"+major+"-/-/-"+per_id+"-/-/-"+reg_date;
//                    System.out.println(new_data);
                    result = UserDAO.getInstance().registerGoogleID(new_data);
                }
                if (result.equals("success")) {
                    LogDAO.getInstance().insertLog(google[0],google[2], "-", new Date(),"구글/회원가입("+google[5]+")");
                }
                else{
                    result = "fail";
                }
                break;

            case "modifyText":
                if (type.board_level != 0)
                    return "fail";
                result = HomeDAO.getInstance().modifyText(data);
                break;

            case "deleteUser":
                String delete[] = data.split("-/-/-");
                if (type.board_level == 0 || delete[0].equals(user.id)){
                    result=UserDAO.getInstance().deleteUser(data);
                }
                if (result.equals("success")){
                    LogDAO.getInstance().insertLog(delete[0], delete[1], delete[2], new Date(),"탈퇴");
                    break;
                }
                return "fail";
            case "modifyuserdata":
                String arr[] = data.split("-/-/-");//0:id 1:phone 2:birth 3:email 4:grade 5:state
                if (!arr[0].equals(user.id))
                    return "fail";
                result = UserDAO.getInstance().modifydata(data);
                session.setAttribute("user", gson.toJson(UserDAO.getInstance().getUser(arr[0])));
                LogDAO.getInstance().insertLog(user.id, user.name, user.type, new Date(),"회원정보수정");
                break;

            case "modifySubMajor":
                String arrdata[] = data.split("-/-/-");//0:id 1:phone 2:birth 3:email 4:sub_major
                if (!arrdata[0].equals(user.id))
                    return "fail";
                result = UserDAO.getInstance().modifySubMajor(data);
                session.setAttribute("user", gson.toJson(UserDAO.getInstance().getUser(arrdata[0])));
                LogDAO.getInstance().insertLog(user.id, user.name, user.type, new Date(),"회원정보수정");
                break;

            case "addMajor":
                if (type.board_level != 0){
                    return "fail";
                }
                result=AdminDAO.getInstance().addMajor(data);
                break;
            case "modifyMajor":
                if (type.board_level != 0){
                    return "fail";
                }
                result=AdminDAO.getInstance().modifyMajor(data);
                break;

            case "checkPassword":
                if (UserDAO.getInstance().checkPassword(data))
                    result = "true";
                else
                    result = "false";
                break;
            case "modifyPwd":
                String modifyPwd[] = data.split("-/-/-");
                if (modifyPwd[0].equals(user.id) || type.board_level == 0)
                    result = UserDAO.getInstance().modifypw(data);
                if(result.equals("success")){
                    UserDTO modifiedUser = UserDAO.getInstance().getUser(modifyPwd[0]);
                    LogDAO.getInstance().insertLog(modifiedUser.id, modifiedUser.name, modifiedUser.type, new Date(),"비밀번호수정");
                }
                break;
            case "modifyProfessor":   //직접 권한 확인
                if (type.board_level == 0)
                    result = ProfessorDAO.getInstance().modifyProfessor(data);
                break;
//            case "getOneProfessor":   //직접 권한 확인
//                if (type.board_level == 0)
//                    result = gson.toJson(ProfessorDAO.getInstance().getOneProfessor(data));
//                break;
            case "insertProfessor":      //직접 권한 확인
                if (type.board_level == 0)
                    result =ProfessorDAO.getInstance().insertProfessor(data);
                break;
            case "deleteProfessor":      //직접 권한 확인
                if (type.board_level == 0)
                    result = ProfessorDAO.getInstance().deleteProfessor(data);
                break;
            case "modifyUserType":      //권한 수정
                if (type.board_level == 0)
                    result = UserDAO.getInstance().modifyUserType(data);
                break;

            case "addSchedule":
                if (type.board_level == 0)
                    result=AdminDAO.getInstance().addSchedule(data);
                break;
            case "modifySchedule":
                if (type.board_level == 0)
                    result=AdminDAO.getInstance().modifySchedule(data);
                break;
            case "updateSchedule":
                if (type.board_level == 0)
                    result=AdminDAO.getInstance().updateSchedule();
                break;
            case "deleteSchedule":
                if (type.board_level == 0)
                    result=AdminDAO.getInstance().deleteSchedule(data);
                break;
            case "modifyLoc":   //직접 권한 확인
                if (type.board_level == 0)
                    result = LocationDAO.getInstance().modifyLoc(data);
                break;
            case "addDeveloper":
                if (type.board_level == 0)
                    result=DeveloperDAO.getInstance().addDeveloper(data);
                break;
            case "insertSlider":
                if(type.board_level==0)
                    result=AdminDAO.getInstance().addSlider(data);
                break;
            case "deleteSlider":
                if(type.board_level==0)
                    result=AdminDAO.getInstance().deleteSlider(data);
                break;
            case "modifyDeveloper":
                if (type.board_level == 0)
                    result=DeveloperDAO.getInstance().modifyDeveloper(data);
                break;
            case "deleteDeveloper":
                if (type.board_level == 0)
                    result=DeveloperDAO.getInstance().deleteDeveloper(data);
                break;
            case "modifyCurriculum":
                if(type.board_level==0)
                    result=CurriculumDAO.getInstance().modifyCurriculum(data);
                break;
            case "insertCurriculum":
                if(type.board_level==0)
                    result=CurriculumDAO.getInstance().insertCurriculum(data);
                break;
            case "deleteCurriculum":
                if(type.board_level==0)
                    result=CurriculumDAO.getInstance().deleteCurriculum(data);
                break;
            case "insertBbs":
                if(type.board_level<3){
                    String major1 = data.split("-/-/-")[0];
                    String bbs_id = BBSDAO.getInstance().insertBbs(data);
//                    System.out.println(bbs_id);
                    result = BBSDAO.getInstance().insertBbsFile(FileDAO.getInstance().getFiles("/uploaded/bbs"), bbs_id, major1);
                }
                break;
            case "modifyBbs":
                String major1 = data.split("-/-/-")[1];
                if(type.board_level < 3){
                    result=BBSDAO.getInstance().modifyBbs(data);
                }
                if(result.equals("success")){
                    result = BBSDAO.getInstance().insertBbsFile(FileDAO.getInstance().getFiles("/uploaded/bbs"), data.split("-/-/-")[0],major1);
                }
                break;
            case "deleteBbsAlreadyFile":
                String forAlreadyFile = "-/-/-" + user.id + "-/-/-" + type.for_header;
                data = data.concat(forAlreadyFile);
                result = BBSDAO.getInstance().deleteAlreadyFile(data);
                break;
            case "deleteBbs":
                if(type.board_level< 3)
                    result=BBSDAO.getInstance().deleteBbs(data);
                break;
            case "insertComment":
                if(user!=null)
                    result=BBSDAO.getInstance().insertComment(data);
                break;
            case "modifyComment":
                if(user!=null)
                    result=BBSDAO.getInstance().modifyComment(data);
                break;
            case "deleteComment":
                if(user!=null){
//                    System.out.println("kjhjh");
                    result=BBSDAO.getInstance().deleteComment(data);
                }
                break;
            case "likeBoard":
                data = data.concat("-/-/-" + user.id);
                result = BBSDAO.getInstance().likeBoards(data);
                break;
            case "insertexceluser": // 엑셀 유저 추가
                if (type.board_level == 0) {
                    address = request.getParameter("address");
                    List<Map<String, Object>> insertmap = null;
                    String xls = address.substring(address.lastIndexOf(".") + 1);
                    if (xls.equals("xlsx"))
                        insertmap = new ExcelReader().xlsxUserReader(address);
                    else
                        insertmap = new ExcelReader().xlsUserReader(address);
                    result = UserDAO.getInstance().insertexceluser(insertmap);
                    String path = request.getSession().getServletContext().getRealPath("/") + "excel";
                    File deleteFile = new File(path, address);
                    deleteFile.delete();
                }
                break;
            case "modifyexceluser": // 엑셀 유저 수정
                if (type.board_level == 0) {
                    address = request.getParameter("address");
                    String xlsx = address.substring(address.lastIndexOf(".") + 1);
                    List<Map<String, Object>> modifymap = null;
                    if (xlsx.equals("xlsx"))
                        modifymap = new ExcelReader().xlsxUserReadermodify(data, address);
                    else
                        modifymap = new ExcelReader().xlsUserReadermodify(data, address);
                    result = UserDAO.getInstance().modifyexceluser(modifymap);
                    String path2 = request.getSession().getServletContext().getRealPath("/") + "excel";
                    File deleteFile2 = new File(path2, address);
                    deleteFile2.delete();
                }
                break;
            case "getonemenu":
                result = HomeDAO.getInstance().getOneMenu(data);
                break;
            case "modify_menu":   //직접 권한 확인
                if (type.board_level == 0) {
                    result = HomeDAO.getInstance().modifyMenu(data);
                    session.setAttribute("menulist", gson.toJson(HomeDAO.getInstance().getHeaderMenuPages()));
                    session.setAttribute("headermenulist", gson.toJson(HomeDAO.getInstance().getHeaderMenuTabs()));
                }
                break;
            case "delete_menu":
                if (type.board_level == 0) {   //직접 권한 확인
                    result = HomeDAO.getInstance().deleteMenu(data);
                    session.setAttribute("menulist", gson.toJson(HomeDAO.getInstance().getHeaderMenuPages()));
                    session.setAttribute("headermenulist", gson.toJson(HomeDAO.getInstance().getHeaderMenuTabs()));
                }
                break;
            case "insert_menu":   //직접 권한 확인
                if (type.board_level == 0) {
                    result = HomeDAO.getInstance().insertMenu(data);
                    session.setAttribute("menulist", gson.toJson(HomeDAO.getInstance().getHeaderMenuPages()));
                    session.setAttribute("headermenulist", gson.toJson(HomeDAO.getInstance().getHeaderMenuTabs()));
                }
                break;
            case "insert_notice_menu":   //직접 권한 확인
                if (type.board_level == 0) {
                    result = HomeDAO.getInstance().insertNoticeMenu(data);
                    session.setAttribute("menulist", gson.toJson(HomeDAO.getInstance().getHeaderMenuPages()));
                    session.setAttribute("headermenulist", gson.toJson(HomeDAO.getInstance().getHeaderMenuTabs()));
                }
                break;
            case "insert_independent":   //직접 권한 확인
                if (type.board_level == 0) {
                    result = HomeDAO.getInstance().insertIndependent(data);
                    session.setAttribute("menulist", gson.toJson(HomeDAO.getInstance().getHeaderMenuPages()));
                    session.setAttribute("headermenulist", gson.toJson(HomeDAO.getInstance().getHeaderMenuTabs()));
                }
                break;
            case "insertReg":
                if(type.board_level==0 || type.for_header.equals("교수")) {
                    String reg_id = RegisterDAO.getInstance().insertReg(data);
                    result = RegisterDAO.getInstance().insertRegFile(FileDAO.getInstance().getFiles("/uploaded/bbs_reg"), reg_id);
                }
                break;
            case "modifyReg":
                String writer=data.split("-/-/-")[3];
                if(user.id.equals(writer) || type.board_level==0){
                    result=RegisterDAO.getInstance().modifyReg(data);
                }
                if(result.equals("success")){
                    result = RegisterDAO.getInstance().insertRegFile(FileDAO.getInstance().getFiles("/uploaded/bbs_reg"), data.split("-/-/-")[0]);
                }
                break;
            case "deleteRegAlreadyFile":
                String forAlreadyFileUser = "-/-/-" + user.id + "-/-/-" + type.for_header;
                data = data.concat(forAlreadyFileUser);
                result = RegisterDAO.getInstance().deleteAlreadyFile(data);
                break;
            case "deleteNotUploadedFile":
                result = FileDAO.getInstance().deleteNotUploadedFile(data);
                break;
            case "deleteReg":
                String writer1=data.split("-/-/-")[1];
                if(user.id.equals(writer1) || type.board_level==0) //권한 검사
                    result=RegisterDAO.getInstance().deleteReg(data);
                break;
            case "whoAnswerIt": //현재 유저가 이미 신청한 사람인지 확인하는 것이기 때문에 권한 확인 필요 없음
                data = data.concat("-/-/-" + user.id);
                result = RegisterDAO.getInstance().whoAnswerIt(data);
                break;
            case "getQuestions":   //DAO에서 권한 확인
                data = data.concat("-/-/-" + type.for_header + "-/-/-" + user.id + "-/-/-" + type.board_level);
                result = gson.toJson(RegisterDAO.getInstance().getQuestions(data));
                break;
            case "insertAnswer":
                RegisterDTO req_BoardsCheck = RegisterDAO.getInstance().getReg(data.split("-/-/-")[0]);
                if (!req_BoardsCheck.level.contains(type.for_header)){
                    return "fail";
                }
                if (new Date().getTime() > (req_BoardsCheck.closing_date.getTime() + 60 * 60 * 1000 * 24) || new Date().getTime() < req_BoardsCheck.starting_date.getTime())
                    return "timeout";
                data = (user.name + "-/-/-" + user.id + "-/-/-" + user.per_id + "-/-/-" + user.grade + "-/-/-" + user.type + "-/-/-").concat(data);
                result = RegisterDAO.getInstance().insertAnswers(data);
                break;
            case "insertAnswerFile": //이미 "insertAnswer"에서 권한 검사함
                result = RegisterDAO.getInstance().insertAnswerFile(data);
                break;
            case "modifyAnswer":
                RegisterDTO req_check = RegisterDAO.getInstance().getReg(data.split("-/-/-")[0]);
                if (!req_check.level.contains(type.for_header)){
                    return "fail";
                }
                if (new Date().getTime() > (req_check.closing_date.getTime() + 60 * 60 * 1000 * 24) || new Date().getTime() < req_check.starting_date.getTime())
                    return "timeout";
                data = (user.name + "-/-/-" + user.id + "-/-/-" + user.per_id + "-/-/-" + user.grade + "-/-/-" + user.type + "-/-/-").concat(data);
                result = RegisterDAO.getInstance().modifyAnswer(data);
                break;
            case "modifyAnswerFile"://이미 "modifyAnswer"에서 권한 검사함
//                System.out.println("13");
                result = RegisterDAO.getInstance().modifyAnswerFile(data);
                break;
            case "deleteWhoAnswer":
                data = data.concat("-/-/-" + user.name + "-/-/-" + user.per_id + "-/-/-" + user.grade + "-/-/-" + user.id);
                String deletePath = request.getSession().getServletContext().getRealPath("/uploaded/bbs_reg/reg");
                String realDeletePath = deletePath + data.split("-/-/-")[0];
                data = data.concat("-/-/-" + realDeletePath);
                result = RegisterDAO.getInstance().deleteWhoAnswer(data);
                break;

            case "modifyKguMajor":
                if (type.board_level != 0){
                    return "fail";
                }
                result=AdminDAO.getInstance().modifyKguMajor(data);
                break;

            case "addKguMajor":
                if (type.board_level != 0){
                    return "fail";
                }
                result=AdminDAO.getInstance().addKguMajor(data);
                break;
            case "delete_major":
                if (type.board_level == 0)
                    result=AdminDAO.getInstance().deleteMajor(data);
                break;
            case "delete_kgu_major":
                if (type.board_level == 0)
                    result=AdminDAO.getInstance().deleteKguMajor(data);
                break;
            case "delete_sub_major":
                String userId = data;
                if (userId.equals(user.id)){
                    result=UserDAO.getInstance().deleteSubMajor(data);
                }
                break;
        }

        return result;
    }
}