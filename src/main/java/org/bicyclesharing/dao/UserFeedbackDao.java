package org.bicyclesharing.dao;

import org.bicyclesharing.entities.UserFeedback;

import java.util.List;

/**
 * @author 小米饭
 * @date 2020/6/13
 **/
public interface UserFeedbackDao {
    /**
     * 1.添加用户反馈
     * @param userFeedback
     * @return
     */
    boolean insertUserFeedback(UserFeedback userFeedback);

    /**
     * 2.删除用户反馈
     * @param userFeedbackId
     * @return
     */
    boolean deleteUserFeedbackById(Integer userFeedbackId);

    /**
     * 3.修改用户反馈
     * @param userFeedback
     * @return
     */
    boolean updateUserFeedback(UserFeedback userFeedback);

    /**
     * 4.查询用户反馈
     * @param userFeedbackId
     * @return
     */
    UserFeedback selectUserFeedbackById(Integer userFeedbackId);
    List<UserFeedback> selectUserFeedbackByUserId(String userEmail);
    List<UserFeedback> selectUserFeedbackByBicycleId(Integer bicycleId);
    List<UserFeedback> selectAllUserFeedback();
}
