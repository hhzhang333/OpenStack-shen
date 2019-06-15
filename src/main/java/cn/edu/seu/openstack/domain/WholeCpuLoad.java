package cn.edu.seu.openstack.domain;

import java.util.Date;

/**
 * Created by a on 2018/3/7.
 */
public class WholeCpuLoad {
    private int id;
    private double cpu_load;
    private Date time;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getCpu_load() {
        return cpu_load;
    }

    public void setCpu_load(double cpu_load) {
        this.cpu_load = cpu_load;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
