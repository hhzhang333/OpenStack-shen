package cn.edu.seu.openstack.domain;

import java.util.Date;

/**
 * Created by a on 2018/3/7.
 */
public class WholeNetworkLoad {
    private int Id;
    private double bandwidth_uplink;
    private double bandwidth_downlink;
    private Date time;

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public double getBandwidth_uplink() {
        return bandwidth_uplink;
    }

    public void setBandwidth_uplink(double bandwidth_uplink) {
        this.bandwidth_uplink = bandwidth_uplink;
    }

    public double getBandwidth_downlink() {
        return bandwidth_downlink;
    }

    public void setBandwidth_downlink(double bandwidth_downlink) {
        this.bandwidth_downlink = bandwidth_downlink;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
