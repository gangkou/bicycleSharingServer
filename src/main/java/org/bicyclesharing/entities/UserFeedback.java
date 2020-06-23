package org.bicyclesharing.entities;

import java.util.Date;

/**
 * 用户反馈实体类
 * @author 小米饭
 * @date 2020/6/13
 **/
public class UserFeedback {
    private Integer feedbackId;
    private String feedbackTitle;
    private String feedbackContent;
    private String userEmail;
    private Integer bicycleId;
    private Date feedbackTime;
    private Integer feedbackStatement;

    public UserFeedback() {
    }

    public UserFeedback(String feedbackTitle, String feedbackContent, String userEmail, Integer bicycleId, Date feedbackTime, Integer feedbackStatement) {
        this.feedbackTitle = feedbackTitle;
        this.feedbackContent = feedbackContent;
        this.userEmail = userEmail;
        this.bicycleId = bicycleId;
        this.feedbackTime = feedbackTime;
        this.feedbackStatement = feedbackStatement;
    }

    public UserFeedback(Integer feedbackId, String feedbackTitle, String feedbackContent, String userEmail, Integer bicycleId, Date feedbackTime, Integer feedbackStatement) {
        this.feedbackId = feedbackId;
        this.feedbackTitle = feedbackTitle;
        this.feedbackContent = feedbackContent;
        this.userEmail = userEmail;
        this.bicycleId = bicycleId;
        this.feedbackTime = feedbackTime;
        this.feedbackStatement = feedbackStatement;
    }

    public Integer getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(Integer feedbackId) {
        this.feedbackId = feedbackId;
    }

    public String getFeedbackTitle() {
        return feedbackTitle;
    }

    public void setFeedbackTitle(String feedbackTitle) {
        this.feedbackTitle = feedbackTitle;
    }

    public String getFeedbackContent() {
        return feedbackContent;
    }

    public void setFeedbackContent(String feedbackContent) {
        this.feedbackContent = feedbackContent;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public Integer getBicycleId() {
        return bicycleId;
    }

    public void setBicycleId(Integer bicycleId) {
        this.bicycleId = bicycleId;
    }

    public Date getFeedbackTime() {
        return feedbackTime;
    }

    public void setFeedbackTime(Date feedbackTime) {
        this.feedbackTime = feedbackTime;
    }

    public Integer getFeedbackStatement() {
        return feedbackStatement;
    }

    public void setFeedbackStatement(Integer feedbackStatement) {
        this.feedbackStatement = feedbackStatement;
    }

    @Override
    public String toString() {
        return "UserFeedback{" +
                "feedbackId=" + feedbackId +
                ", feedbackTitle='" + feedbackTitle + '\'' +
                ", feedbackContent='" + feedbackContent + '\'' +
                ", userEmail=" + userEmail +
                ", bicycleId=" + bicycleId +
                ", feedbackTime=" + feedbackTime +
                ", feedbackStatement=" + feedbackStatement +
                '}';
    }
}
