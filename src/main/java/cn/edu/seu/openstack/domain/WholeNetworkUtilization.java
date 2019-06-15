package cn.edu.seu.openstack.domain;

import java.util.Date;

/**
 * Created by a on 2018/3/7.
 */
public class WholeNetworkUtilization {
    private int id;
    private double networkUtilization;
    private Date time;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getNetworkUtilization() {
        return networkUtilization;
    }

    public void setNetworkUtilization(double networkUtilization) {
        this.networkUtilization = networkUtilization;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
