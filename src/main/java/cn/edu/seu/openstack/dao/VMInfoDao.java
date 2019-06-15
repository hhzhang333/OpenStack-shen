package cn.edu.seu.openstack.dao;

import cn.edu.seu.openstack.domain.VMInfo;

import java.util.List;

/**
 * Created by a on 2018/3/7.
 */
public interface VMInfoDao {
    public List<VMInfo> selectVMInfo();

    public List<VMInfo> selectAllVMInfo();
}
