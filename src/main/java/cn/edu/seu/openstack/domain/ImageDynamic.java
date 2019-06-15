package cn.edu.seu.openstack.domain;

import java.util.Date;

/**
 * Created by a on 2018/3/7.
 */
public class ImageDynamic {
    private int id;
    private double replicaFactorMax;
    private double replicaFactorAvg;
    private double hotImageTransRate;
    private double coldImageTransRate;
    private Date time;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getReplicaFactorMax() {
        return replicaFactorMax;
    }

    public void setReplicaFactorMax(double replicaFactorMax) {
        this.replicaFactorMax = replicaFactorMax;
    }

    public double getReplicaFactorAvg() {
        return replicaFactorAvg;
    }

    public void setReplicaFactorAvg(double replicaFactorAvg) {
        this.replicaFactorAvg = replicaFactorAvg;
    }

    public double getHotImageTransRate() {
        return hotImageTransRate;
    }

    public void setHotImageTransRate(double hotImageTransRate) {
        this.hotImageTransRate = hotImageTransRate;
    }

    public double getColdImageTransRate() {
        return coldImageTransRate;
    }

    public void setColdImageTransRate(double coldImageTransRate) {
        this.coldImageTransRate = coldImageTransRate;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
