package org.bicyclesharing.entities;

/**
 * @author 小米饭
 * @date 2020/6/19
 * @descrition：org.bicyclesharing.entities
 **/
public class Emploee {
   private int emploeeid;
   private String emploeename;
   private int emploeeage;
   private String emploeesex;
   private String emploeeemail;
   private Department emploeedepartment;

    public int getEmploeeid() {
        return emploeeid;
    }

    public void setEmploeeid(int emploeeid) {
        this.emploeeid = emploeeid;
    }

    public String getEmploeename() {
        return emploeename;
    }

    public void setEmploeename(String emploeename) {
        this.emploeename = emploeename;
    }

    public int getEmploeeage() {
        return emploeeage;
    }

    public void setEmploeeage(int emploeeage) {
        this.emploeeage = emploeeage;
    }

    public String getEmploeesex() {
        return emploeesex;
    }

    public void setEmploeesex(String emploeesex) {
        this.emploeesex = emploeesex;
    }

    public String getEmploeeemail() {
        return emploeeemail;
    }

    public void setEmploeeemail(String emploeeemail) {
        this.emploeeemail = emploeeemail;
    }

    public Department getEmploeedepartment() {
        return emploeedepartment;
    }

    public void setEmploeedepartment(Department emploeedepartment) {
        this.emploeedepartment = emploeedepartment;
    }

    public Emploee(int emploeeid, String emploeename, int emploeeage, String emploeesex, String emploeeemail, Department emploeedepartment) {
        this.emploeeid = emploeeid;
        this.emploeename = emploeename;
        this.emploeeage = emploeeage;
        this.emploeesex = emploeesex;
        this.emploeeemail = emploeeemail;
        this.emploeedepartment = emploeedepartment;
    }

    public Emploee() {
    }
}
