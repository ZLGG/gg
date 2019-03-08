package controller;

import dao.IpDaoMapper;
import entity.Ip;
import entity.User;
import org.apache.ibatis.annotations.Mapper;
import vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.UserService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @Autowired
    private IpDaoMapper ipDao;



    /**
     * 登录的方法，请求是post
     * @param username
     * @param password
     * @param session
     * @return
     */
    //@ResponseBody
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(String username, String password, HttpSession session){
        User user1 = (User) session.getAttribute("user");
        if (username == null && password == null) {
            username = user1.getUsername();
            password = user1.getPassword();
        }
        User user = userService.login(username, password);
        if(user != null){
            session.setAttribute("user", user);
            //return new Result<>(200,"登录成功", user);
            return "/index";
        }
        return new Result<>(400,"用户名或者密码错误", null);
        return "/login";
    }

    /**
     * 跳转到主页面 防止表单重复提交
     * @param session
     * @return
     */
    @RequestMapping(value = "/index")
    public String index(HttpSession session){
        User user = (User) session.getAttribute("user");
        user.setUsername("user1");
        user.setPassword("1");
        session.setAttribute("user", user);
        if(user == null){
            return  "/login";
        }
        return "index";
    }

    /**
     * 非法登录的时候发送的请求
     * @return
     */
    @RequestMapping(value = "/invalidLogin")
    public String invalidLogin(){

        return "invalidLogin";
    }

    /**
     * 来到登录页面
     * @return
     */
    @RequestMapping(method = RequestMethod.GET, value = "/login")
    public String loginView(HttpServletRequest request){
        //查看访问记录
        String ip = request.getRemoteAddr();
        Date date = new Date();
        Ip ip1 = new Ip();
        ip1.setDate(date);
        ip1.setIp(ip);
        ipDao.insertOne(date,ip);
        return "login";
    }
}

