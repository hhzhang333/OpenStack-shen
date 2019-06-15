package cn.edu.seu.openstack.service;

import cn.edu.seu.openstack.base.GraphData;
import cn.edu.seu.openstack.dao.ImageDynamicDao;
import cn.edu.seu.openstack.dao.ImageInfoDao;
import cn.edu.seu.openstack.dao.WholeEnergyConsumptionDao;
import cn.edu.seu.openstack.domain.ImageDynamic;
import cn.edu.seu.openstack.domain.ImageInfo;
import cn.edu.seu.openstack.domain.WholeEnergyConsumption;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by a on 2018/3/8.
 */
@Service
public class ColumnGraphService {
    @Autowired
    private WholeEnergyConsumptionDao energyConsumptionDao;
    @Autowired
    private ImageInfoDao imageInfoDao;
    @Autowired
    private ImageDynamicDao dynamicDao;

    private SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-mm-dd");

    public GraphData getReplicaFactor() {
        GraphData graphData = new GraphData();
        Gson gson = new Gson();
        ArrayList<Object> categories = new ArrayList<Object>();
        ArrayList<Double> replicaMax = new ArrayList<Double>();
        ArrayList<Double> replicaAvg = new ArrayList<Double>();

        ImageDynamic[] imageDynamics = dynamicDao.selectImageDynamic();
        for (ImageDynamic dynamic: imageDynamics) {
            categories.add(simpleDateFormat.format(dynamic.getTime()));
            replicaMax.add(dynamic.getReplicaFactorMax());
            replicaAvg.add(dynamic.getReplicaFactorAvg());
        }
        graphData.setCategory(gson.toJson(categories));
        graphData.setData1(gson.toJson(replicaMax));
        graphData.setData2(gson.toJson(replicaAvg));
        return graphData;
    }

    public GraphData getImageRate() {
        GraphData graphData = new GraphData();
        Gson gson = new Gson();
        ArrayList<Object> categories = new ArrayList<Object>();
        ArrayList<Double> hotRate = new ArrayList<Double>();
        ArrayList<Double> coldRate = new ArrayList<Double>();

        ImageDynamic[] imageDynamics = dynamicDao.selectImageDynamic();
        for (ImageDynamic dynamic: imageDynamics) {
            categories.add(simpleDateFormat.format(dynamic.getTime()));
            hotRate.add(dynamic.getHotImageTransRate());
            coldRate.add(dynamic.getColdImageTransRate());
        }
        graphData.setCategory(gson.toJson(categories));
        graphData.setData1(gson.toJson(hotRate));
        graphData.setData2(gson.toJson(coldRate));
        return graphData;
    }

    public GraphData getReplicaNum() {
        GraphData graphData = new GraphData();
        Gson gson = new Gson();
        ArrayList<String> categories = new ArrayList<String>();
        ArrayList<Integer> replicaNumLast = new ArrayList<Integer>();
        ArrayList<Integer> replicaNumNow = new ArrayList<Integer>();

        ImageInfo[] imageInfos = imageInfoDao.selectImageInfo();
        for (ImageInfo dynamic: imageInfos) {
            categories.add(dynamic.getName());
            replicaNumLast.add(dynamic.getReplicaNumLast());
            replicaNumNow.add(dynamic.getReplicaNumNow());
        }
        graphData.setCategory(gson.toJson(categories));
        graphData.setData1(gson.toJson(replicaNumLast));
        graphData.setData2(gson.toJson(replicaNumNow));
        return graphData;
    }

    public GraphData getTransRate() {
        GraphData graphData = new GraphData();
        Gson gson = new Gson();
        ArrayList<String> categories = new ArrayList<String>();
        ArrayList<Double> transLast = new ArrayList<Double>();
        ArrayList<Double> transNow = new ArrayList<Double>();

        ImageInfo[] imageInfos = imageInfoDao.selectImageInfo();
        for (ImageInfo dynamic: imageInfos) {
            categories.add(dynamic.getName());
            transLast.add(dynamic.getTransRateLast());
            transNow.add(dynamic.getTransRateNow());
        }
        graphData.setCategory(gson.toJson(categories));
        graphData.setData1(gson.toJson(transLast));
        graphData.setData2(gson.toJson(transNow));
        return graphData;
    }

    public ImageInfo[] getImageInfoTable() {
        return imageInfoDao.selectImageInfo();
    }

    public GraphData getEnergyConsumptionColumn() {
        GraphData graphData = new GraphData();

        ArrayList<Double> cpus = new ArrayList<Double>();
        ArrayList<Double> memorys = new ArrayList<Double>();
        ArrayList<Double> networks = new ArrayList<Double>();
        ArrayList<Double> storages = new ArrayList<Double>();
        ArrayList<Double> cooling = new ArrayList<Double>();
        ArrayList<Double> others = new ArrayList<Double>();
        ArrayList<Object> times = new ArrayList<Object>();


        List<WholeEnergyConsumption> energyConsumptions = energyConsumptionDao.selectWholeEnergyConsumption();
        int count = 0;
        if (energyConsumptions.size() > 5)
            count = 5;
        else count = energyConsumptions.size();
        for (int i = 0; i < count; i++) {
            cpus.add(energyConsumptions.get(i).getEnergyCpu());
            memorys.add(energyConsumptions.get(i).getEnergyMem());
            networks.add(energyConsumptions.get(i).getEnergyNet());
            storages.add(energyConsumptions.get(i).getEnergyDisk());
            cooling.add(energyConsumptions.get(i).getEnergyCooling());
            others.add(energyConsumptions.get(i).getEnergySum());
            times.add(simpleDateFormat.format(energyConsumptions.get(i).getTime()));
        }

        Gson gson = new Gson();

        graphData.setData1(gson.toJson(cpus));
        graphData.setData2(gson.toJson(memorys));
        graphData.setData3(gson.toJson(networks));
        graphData.setData4(gson.toJson(storages));
        graphData.setData5(gson.toJson(cooling));
        graphData.setData6(gson.toJson(others));
        graphData.setCategory(gson.toJson(times));

        return graphData;
    }
}
