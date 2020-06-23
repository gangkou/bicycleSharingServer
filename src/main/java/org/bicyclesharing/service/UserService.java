package org.bicyclesharing.service;

import org.bicyclesharing.entities.User;

import java.math.BigDecimal;
import java.util.List;

/**
 * 用户相关逻辑接口
 * @author 小米饭
 * @date 2020/6/13
 **/
public interface UserService {
    /**
     * 1.用户登录
     * @param useremail userpassword
     * @return
     */
    boolean login(String useremail,String userpassword);

    /**
     * 2.根据用户邮箱获取信息
     * @param useremail
     * @return
     */
    User getUserByEmail(String useremail);

    /**
     * 3.用户注册
     * @return
     */
    boolean register(String userEmail,String userName,String userPassword);

    /**
     * 4.获取所有用户
     * @return
     */
    List<User> getAllUser();

    /**
     * 5.删除某个用户
     * @param useremail
     * @return
     */
    boolean removeUser(String useremail);

    /**
     * 6.通过用户名模糊查询用户
     * @param username
     * @return
     */
    List<User> getUserByNameLike(String username);

    /**
     * 7.编辑用户信息
     * @param user
     * @return
     */
    boolean editUser(User user);

    /**
     * 8.获取用户数量
     * @return
     */
    Integer getUserCount();

    /**
     * 9.重置某个用户的信用
     * @param useremail
     */
    void resetCredit(String useremail);

    /**
     * 10.用户提交押金
     * @param useremail
     */
    void changeCashOne(String useremail);
    /**
     * 11.用户撤回押金
     * @param useremail
     */
    void changeCashTwo(String useremail);

    /**
     * 12.用户充值
     * @param user
     * @return
     */
   boolean editUserAccouunt(User user);
}
