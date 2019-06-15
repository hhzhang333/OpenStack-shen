package cn.edu.seu.openstack.domain;

import java.util.Date;

/**
 * Created by a on 2018/3/7.
 */
public class VMInfo {
    private int id;
    private String name;
    private Date startTime;
    private double cpuUtilization;
    private double memUtilization;
    private double bandwidthUplink;
    private double bandwidthDownlink;
    private double avgCpuUtilization;
    private double avgMemUtilization;
    private double avgBandwidthuplink;
    private double avgBandwidthDownlink;
    private String ipAddr;
    private String vmId;

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

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public double getCpuUtilization() {
        return cpuUtilization;
    }

    public void setCpuUtilization(double cpuUtilization) {
        this.cpuUtilization = cpuUtilization;
    }

    public double getMemUtilization() {
        return memUtilization;
    }

    public void setMemUtilization(double memUtilization) {
        this.memUtilization = memUtilization;
    }

    public double getBandwidthUplink() {
        return bandwidthUplink;
    }

    public void setBandwidthUplink(double bandwidthUplink) {
        this.bandwidthUplink = bandwidthUplink;
    }

    public double getBandwidthDownlink() {
        return bandwidthDownlink;
    }

    public void setBandwidthDownlink(double bandwidthDownlink) {
        this.bandwidthDownlink = bandwidthDownlink;
    }

    public double getAvgCpuUtilization() {
        return avgCpuUtilization;
    }

    public void setAvgCpuUtilization(double avgCpuUtilization) {
        this.avgCpuUtilization = avgCpuUtilization;
    }

    public double getAvgMemUtilization() {
        return avgMemUtilization;
    }

    public void setAvgMemUtilization(double avgMemUtilization) {
        this.avgMemUtilization = avgMemUtilization;
    }

    public double getAvgBandwidthuplink() {
        return avgBandwidthuplink;
    }

    public void setAvgBandwidthuplink(double avgBandwidthuplink) {
        this.avgBandwidthuplink = avgBandwidthuplink;
    }

    public double getAvgBandwidthDownlink() {
        return avgBandwidthDownlink;
    }

    public void setAvgBandwidthDownlink(double avgBandwidthDownlink) {
        this.avgBandwidthDownlink = avgBandwidthDownlink;
    }

    public String getIpAddr() {
        return ipAddr;
    }

    public void setIpAddr(String ipAddr) {
        this.ipAddr = ipAddr;
    }

    public String getVmId() {
        return vmId;
    }

    public void setVmId(String vmId) {
        this.vmId = vmId;
    }
}
