package org.bicyclesharing.entities;

/**
 * 管理员实体类
 * @author 小米饭
 * @date 2020/6/13
 **/
public class Admin {
    //管理员id,因为是主键,设置了自增,用Integer部分功能将没法使用
    private Integer adminId;
    //管理员名
    private String adminName;
    //管理员密码
    private String adminPassword;
    //管理员邮箱
    private String adminEmail;

    public Admin() {
    }

    public Admin(String adminName, String adminPassword, String adminEmail) {
        this.adminName = adminName;
        this.adminPassword = adminPassword;
        this.adminEmail = adminEmail;
    }

    public Admin(int adminId, String adminName, String adminPassword, String adminEmail) {
        this.adminId = adminId;
        this.adminName = adminName;
        this.adminPassword = adminPassword;
        this.adminEmail = adminEmail;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword;
    }

    public String getAdminEmail() {
        return adminEmail;
    }

    public void setAdminEmail(String adminEmail) {
        this.adminEmail = adminEmail;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "adminId=" + adminId +
                ", adminName='" + adminName + '\'' +
                ", adminPassword='" + adminPassword + '\'' +
                ", adminEmail='" + adminEmail + '\'' +
                '}';
    }
}
