package org.bicyclesharing.web;


import org.bicyclesharing.entities.Admin;
import org.bicyclesharing.entities.Borrow;
import org.bicyclesharing.entities.Recharge;
import org.bicyclesharing.entities.User;
import org.bicyclesharing.service.BorrowService;
import org.bicyclesharing.service.RechargeService;
import org.bicyclesharing.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.mail.Session;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 用户相关
 * @author 小米饭
 * @date 2020/6/13
 **/
@Controller
@RequestMapping(value = "/")
public class UserApi {
    @Autowired
    private UserService userService;
    @Autowired
    private BorrowService borrowService;
    @Autowired
    private RechargeService rechargeService;

    /**
     * 1.用户登录接口
     *
     * @param userEmail
     * @param userPassword
     * @param session
     * @return
     */

    @RequestMapping(value = "api-user-login")
    public String login(Map<String, Object> requestMap, HttpSession session,
                      @RequestParam("userEmail") String userEmail, @RequestParam("userPassword") String userPassword) {
        boolean loginSuccess = userService.login(userEmail, userPassword);
        if (loginSuccess) {
            boolean b1 = true;
            ServletContext apl = session.getServletContext();

            Map<String, Object> ln = (Map<String, Object>) apl.getAttribute("ln");
            if (ln == null) {
                ln = new HashMap<String, Object>();
            }
            for (String str : ln.keySet()) {
                if (userEmail.equals(str)) {
                    if (session.getId().equals(ln.get(str))) {
                        String ss = userEmail + "  在同一地点（同一浏览器）重复登录";
                        session.setAttribute("ss", ss);
                        b1 = false;
                    } else {
                        String ss = userEmail + "  正在尝试异地登录（另一浏览器），请先退出登录";
                        session.setAttribute("ss", ss);
                        b1 = false;
                    }
                }
            }

            ln.put(userEmail, session.getId());
            apl.setAttribute("ln", ln);

            if(b1!=true) {
                return "redirect:/user_login";
            }else {
                User user = userService.getUserByEmail(userEmail);
                requestMap.put("user", user);
                session.setAttribute("user", user);
                return "redirect:/user_show";
            }

        }else {
            String ss=userEmail+"账号或密码错误";
            session.setAttribute("ss",ss);
            return "redirect:/user_login";
        }
    }


    /**
     * 2.用户注册接口
     * @return
     */
    @RequestMapping(value = "api-user-register")
    public String register(@RequestParam("userEmail") String userEmail,@RequestParam("userPassword") String userPassword,@RequestParam("userName") String userName,@RequestParam("idcode") String idcode,HttpSession session) {
        if(session.getAttribute("idcode")==null){
            session.setAttribute("idcodeMsg", "请获取正确的验证码!");
            return "user/user_register";}

        if(userEmail!=null) {
            if (userService.getUserByEmail(userEmail) != null) {
                //邮箱已注册
                session.setAttribute("registerresult", "用户已存在");
                return "user/user_register";
            } else if (!session.getAttribute("idcode").equals(idcode)) {
                session.setAttribute("idcodeMsg", "验证码错误!");
                return "user/user_register";
            }
            boolean registerSuccess = userService.register(userEmail, userName, userPassword);
            if (registerSuccess) {
                session.setAttribute("registerresult", "注册成功,尝试登录吧!");
                return "user/user_login";
            }
            else {
                session.setAttribute("registerresult", "注册失败请重试!");
                return "user/user_register";
            }
        }else {
            session.setAttribute("registerresult", "注册失败请重试!");
                return "user/user_register";
        }
    }

    /**
     * 3.退出登录接口
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "api-user-exit")
    @ResponseBody
    public String exit(HttpSession session) {
        session.removeAttribute("user");
        return "1";
    }

    /**
     * 4.用户租借记录api
     *
     * @param userEmail
     * @return
     */
    @RequestMapping(value = "api-user-queryBorrow/{userEmail}")
    @ResponseBody
    public ArrayList<Borrow> getBorrowByUserId(@PathVariable("userEmail") String userEmail) {
        User user = userService.getUserByEmail(userEmail);
        ArrayList<Borrow> borrows = (ArrayList<Borrow>) borrowService.getBorrowByUserId(user.getUserEmail());
        return borrows;
    }

    /**
     * 6.用户查询充值记录api
     *
     * @param userEmail
     * @return
     */
    @RequestMapping(value = "api-user-queryRecharge/{userEmail}")
    @ResponseBody
    public ArrayList<Recharge> getRechargeByUserId(@PathVariable("userEmail") String userEmail) {
        User user = userService.getUserByEmail(userEmail);
        if (user == null) {
            return null;
        } else {
            ArrayList<Recharge> recharges = (ArrayList<Recharge>) rechargeService.getRechargeByUserId(user.getUserEmail());
            return recharges;
        }

    }

    /**
     * 7.用户充值api,修改余额和充值记录
     */
    @RequestMapping(value = "api-user-recharge")

    public String Recharge(HttpServletRequest request) {
        String userEmail=request.getParameter("userEmail");
        BigDecimal rechargeAmount=new BigDecimal(Integer.parseInt(request.getParameter("rechargeAmount")));
        User user = userService.getUserByEmail(userEmail);
        if (user == null) {
            request.getSession().setAttribute("usernotlogin","您还没有登陆,请登录后尝试!");
            return "user/user_login";
        } else {
            //修改用户余额
            user.setUserAccount(user.getUserAccount().add(rechargeAmount));
            user.setUserCredit(user.getUserCredit()+(rechargeAmount.divide(new BigDecimal("10")).intValue()));
            userService.editUserAccouunt(user);
            //记录充值记录
            rechargeService.addRecharge(user.getUserEmail(), rechargeAmount, user.getUserAccount(), new Date());
            String rechargeresult="充值金额为"+rechargeAmount+"  已充值成功";
            request.getSession().setAttribute("rechargeresult",rechargeresult);
            String view="redirect:/flush-user?userEmail="+userEmail;
            return view;
        }
    }

    /**
     * 8.用户信息api
     */
    @RequestMapping(value = "api-user-userInfo/{userEmail}")
    @ResponseBody
    public User getUserInfo(@PathVariable("{userEmail}") String useremail,HttpSession session) {
        session.setAttribute("user",userService.getUserByEmail(useremail));
        return userService.getUserByEmail(useremail);
    }

    /**
     * 9.查看用户押金
     */
    @RequestMapping(value = "api-user-UserCash")
    public String getUserCash(HttpSession session) {
        User usersession=(User) session.getAttribute("user");
        if (usersession == null) {
            return "0";
        } else {
            if (usersession.getUserCash() == 0) {
                String view="redirect:/api-user-submitUserCash?userEmail="+usersession.getUserEmail();
                return view;
            } else {
                String view="redirect:/api-user-returnUserCash?userEmail="+usersession.getUserEmail();
                return view;
            }
        }
    }

    /**
     * 10.用户提交押金
     */
    @RequestMapping(value = "api-user-submitUserCash")
    public String submitUserCash(HttpServletRequest request,HttpSession session) {
        String useremail=request.getParameter("userEmail");
        User user = userService.getUserByEmail(useremail);
        if (user.getUserAccount().compareTo(new BigDecimal(199)) == -1) {
            session.setAttribute("changeCash","您的余额不足以支付押金199元 \n请充值后尝试!");
           String view="redirect:/user_recharge";
           return  view;

        } else {
            userService.changeCashOne(user.getUserEmail());
            session.setAttribute("changeCash","已从余额中扣除199元 \n成功支付押金");
            String view="redirect:/flush-user?userEmail="+useremail;
            return view;
        }
    }


    /**
     * 11.用户退押金
     */
    @RequestMapping(value = "api-user-returnUserCash")
    public String returnUserCash(HttpServletRequest request) {
        String useremail=request.getParameter("userEmail");
        userService.changeCashTwo(useremail);
        request.getSession().setAttribute("changeCash","已将押金退回至余额 \n请查收!");
        String view="redirect:/flush-user?userEmail="+useremail;
        return view;
    }

    @RequestMapping("user_login")
    public String userLogin(){
        return "user/user_login";
    }

    @RequestMapping("user_show")
    public String userShow(){
        return "user/user_show";
    }

    @RequestMapping("user_register")
    public String userRegister(HttpServletRequest request,Map<String,Object> map) {
        String mail=request.getParameter("mail");
        String name=request.getParameter("name");
        String password=request.getParameter("password");

        map.put("mail",mail);
        map.put("name",name);
        map.put("password",password);
        return "user/user_register";
    }

    @RequestMapping("user_register_reg")
    public String userRegisterreg(HttpServletRequest request,Map<String,Object> map) throws UnsupportedEncodingException {
        String mail=request.getParameter("mail");
        String name=request.getParameter("name");
        String password=request.getParameter("password");
        name=java.net.URLDecoder.decode(name,"utf-8");
        map.put("mail",mail);
        map.put("name",name);
        map.put("password",password);
        return "user/user_register";
    }
    //骑行导航
    @RequestMapping("user_riding")
    public String userRiding(){
        return "user/user_riding";
    }

    //忘记密码 输入邮箱
    @RequestMapping("user_forgot")
    public String forgotemail(){
        return "user/user_forgot";
    }
    //输入验证码
    @RequestMapping("user_forgotcode")
    public String forgotcode(){
        return "user/user_forgotcode";
    }
    //验证验证码
    @RequestMapping("user_forgotcodejuge")
    public String forgotcodejuge(@RequestParam("code") String code,HttpSession session){
       if(!session.getAttribute("idcode").equals(code)){
           session.setAttribute("forgotcode","请获取正确的验证码!");
           return "user/user_forgot";
       }else {
          return "user/user_forgotpassword";
       }
    }
    //输入新密码
    @RequestMapping("user_forgotpassword")
    public String forgotpassword(){
        return "user/user_forgotpassword";
    }

    /**
     * 用户忘记密码
     * @return
     */
    @RequestMapping(value = "api-user-forget")
    public String register(@RequestParam("userPassword") String userPassword,HttpSession session) {
        String userEmail = (String) session.getAttribute("forgotuseremail");
        if (userEmail != null) {
            User user = userService.getUserByEmail(userEmail);
            user.setUserPassword(userPassword);
            userService.editUser(user);
            session.setAttribute("forgotresult", "密码已修改,请登录重试!");
            return "user/user_login";
        }
        return "user/user_forgot";
    }
}