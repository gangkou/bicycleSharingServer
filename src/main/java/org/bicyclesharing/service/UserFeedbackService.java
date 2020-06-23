package org.bicyclesharing.service;

import org.bicyclesharing.entities.UserFeedback;

import java.util.List;

/**
 * 用户反馈相关逻辑接口
 * @author 小米饭
 * @date 2020/6/13
 **/
public interface UserFeedbackService {
    /**
     * 1.添加反馈
     */
    boolean addFeedback(UserFeedback userFeedback);
    /**
     * 2.获取反馈(id,车id,用户id)
     */
    UserFeedback getFeedback(Integer feedbackId);
    List<UserFeedback> getFeedbackByBicycleId(Integer bicycleId);
    List<UserFeedback> getFeedbackByUserId(String userEmail);
    List<UserFeedback> getAllFeedback();
    /**
     * 3.反馈已读(修改状态为1)
     */
    boolean resolved(Integer feedbackId);

    /**
     * 4.删除用户反馈
     */
    boolean removeFeedback(Integer feedbackId);
}
