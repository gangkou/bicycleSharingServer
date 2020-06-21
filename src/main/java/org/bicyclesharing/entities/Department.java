package org.bicyclesharing.entities;

/**
 * @author 小米饭
 * @date 2020/6/19
 * @descrition：org.bicyclesharing.entities
 **/
public class Department {
    private int depart_id;
    private String depart_name;

    public int getDepart_id() {
        return depart_id;
    }

    public void setDepart_id(int depart_id) {
        this.depart_id = depart_id;
    }

    public String getDepart_name() {
        return depart_name;
    }

    public void setDepart_name(String depart_name) {
        this.depart_name = depart_name;
    }

    public Department(int depart_id, String depart_name) {
        this.depart_id = depart_id;
        this.depart_name = depart_name;
    }

    public Department() {
    }
}
