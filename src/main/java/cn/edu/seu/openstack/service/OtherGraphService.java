package cn.edu.seu.openstack.service;

import cn.edu.seu.openstack.base.GraphData;
import cn.edu.seu.openstack.dao.*;
import cn.edu.seu.openstack.domain.*;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

/**
 * Created by a on 2018/3/8.
 */
@Service
public class OtherGraphService {

    @Autowired
    private WholeEfficiencyGradeDao efficiencyGradeDao;

    @Autowired
    private WholeResourceUtilizationDao resourceUtilizationDao;

    @Autowired
    private WholeStorageUtilizationDao storageUtilizationDao;

    @Autowired
    private VMInfoDao vmInfoDao;

    @Autowired
    private WholeNetworkUtilizationDao networkUtilizationDao;

    private SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-mm-dd");

    DecimalFormat decimalFormat = new DecimalFormat("######0.00");

    public List<VMInfo> getVMInfoTable() {
        return vmInfoDao.selectVMInfo();
    }

    public GraphData getNetworkUtilization() {
        GraphData graphData = new GraphData();
        Gson gson = new Gson();
        graphData.setData1(gson.toJson(Double.parseDouble(decimalFormat.format(networkUtilizationDao.selectWholeNetworkUtilization().getNetworkUtilization() * 100))));
        return graphData;
    }

    public GraphData getResourceUtilization() {
        GraphData graphData = new GraphData();
        Gson gson = new Gson();
        graphData.setData1(gson.toJson(resourceUtilizationDao.selectWholeResourceUtilization().getUtilization() * 100));
        return graphData;
    }

    public GraphData getEfficiencyGrade() {
        GraphData graphData = new GraphData();
        Gson gson = new Gson();
        graphData.setData1(gson.toJson(efficiencyGradeDao.selectEfficiencyGrade().getGrade() * 100));
        return graphData;
    }

    public GraphData getStorageUtilization() {
        GraphData graphData = new GraphData();
        Gson gson = new Gson();
        graphData.setData1(gson.toJson(storageUtilizationDao.selectWholeStorageUtilization().getStorageUtilization() * 100));
        return graphData;
    }

    public GraphData getVM3dResource() {
        GraphData graphData = new GraphData();
        ArrayList<ArrayList<Double>> resources = new ArrayList<ArrayList<Double>>();
        List<VMInfo> vmInfos = vmInfoDao.selectAllVMInfo();
        double maxBandwidth = 0.0;

        for (VMInfo tmp: vmInfos) {
            if (tmp.getBandwidthDownlink() + tmp.getBandwidthUplink() > maxBandwidth)
                maxBandwidth = tmp.getBandwidthDownlink() + tmp.getBandwidthUplink();
        }

        for (VMInfo vm3DResourceUsage: vmInfos) {
            ArrayList<Double> values = new ArrayList<Double>();
            values.add((vm3DResourceUsage.getBandwidthDownlink() + vm3DResourceUsage.getBandwidthUplink()) / maxBandwidth * 100);
            values.add(vm3DResourceUsage.getCpuUtilization());
            values.add(vm3DResourceUsage.getMemUtilization());
            resources.add(values);
        }

        Gson gson = new Gson();
        graphData.setData1(gson.toJson(resources));
        return graphData;
    }
}
