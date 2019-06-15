package cn.edu.seu.openstack.service;

import cn.edu.seu.openstack.dao.PhysicalMachineTemperatureDao;
import cn.edu.seu.openstack.domain.PhysicalMachineTemperature;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.util.ArrayList;

/**
 * Created by a on 2018/3/8.
 */
@Service
public class CandlestickGraphService {
    @Autowired
    private PhysicalMachineTemperatureDao machineTemperaturedao;

    public String getMachineTemperature(String ipAddr) {

        DecimalFormat decimalFormat = new DecimalFormat("######0.00");

        PhysicalMachineTemperature[] temperatures = machineTemperaturedao.selectPhysicalMachineTemperature(ipAddr);
        ArrayList<ArrayList<Object>> results = new ArrayList<ArrayList<Object>>();
        Gson gson = new Gson();
        for (PhysicalMachineTemperature temperature: temperatures) {
            ArrayList<Object> arrayList = new ArrayList<Object>();
            arrayList.add(temperature.getTime().getTime());
            arrayList.add(Double.parseDouble(decimalFormat.format(temperature.getT3())));
            arrayList.add(Double.parseDouble(decimalFormat.format(temperature.getT4())));
            arrayList.add(Double.parseDouble(decimalFormat.format(temperature.getT1())));
            arrayList.add(Double.parseDouble(decimalFormat.format(temperature.getT2())));

            results.add(arrayList);
        }
        return gson.toJson(results.toArray());
    }
}
