package org.bicyclesharing.web;

import org.bicyclesharing.entities.User;
import org.bicyclesharing.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Map;

/**
 * @author 小米饭
 * @date 2020/6/13
 **/
@Controller
@RequestMapping(value = "/")
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * 1.用户列表显示
     * @return user/user_list.jsp
     */
    @RequestMapping(value="admin-user-list-show", method= RequestMethod.GET)
    public String listShow(Map<String, Object> requestMap, @RequestParam("page") Integer page) {
        requestMap.put("nav", "user");
        ArrayList<User> users = (ArrayList<User>) userService.getAllUser();
        requestMap.put("users", users);

        int pageCount = users.size();  //数据条数
        int pageSize = 20;  //分页条数
        int pageMax = pageCount / pageSize;  //最大页数
        int pagePointer = 1;  //当前指向页
        if (pageMax != 0 && pageCount % pageSize != 0) {
            ++pageMax;
        }
        if (pageMax == 0) {
            pageMax = 1;
        }
        if (page < 1 || page > pageMax) {
            pagePointer = 1;
        } else {
            pagePointer = page;
        }
        ArrayList<User> pageUsers = new ArrayList<>();
        if (pageMax == 1) {
            pageUsers.addAll(users);
        } else if (pagePointer == pageMax) {
            int tmp = pageCount % pageSize;
            if (tmp == 0) {
                tmp = pageSize;
            }
            for (int i = pageSize * (pagePointer - 1); i < pageSize * (pagePointer - 1) + tmp; ++i) {
                pageUsers.add(users.get(i));
            }
        } else {
            for (int i = pageSize * (pagePointer - 1); i < pageSize * pagePointer; ++i) {
                pageUsers.add(users.get(i));
            }
        }
        requestMap.put("pageMax", pageMax);
        requestMap.put("pagePoint", pagePointer);
        requestMap.put("pageUsers",pageUsers);

        return "user/user_list";
    }

    /**
     * 2.根据id删除用户执行
     * @param userEmail
     * @return user_list.jsp
     */
    @RequestMapping(value="admin-admin-removeuser-execute/{userEmail}",method=RequestMethod.GET)
    public String removeUserExecute(@PathVariable("userEmail") String userEmail){
        userEmail =userEmail+".com";
        userService.removeUser(userEmail);
        return "redirect:/admin-user-list-show?page=1";
    }

    /**
     * 3.搜索用户显示
     * @return user/user_list.jsp
     */
    @RequestMapping(value="admin-user-searchuser-show",method=RequestMethod.GET)
    public String searchUserShow(Map<String, Object> requestMap,@RequestParam("username") String username){
        requestMap.put("nav", "user_list");
        ArrayList<User> users = (ArrayList<User>) userService.getUserByNameLike(username);
        requestMap.put("pageUsers", users);
        return "user/user_list";
    }

    /**
     * 4.重置用户信用
     * @param userEmail
     * @return
     */
    @RequestMapping(value="admin-user-resetcredit-execute/{userEmail}", method=RequestMethod.GET)
    public String resetCredit(@PathVariable("userEmail") String userEmail) {
        userEmail =userEmail+".com";
        userService.resetCredit(userEmail);
        return "redirect:/admin-user-list-show?page=1";
    }

    /**
     * 退出登录
     * @param session
     * @return
     */
    @RequestMapping(value = "user-exit-execute", method = RequestMethod.GET)
    public String exitExecute(HttpSession session) {
        session.invalidate();
        return "redirect:/user_login";
    }

    @RequestMapping("flush-user")
    public String flushUser(@RequestParam("userEmail") String userEmail,HttpSession session){
        User user=userService.getUserByEmail(userEmail);
        session.setAttribute("user",user);
        return  "user/user_show";
    }
}
