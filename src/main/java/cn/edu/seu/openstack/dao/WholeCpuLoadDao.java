package cn.edu.seu.openstack.dao;

import cn.edu.seu.openstack.domain.WholeCpuLoad;

import java.util.List;

/**
 * Created by a on 2018/3/7.
 */
public interface WholeCpuLoadDao {
    public List<WholeCpuLoad> selectCpuLoad();
}
