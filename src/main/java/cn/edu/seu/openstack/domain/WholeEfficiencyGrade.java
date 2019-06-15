package cn.edu.seu.openstack.domain;

import java.util.Date;

/**
 * Created by a on 2018/3/7.
 */
public class WholeEfficiencyGrade {
    private int id;
    private double grade;
    private Date time;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getGrade() {
        return grade;
    }

    public void setGrade(double grade) {
        this.grade = grade;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
