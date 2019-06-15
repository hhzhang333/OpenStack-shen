package cn.edu.seu.openstack.dao;

import cn.edu.seu.openstack.domain.PhysicalMachineTemperature;
import org.apache.ibatis.annotations.Param;

/**
 * Created by a on 2018/3/7.
 */
public interface PhysicalMachineTemperatureDao {
    public PhysicalMachineTemperature[] selectPhysicalMachineTemperature(@Param("ipAddr") String ipAddr);
}
