package cn.edu.seu.openstack.dao;

import cn.edu.seu.openstack.domain.VMDynamic;
import org.apache.ibatis.annotations.Param;

/**
 * Created by a on 2018/3/7.
 */
public interface VMDynamicDao {
    public VMDynamic[] selectVMDynamic();

    public VMDynamic[] selectMostRecentVMCount(@Param(value = "count") int count);
}
