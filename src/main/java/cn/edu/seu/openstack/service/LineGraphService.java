package cn.edu.seu.openstack.service;

import cn.edu.seu.openstack.base.GraphData;
import cn.edu.seu.openstack.dao.PhysicalMachineInfoDao;
import cn.edu.seu.openstack.dao.VMDynamicDao;
import cn.edu.seu.openstack.dao.WholeCpuLoadDao;
import cn.edu.seu.openstack.dao.WholeNetworkLoadDao;
import cn.edu.seu.openstack.domain.PhysicalMachineInfo;
import cn.edu.seu.openstack.domain.VMDynamic;
import cn.edu.seu.openstack.domain.WholeCpuLoad;
import cn.edu.seu.openstack.domain.WholeNetworkLoad;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Array;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by a on 2018/3/8.
 */
@Service
public class LineGraphService {

    @Autowired
    private PhysicalMachineInfoDao physicalMachineInfoDao;

    @Autowired
    private WholeCpuLoadDao wholeCpuLoadDao;

    @Autowired
    private WholeNetworkLoadDao networkLoadDao;

    @Autowired
    private VMDynamicDao vmDynamicDao;

    private SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

    public GraphData getCpuLoad() {
        GraphData graphData = new GraphData();
        List<WholeCpuLoad> cpuLoads = wholeCpuLoadDao.selectCpuLoad();
        ArrayList<Object> categories = new ArrayList<Object>();
        ArrayList<Object> values = new ArrayList<Object>();
        for (WholeCpuLoad cpuLoad: cpuLoads) {
            categories.add(cpuLoad.getTime().toString());
            values.add(cpuLoad.getCpu_load());
        }
        Gson gson = new Gson();
        graphData.setCategory(gson.toJson(categories.toArray()));
        graphData.setData1(gson.toJson(values.toArray()));
        return graphData;
    }

    public GraphData getNetworkLoad() {
        GraphData graphData = new GraphData();
        List<WholeNetworkLoad> networkLoads = networkLoadDao.selectNetworkLoad();
        ArrayList<Object> categories = new ArrayList<Object>();
        ArrayList<Object> downLink = new ArrayList<Object>();
        ArrayList<Object> upLink = new ArrayList<Object>();
        for (WholeNetworkLoad networkLoad: networkLoads) {
            categories.add(simpleDateFormat.format(networkLoad.getTime()));
            downLink.add(networkLoad.getBandwidth_downlink());
            upLink.add(networkLoad.getBandwidth_uplink());
        }
        Gson gson = new Gson();
        graphData.setCategory(gson.toJson(categories));
        graphData.setData1(gson.toJson(downLink.toArray()));
        graphData.setData2(gson.toJson(upLink.toArray()));
        return graphData;
    }


    public GraphData getStatisticsOfPhysicalMachine() {
        GraphData graphData = new GraphData();
        List<PhysicalMachineInfo> machineInfos = physicalMachineInfoDao.selectAllPhysicalMachineInfo();
        ArrayList<Integer> statistics = new ArrayList<Integer>();
        for (int i = 0; i < 4; i++) {
            statistics.add(0);
        }

        for (PhysicalMachineInfo machineInfo: machineInfos) {
            if (machineInfo.getStatus() == 0)
                statistics.set(0, statistics.get(0) + 1);
            if (machineInfo.getStatus() == 1)
                statistics.set(1, statistics.get(1) + 1);
            if (machineInfo.getStatus() == 2)
                statistics.set(2, statistics.get(2) + 1);
            if (machineInfo.getStatus() == 3)
                statistics.set(3, statistics.get(3) + 1);
        }
        Gson gson = new Gson();
        graphData.setData1(gson.toJson(statistics));
        return graphData;
    }

    public GraphData getVMCpuLoading() {
        GraphData graphData = new GraphData();
        ArrayList<Object> category = new ArrayList<Object>();
        ArrayList<Object> series = new ArrayList<Object>();

        VMDynamic[] vmDynamics = vmDynamicDao.selectVMDynamic();
        for (VMDynamic dynamic: vmDynamics) {
            category.add(simpleDateFormat.format(dynamic.getTime()));
            series.add(dynamic.getCpuUtilization());
        }

        Gson gson = new Gson();
        graphData.setCategory(gson.toJson(category));
        graphData.setData1(gson.toJson(series));
        return graphData;
    }

    public String getMostRecentCPULoading(int count) {
        VMDynamic[] vmDynamic = vmDynamicDao.selectMostRecentVMCount(count);
        ArrayList<Object> arrayList = new ArrayList<Object>();
        for (int i = 0; i < vmDynamic.length; i++) {
            arrayList.add(vmDynamic[i].getCpuUtilization());
        }
        Gson gson = new Gson();
        return gson.toJson(arrayList);
    }

    public GraphData getVMMemLoading() {
        GraphData graphData = new GraphData();
        ArrayList<Object> category = new ArrayList<Object>();
        ArrayList<Object> series = new ArrayList<Object>();

        VMDynamic[] vmDynamics = vmDynamicDao.selectVMDynamic();
        for (VMDynamic dynamic: vmDynamics) {
            category.add(simpleDateFormat.format(dynamic.getTime()));
            series.add(dynamic.getMemUtilization());
        }

        Gson gson = new Gson();
        graphData.setCategory(gson.toJson(category));
        graphData.setData1(gson.toJson(series));
        return graphData;
    }

    public String getMostRecentMemLoading(int count) {
        VMDynamic[] vmDynamics = vmDynamicDao.selectMostRecentVMCount(count);
        ArrayList<Object> list = new ArrayList<Object>();
        for (VMDynamic vm: vmDynamics) {
            list.add(vm.getMemUtilization());
        }
        return new Gson().toJson(list);
    }

    public GraphData getVMNetworkLoading() {
        GraphData graphData = new GraphData();
        ArrayList<Object> category = new ArrayList<Object>();
        ArrayList<Object> series = new ArrayList<Object>();

        VMDynamic[] vmDynamics = vmDynamicDao.selectVMDynamic();
        for (VMDynamic dynamic: vmDynamics) {
            category.add(simpleDateFormat.format(dynamic.getTime()));
            series.add(dynamic.getBandwidthDownlink() + dynamic.getBandwidthUplink());
        }
        Gson gson = new Gson();
        graphData.setCategory(gson.toJson(category));
        graphData.setData1(gson.toJson(series));
        return graphData;
    }

}
