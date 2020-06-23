package org.bicyclesharing.service.impl;

import org.bicyclesharing.dao.UserDao;
import org.bicyclesharing.entities.Admin;
import org.bicyclesharing.entities.User;
import org.bicyclesharing.service.UserService;
import org.bicyclesharing.util.EncoderUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

/**
 * 用户相关逻辑实现类
 * @author 小米饭
 * @date 2020/6/13
 **/
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public boolean login(String useremail,String userpassword) {
        User user=userDao.selectUserById(useremail);
        if(user==null){
         return false;
        }else {
            String passwordMD5 = EncoderUtil.EncoderByMd5(userpassword);
            if (!user.getUserPassword().equals(passwordMD5)) {
                return false;
            }
            return true;
        }
    }

    @Override
    public User getUserByEmail(String useremail) {
        return userDao.selectUserById(useremail);
    }

    @Override
    public boolean register(String userEmail,String userName,String userPassword) {
        if("".equals(userEmail)||"".equals(userName)||"".equals(userPassword)){
            return false;
        } else {
                //插入
                User user=new User();
                user.setUserName(userName);
                user.setUserAccount(new BigDecimal(0));
                user.setUserCredit(80);
                user.setUserEmail(userEmail);
                user.setUserCash(0);
                user.setUserPassword(EncoderUtil.EncoderByMd5(userPassword));
                userDao.insertUser(user);
                return true;

        }
    }

    @Override
    public List<User> getAllUser() {
        return userDao.selectAllUser();
    }

    @Override
    public boolean removeUser(String useremail) {
        if ("".equals(useremail)) {
            return false;
        } else {
            userDao.deleteUser(useremail);
            return true;
        }
    }

    @Override
    public List<User> getUserByNameLike(String username) {
        return userDao.selectUserByUserNameLike(username);
    }

    @Override
    public boolean editUser(User user) {
        if (user==null) {
            return false;
        }else{
            User user1 = userDao.selectUserById(user.getUserEmail());
            /**
             * 必须修改密码,否则你不改的话,密码其实本身也是被修改了的,被再次MD5加密了
             */
            if (user.getUserPassword().equals(user1.getUserPassword())) {
                return false;
            }
            user1.setUserName(user.getUserName());
            user1.setUserPassword(EncoderUtil.EncoderByMd5(user.getUserPassword()));
            user1.setUserAccount(user.getUserAccount());
            user1.setUserCash(user.getUserCash());
            user1.setUserCredit(user.getUserCredit());
            userDao.updateUser(user1);
            return true;
        }
    }

    @Override
    public Integer getUserCount() {
        return userDao.selectUserCount();
    }

    @Override
    public void resetCredit(String useremail) {
        User user=userDao.selectUserById(useremail);
        user.setUserCredit(80);
        userDao.updateUser(user);
    }

    @Override
    public void changeCashOne(String useremail) {
        User user=userDao.selectUserById(useremail);
        user.setUserCash(199);
        user.setUserAccount((user.getUserAccount().subtract(new BigDecimal(199))));
        userDao.updateUser(user);
    }

    @Override
    public void changeCashTwo(String useremail) {
        User user=userDao.selectUserById(useremail);
        user.setUserCash(0);
        user.setUserAccount(user.getUserAccount().add(new BigDecimal(199)));
        userDao.updateUser(user);
    }

    @Override
    public boolean editUserAccouunt(User user) {
        if (user==null) {
            return false;
        }else{
            User user1 = userDao.selectUserById(user.getUserEmail());

            user1.setUserName(user.getUserName());
            user1.setUserPassword(user.getUserPassword());
            user1.setUserAccount(user.getUserAccount());
            user1.setUserCash(user.getUserCash());
            user1.setUserCredit(user.getUserCredit());
            userDao.updateUser(user1);
            return true;
        }
    }
}
