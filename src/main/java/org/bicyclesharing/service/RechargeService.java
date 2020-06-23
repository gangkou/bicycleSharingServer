package org.bicyclesharing.service;

import org.bicyclesharing.entities.Recharge;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 充值相关逻辑接口
 * @author 小米饭
 * @date 2020/6/13
 **/
public interface RechargeService {
    /**
     * 1.添加一条充值记录
     * @param userEmail
     * @param rechargeAmount
     * @param remaining
     * @param rechargeTime
     * @return
     */
    boolean addRecharge(String userEmail, BigDecimal rechargeAmount, BigDecimal remaining, Date rechargeTime);

    /**
     * 2.删除一条充值记录
     * @param id
     */
    void removeRecharge(Integer id);

    /**
     * 3.查看所有充值记录
     * @return
     */
    List<Recharge> getAllRecharge();

    /**
     * 4.通过id查询充值记录
     * @param id
     * @return
     */
    Recharge getRechargeById(Integer id);

    /**
     * 5.通过用户邮箱查询充值记录
     * @param useremail
     * @return
     */
    List<Recharge> getRechargeByUserId(String useremail);

    /**
     * 6.查询当天用户充值总额
     * @return
     */
    BigDecimal getRechargeCount();
}
