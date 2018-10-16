package service;

import dao.UserMapper;
import entity.Record;
import entity.User;
import entity.UserExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserMapper mapper;

    //登录注册的验证
    public User login(String username, String password){
        User user = getUserByUsername(username);
        if(user!=null && user.getPassword().equals(password)){
            return user;
        }
        return null;
    }

    public User getUserByUsername(String username){
        UserExample userExample = new UserExample();
        userExample.createCriteria().andUsernameEqualTo(username);
        List<User> list = mapper.selectByExample(userExample);
        if(list.size() == 1){
            return list.get(0);
        }else{
            return null;
        }
    }


}
