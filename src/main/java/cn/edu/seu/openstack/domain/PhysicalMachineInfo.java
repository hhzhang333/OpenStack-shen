package cn.edu.seu.openstack.domain;

/**
 * Created by a on 2018/3/7.
 */
public class PhysicalMachineInfo {
    private int Id;
    private String ip_addr;
    private String type;
    private String cpu;
    private String memory;
    private String storage_device;
    private int tier;
    private int status;

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getIp_addr() {
        return ip_addr;
    }

    public void setIp_addr(String ip_addr) {
        this.ip_addr = ip_addr;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCpu() {
        return cpu;
    }

    public void setCpu(String cpu) {
        this.cpu = cpu;
    }

    public String getMemory() {
        return memory;
    }

    public void setMemory(String memory) {
        this.memory = memory;
    }

    public String getStorage_device() {
        return storage_device;
    }

    public void setStorage_device(String storage_device) {
        this.storage_device = storage_device;
    }

    public int getTier() {
        return tier;
    }

    public void setTier(int tier) {
        this.tier = tier;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
