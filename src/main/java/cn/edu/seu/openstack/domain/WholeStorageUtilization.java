package cn.edu.seu.openstack.domain;

import java.util.Date;

/**
 * Created by a on 2018/3/7.
 */
public class WholeStorageUtilization {
    private int id;
    private double storageUtilization;
    private Date time;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getStorageUtilization() {
        return storageUtilization;
    }

    public void setStorageUtilization(double storageUtilization) {
        this.storageUtilization = storageUtilization;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
