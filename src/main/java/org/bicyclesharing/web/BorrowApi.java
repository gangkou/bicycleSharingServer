package org.bicyclesharing.web;


import org.bicyclesharing.entities.Bicycle;
import org.bicyclesharing.entities.Borrow;
import org.bicyclesharing.entities.User;
import org.bicyclesharing.service.BicycleService;
import org.bicyclesharing.service.BorrowService;
import org.bicyclesharing.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;

/**
 * 接车相关api
 * @author 小米饭
 * @date 2020/6/13
 **/
@Controller
@RequestMapping(value = "/")
public class BorrowApi {
    @Autowired
    BorrowService borrowService;
    @Autowired
    UserService userService;
    @Autowired
    BicycleService bicycleService;

     @RequestMapping("judge-borrow-or-return")
     public String judgeBicycle(HttpServletRequest request){
         User user=(User) request.getSession().getAttribute("user");
         String useremail=user.getUserEmail();
         int bicycleId=Integer.parseInt( request.getParameter("bicycleId"));
         Bicycle bicycle=bicycleService.getBicycleById(bicycleId);
         if(request.getSession().getAttribute("bicyclestart")==null||request.getSession().getAttribute("bicyclestart").equals("")){
             String view="redirect:/api-borrow-returnBicycle/"+bicycleId+"/"+useremail+"/"+113.824262+"/"+34.022008+"/"+2;
             return view;
         }else {
         if(bicycle.getBicycleStatement()==1){
             String view="redirect:/api-borrow-borrowBicycle/"+bicycleId+"/"+useremail;
             return view;
         }else if (bicycle.getBicycleStatement()==0){
             String view="redirect:/api-borrow-returnBicycle/"+bicycleId+"/"+useremail+"/"+113.824262+"/"+34.022008+"/"+2;
             return view;
         }else {
             return "redirect:/user_show";
         }
     }
     }
    /**
     * 1.借车开始api,修改单车状况
     */
    @RequestMapping(value = "api-borrow-borrowBicycle/{bicycleId}/{useremail}")
    public String borrowBicycle(@PathVariable("bicycleId") Integer bicycleId, @PathVariable("useremail") String useremail,HttpSession session) {
        User user = userService.getUserByEmail(useremail+".com");
        Bicycle bicycle = bicycleService.getBicycleById(bicycleId);
        if (user == null || bicycle == null) {
            //-1表示找不到该车或者该用户不存在
            return "-1";
        } else {
            if (bicycle.getBicycleStatement() == 1 || bicycle.getBicycleStatement() == -1) {
                if (user.getUserCash() == 199) {
                    //添加借车记录(车id,用户名,当前时间,开始地址)
                    borrowService.addBorrow(bicycleId, user.getUserEmail(), new Date(), new Date(), bicycle.getBicycleCurrentX(), bicycle.getBicycleCurrentY(), bicycle.getBicycleCurrentX(), bicycle.getBicycleCurrentY(), new BigDecimal(0), user.getUserAccount());
                    //修改单车状况
                    bicycle.setBicycleStatement(0);
                    bicycleService.editBicycyle(bicycleId, bicycle.getBicycleCurrentX(), bicycle.getBicycleCurrentY(), bicycle.getBicycleLastTime(), bicycle.getBicycleStatement());
                    session.setAttribute("bicyclestart",bicycleId);
                    return "redirect:/user_show";
                    //未交押金
                } else {return "redirect:/user_show";}
            } else {
                //该车正在使用中
                return "redirect:/user_show";
            }
        }


    }

    /**
     * 2.借车结束相关api,添加借车记录,修改用户余额,修改单车状况为1(还有地址)
     *
     * @return
     */
    @RequestMapping(value = "api-borrow-returnBicycle/{bicycleId}/{useremail}/{ex}/{ey}/{cost}")
    public String returnBicycle(@PathVariable("bicycleId") Integer bicycleId, @PathVariable("useremail") String useremail,
                                @PathVariable("ex") double ex, @PathVariable("ey") double ey,
                                @PathVariable("cost") double cost) {
        User user = userService.getUserByEmail(useremail);
        if (user == null) {
            return "-1";//用户不存在
        } else {
            if (user.getUserAccount().subtract(new BigDecimal(cost)).compareTo(new BigDecimal(0)) < 0) {
                return "0";//用户余额不足,请充值后还车
            } else { //用户的余额减少
                BigDecimal remaining = user.getUserAccount();
                user.setUserAccount(remaining.subtract(new BigDecimal(cost)));
                userService.editUserAccouunt(user);
                //完善租借记录
                borrowService.editBorrow(bicycleId, new Date(), ex, ey, new BigDecimal(cost), remaining.subtract(new BigDecimal(cost)));
                //修改车辆状况(最终归还时间地点)
                bicycleService.editBicycyle(bicycleId, ex, ey, new Date(), 1);
                String view="redirect:/flush-user?userEmail="+useremail;
                return view;
            }
        }

    }

    /**
     * 3.查询当前(最后一条)借车记录api
     */
    @RequestMapping(value = "api-borrow-currentBorrow/{useremail}")
    public Borrow currentBorrow(@PathVariable("useremail") String userName) {
        ArrayList<Borrow> borrows = (ArrayList<Borrow>) borrowService.getBorrowByUserId(userService.getUserByEmail(userName).getUserEmail());
        if (borrows.size() >= 1) {
            return borrows.get(borrows.size() - 1);
        } else {return null;}
    }
}
