package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import service.RecordService;
import service.UserService;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private RecordService recordService;



    @InitBinder
    public void initBinder(WebDataBinder binder){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        simpleDateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(simpleDateFormat, true));
    }

    //跳转我可以请假的列表
    @RequestMapping("/check")
    public String gotoListIcan(){
        return "check";
    }

    //退出登录
    @RequestMapping("/loginout")
    public String loginOut(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }

    //查看我的请假
    @RequestMapping("/myLeave")
    public String myLeave(){
        return "myLeave";
    }

}
