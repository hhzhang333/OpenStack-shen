package cn.edu.seu.openstack.domain;

/**
 * Created by a on 2018/3/7.
 */
public class VlinkInfo {
    private int id;
    private String ipAddr1;
    private String ipAddr2;
    private double bandwidthLoad;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIpAddr1() {
        return ipAddr1;
    }

    public void setIpAddr1(String ipAddr1) {
        this.ipAddr1 = ipAddr1;
    }

    public String getIpAddr2() {
        return ipAddr2;
    }

    public void setIpAddr2(String ipAddr2) {
        this.ipAddr2 = ipAddr2;
    }

    public double getBandwidthLoad() {
        return bandwidthLoad;
    }

    public void setBandwidthLoad(double bandwidthLoad) {
        this.bandwidthLoad = bandwidthLoad;
    }
}
