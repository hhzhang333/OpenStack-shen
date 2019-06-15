package cn.edu.seu.openstack.domain;

/**
 * Created by a on 2018/3/7.
 */
public class ImageInfo {
    private int id;
    private String name;
    private int hotDegree;
    private double size;
    private int replicaNumLast;
    private int replicaNumNow;
    private double transRateLast;
    private double transRateNow;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getHotDegree() {
        return hotDegree;
    }

    public void setHotDegree(int hotDegree) {
        this.hotDegree = hotDegree;
    }

    public double getSize() {
        return size;
    }

    public void setSize(double size) {
        this.size = size;
    }

    public int getReplicaNumLast() {
        return replicaNumLast;
    }

    public void setReplicaNumLast(int replicaNumLast) {
        this.replicaNumLast = replicaNumLast;
    }

    public int getReplicaNumNow() {
        return replicaNumNow;
    }

    public void setReplicaNumNow(int replicaNumNow) {
        this.replicaNumNow = replicaNumNow;
    }

    public double getTransRateLast() {
        return transRateLast;
    }

    public void setTransRateLast(double transRateLast) {
        this.transRateLast = transRateLast;
    }

    public double getTransRateNow() {
        return transRateNow;
    }

    public void setTransRateNow(double transRateNow) {
        this.transRateNow = transRateNow;
    }
}
