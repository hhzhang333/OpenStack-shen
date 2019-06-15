package cn.edu.seu.openstack.service;

import cn.edu.seu.openstack.base.GraphData;
import cn.edu.seu.openstack.dao.VlinkInfoDao;
import cn.edu.seu.openstack.domain.VlinkInfo;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by a on 2018/3/8.
 */
@Service
public class D3GraphService {
    @Autowired
    private VlinkInfoDao vlinkInfoDao;

    public GraphData getD3Graph() {
        List<VlinkInfo> vlinkInfos = vlinkInfoDao.selectVlinkInfo();

        HashMap<String, Integer> ipCount = new HashMap<String, Integer>();
        int count = 0;
        for (VlinkInfo info: vlinkInfos) {
            if (!ipCount.containsKey(info.getIpAddr1())) {
                ipCount.put(info.getIpAddr1(), count);
                count++;
            }
            if (!ipCount.containsKey(info.getIpAddr2())) {
                ipCount.put(info.getIpAddr2(), count);
                count++;
            }
        }

        ArrayList<String> sortedLabels = new ArrayList<String>();
        HashMap<Integer, String> revert = new HashMap<Integer, String>();
        for (String key: ipCount.keySet()) {
            revert.put(ipCount.get(key), key);
        }
        for (int i = 0; i < ipCount.size(); i++) {
            sortedLabels.add(i, revert.get(i));
        }

        ArrayList<HashMap<String, String>> outputLabels = new ArrayList<HashMap<String, String>>();
        for (String ip: sortedLabels) {
            HashMap<String, String> outputLebel = new HashMap<String, String>();
            outputLebel.put("label", ip);
            outputLabels.add(outputLebel);
        }


//        for (String ip: ipCount.keySet())

        ArrayList<HashMap<String, Integer>> link = new ArrayList<HashMap<String, Integer>>();
        for (VlinkInfo info: vlinkInfos) {
            HashMap<String, Integer> map = new HashMap<String, Integer>();
            int source = ipCount.get(info.getIpAddr1());
            int dest = ipCount.get(info.getIpAddr2());
            int flow = (int)info.getBandwidthLoad();
            map.put("source", source);
            map.put("target", dest);
            map.put("weight", 1);
            map.put("flow", flow);
            link.add(map);
        }

        GraphData graphData = new GraphData();
        Gson gson = new Gson();
        graphData.setCategory(gson.toJson(outputLabels));
        graphData.setData1(gson.toJson(link));
        return graphData;
    }
}
