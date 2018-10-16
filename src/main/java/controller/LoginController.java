package controller;

import entity.User;
import vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.UserService;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @ResponseBody
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public Result<User> login(String username, String password, HttpSession session){
        User user = userService.login(username, password);
        if(user != null){
            session.setAttribute("user", user);
            return new Result<>(200,"登录成功", user);
        }
        return new Result<>(400,"用户名或者密码错误", null);
    }

    //跳转到主页面 防止表单重复提交
    @RequestMapping("/index")
    public String index(HttpSession session){
        User user = (User) session.getAttribute("user");
        if(user == null){
            return  "redirect:/";
        }
        return "index";
    }

    @RequestMapping(value = "/invalidLogin")
    public String invalidLogin(){

        return "invalidLogin";
    }
}

