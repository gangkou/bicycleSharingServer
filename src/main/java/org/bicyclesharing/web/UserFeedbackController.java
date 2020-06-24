package org.bicyclesharing.web;

import org.bicyclesharing.entities.UserFeedback;
import org.bicyclesharing.service.UserFeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

/**
 * @author 小米饭
 * @date 2020/6/13
 **/
@Controller
@RequestMapping(value = "/")
public class UserFeedbackController {
    @Autowired
    private UserFeedbackService userFeedbackService;

    /**
     * 1.列表页
     *
     * @param requestMap
     * @param page
     * @return
     */
    @RequestMapping(value = "admin-feedback-list-show", method = RequestMethod.GET)
    public String listShow(Map<String, Object> requestMap, @RequestParam("page") Integer page) {
        //映射
        requestMap.put("nav", "userFeedback-list");
        //获取列表
        ArrayList<UserFeedback> userFeedbacks = (ArrayList<UserFeedback>) userFeedbackService.getAllFeedback();
        requestMap.put("userFeedbacks", userFeedbacks);
        int pageCount = userFeedbacks.size();  //数据条数
        int pageSize = 10;  //分页条数
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
        ArrayList<UserFeedback> pageUserFeedbacks = new ArrayList<>();
        if (pageMax == 1) {
            pageUserFeedbacks.addAll(userFeedbacks);
        } else if (pagePointer == pageMax) {
            for (int i = pageSize * (pagePointer - 1); i < pageSize * (pagePointer - 1) + (pageCount % pageSize); ++i) {
                pageUserFeedbacks.add(userFeedbacks.get(i));
            }
        } else {
            for (int i = pageSize * (pagePointer - 1); i < pageSize * pagePointer; ++i) {
                pageUserFeedbacks.add(userFeedbacks.get(i));
            }
        }
        requestMap.put("pageMax", pageMax);
        requestMap.put("pagePoint", pagePointer);
        requestMap.put("pageUserFeedbacks", pageUserFeedbacks);
        return "feedback/userFeedback_list";
    }

    /**
     * 2.修改状态为已读
     * @param id
     * @return
     */
    @RequestMapping(value = "admin-userFeedback-resolved-execute/{id}", method = RequestMethod.GET)
    public String resolved(@PathVariable("id") Integer id) {
        userFeedbackService.resolved(id);
        return "redirect:/admin-feedback-list-show?page=1";
    }
    /**
     * 3.根据id删除用户反馈
     */
    @RequestMapping(value="admin-userFeedback-removeuser-execute/{feedbackId}",method=RequestMethod.GET)
    public String removeUserFeedbackExecute(@PathVariable Integer feedbackId){
        UserFeedback userFeedback=userFeedbackService.getFeedback(feedbackId);
        if (userFeedback.getFeedbackStatement()==1){
            userFeedbackService.removeFeedback(feedbackId);
        }
        return "redirect:/admin-feedback-list-show?page=1";
    }

    @RequestMapping(value = "admin-userFeedback-removeuser-execute",method = RequestMethod.POST)
    public String addUserFeedbackExecute(UserFeedback feedback, HttpSession session){
        feedback.setFeedbackTime(new Date());
        feedback.setFeedbackStatement(0);
        boolean flag=userFeedbackService.addFeedback(feedback);
        if(flag){
            session.setAttribute("feedbackresult","我们已接受到您的反馈意见,十分感谢!");
            return "/index/index_mtla";
        }else {
            session.setAttribute("feedbackresult","提交失败,请重试!");
            return "/index/index_mtla";
        }

    }
}
