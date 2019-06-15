package cn.edu.seu.openstack.service;

import cn.edu.seu.openstack.dao.VMInfoDao;
import cn.edu.seu.openstack.domain.VMInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by a on 2018/3/8.
 */
@Service
public class VMInfoService {

    @Autowired
    private VMInfoDao vmInfoDao;

    public List<VMInfo> getVMInfoTable() {
        return vmInfoDao.selectVMInfo();
    }
}
