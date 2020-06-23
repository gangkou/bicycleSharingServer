package org.bicyclesharing.entities;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 充值记录表
 * @author 小米饭
 * @date 2020/6/13
 **/
public class Recharge {
    private Integer rechargeId;
    private String userEmail;
    private BigDecimal rechargeAmount;
    private BigDecimal remaining;
    private Date rechargeTime;

    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Recharge() {
    }

    public Recharge(String userEmail, BigDecimal rechargeAmount, BigDecimal remaining, Date rechargeTime) {
        this.userEmail = userEmail;
        this.rechargeAmount = rechargeAmount;
        this.remaining = remaining;
        this.rechargeTime = rechargeTime;
    }

    public Recharge(Integer rechargeId, String userEmail, BigDecimal rechargeAmount, BigDecimal remaining, Date rechargeTime) {
        this.rechargeId = rechargeId;
        this.userEmail = userEmail;
        this.rechargeAmount = rechargeAmount;
        this.remaining = remaining;
        this.rechargeTime = rechargeTime;
    }

    public Integer getRechargeId() {
        return rechargeId;
    }

    public void setRechargeId(Integer rechargeId) {
        this.rechargeId = rechargeId;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public BigDecimal getRechargeAmount() {
        return rechargeAmount;
    }

    public void setRechargeAmount(BigDecimal rechargeAmount) {
        this.rechargeAmount = rechargeAmount;
    }

    public BigDecimal getRemaining() {
        return remaining;
    }

    public void setRemaining(BigDecimal remaining) {
        this.remaining = remaining;
    }

    public Date getRechargeTime() {
        return rechargeTime;
    }

    public void setRechargeTime(Date rechargeTime) {
        this.rechargeTime = rechargeTime;
    }

    @Override
    public String toString() {
        return "Recharge{" +
                "rechargeId=" + rechargeId +
                ", userEmail=" + userEmail +
                ", rechargeAmount=" + rechargeAmount +
                ", remaining=" + remaining +
                ", rechargeTime=" + rechargeTime +
                '}';
    }
}
