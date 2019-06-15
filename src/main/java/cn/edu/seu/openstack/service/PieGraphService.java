package cn.edu.seu.openstack.service;

import cn.edu.seu.openstack.base.GraphData;
import cn.edu.seu.openstack.dao.WholeEnergyConsumptionDao;
import cn.edu.seu.openstack.dao.WholeResourceUtilizationDao;
import cn.edu.seu.openstack.domain.WholeEnergyConsumption;
import cn.edu.seu.openstack.domain.WholeResourceUtilization;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by a on 2018/3/8.
 */
@Service
public class PieGraphService {

    @Autowired
    private WholeResourceUtilizationDao resourceUtilizationDao;

    @Autowired
    private WholeEnergyConsumptionDao energyConsumptionDao;

    public WholeResourceUtilization getResourceUtilization() {
        return resourceUtilizationDao.selectWholeResourceUtilization();
    }

    public GraphData getEnergyConsumptionPie() {
        List<WholeEnergyConsumption> energyConsumptions = energyConsumptionDao.selectWholeEnergyConsumption();
        if (energyConsumptions.size() == 0) {
            WholeEnergyConsumption consumption = new WholeEnergyConsumption();
            consumption.setEnergyCooling(0.0);
            consumption.setEnergyDisk(0.0);
            consumption.setEnergyCpu(0.0);
            consumption.setEnergyMem(0.0);
            consumption.setEnergyNet(0.0);
            consumption.setEnergySum(0.0);
            return reformatData(consumption);
        }
        return reformatData(energyConsumptions.get(energyConsumptions.size() - 1));
    }

    public GraphData reformatData(WholeEnergyConsumption consumption) {
        GraphData graphData = new GraphData();
        Gson gson = new Gson();
        graphData.setData1(gson.toJson(consumption.getEnergyCpu()));
        graphData.setData2(gson.toJson(consumption.getEnergyMem()));
        graphData.setData3(gson.toJson(consumption.getEnergyNet()));
        graphData.setData4(gson.toJson(consumption.getEnergyDisk()));
        graphData.setData5(gson.toJson(consumption.getEnergyCooling()));
        graphData.setData6(gson.toJson(consumption.getEnergySum()));
        return graphData;
    }

}
