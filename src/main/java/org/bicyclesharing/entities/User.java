package org.bicyclesharing.entities;

import java.math.BigDecimal;

/**
 * 用户实体类
 * @author 小米饭
 * @date 2020/6/13
 **/
public class User {
    //用户邮箱

    private String userEmail;
    //用户名
    private String userName;
    //用户密码
    private String userPassword;
    //余额
    private BigDecimal userAccount;
    //信用度
    private Integer userCredit;
    //押金
    private Integer userCash;

    public User() {
    }

    public User(String userEmail, String userName, BigDecimal userAccount, Integer userCredit, Integer userCash) {
        this.userEmail = userEmail;
        this.userName = userName;
        this.userAccount = userAccount;
        this.userCredit = userCredit;
        this.userCash = userCash;
    }

    public User(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }



    public BigDecimal getUserAccount() {
        return userAccount;
    }

    public void setUserAccount(BigDecimal userAccount) {
        this.userAccount = userAccount;
    }

    public Integer getUserCredit() {
        return userCredit;
    }

    public void setUserCredit(Integer userCredit) {
        this.userCredit = userCredit;
    }

    public Integer getUserCash() {
        return userCash;
    }

    public void setUserCash(Integer userCash) {
        this.userCash = userCash;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    @Override
    public String toString() {
        return "User{" +
                "userEmail='" + userEmail + '\'' +
                ", userName='" + userName + '\'' +
                ", userPassword='" + userPassword + '\'' +
                ", userAccount=" + userAccount +
                ", userCredit=" + userCredit +
                ", userCash=" + userCash +
                '}';
    }
}
