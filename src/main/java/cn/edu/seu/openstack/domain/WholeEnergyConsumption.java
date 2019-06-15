package cn.edu.seu.openstack.domain;

import java.util.Date;

/**
 * Created by a on 2018/3/7.
 */
public class WholeEnergyConsumption {
    private int id;
    private double energySum;
    private double energyCpu;
    private double energyMem;
    private double energyNet;
    private double energyDisk;
    private double energyCooling;
    private Date time;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getEnergySum() {
        return energySum;
    }

    public void setEnergySum(double energySum) {
        this.energySum = energySum;
    }

    public double getEnergyCpu() {
        return energyCpu;
    }

    public void setEnergyCpu(double energyCpu) {
        this.energyCpu = energyCpu;
    }

    public double getEnergyMem() {
        return energyMem;
    }

    public void setEnergyMem(double energyMem) {
        this.energyMem = energyMem;
    }

    public double getEnergyNet() {
        return energyNet;
    }

    public void setEnergyNet(double energyNet) {
        this.energyNet = energyNet;
    }

    public double getEnergyDisk() {
        return energyDisk;
    }

    public void setEnergyDisk(double energyDisk) {
        this.energyDisk = energyDisk;
    }

    public double getEnergyCooling() {
        return energyCooling;
    }

    public void setEnergyCooling(double energyCooling) {
        this.energyCooling = energyCooling;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
