package cn.edu.seu.openstack.endpoint;

import cn.edu.seu.openstack.service.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.math.BigInteger;


/**
 * Created by a on 2018/3/8.
 */
@Controller
public class MainController {
    private final static Logger logger = LoggerFactory.getLogger(MainController.class);

    @Autowired
    private LineGraphService lineGraphService;
    @Autowired
    private PieGraphService pieGraphService;
    @Autowired
    private ColumnGraphService columnGraphService;
    @Autowired
    private CandlestickGraphService candlestickGraphService;
    @Autowired
    private OtherGraphService otherGraphService;
    @Autowired
    private VMInfoService vmInfoService;
    @Autowired
    private D3GraphService d3GraphService;


    @RequestMapping(value = "resourceResize", method = RequestMethod.GET)
    public String showResourceResize(ModelMap modelMap) {
        try {
//            PhysicalMachineInfo machineInfo = lineGraphService.getSpecificMachineInfo(ipAddr);
//            modelMap.addAttribute("machineInfo", machineInfo);

            modelMap.addAttribute("columnData", lineGraphService.getStatisticsOfPhysicalMachine());

            modelMap.addAttribute("gaugeData", otherGraphService.getResourceUtilization());

            modelMap.addAttribute("pieData", pieGraphService.getEnergyConsumptionPie());

            modelMap.addAttribute("energyColumn", columnGraphService.getEnergyConsumptionColumn());

            modelMap.addAttribute("effiencyUtilization", otherGraphService.getEfficiencyGrade());

            modelMap.addAttribute("candlestickData", candlestickGraphService.getMachineTemperature("10.128.201.10"));

            modelMap.addAttribute("cpuLoadData", lineGraphService.getCpuLoad());


            modelMap.addAttribute("networkLoadData", lineGraphService.getNetworkLoad());


            return "resourceResize.ftl";
        } catch (Exception ex) {
            logger.info("Error in mainController, error " + ex);
            return null;
        }

    }

    @RequestMapping(value = "manageTotal", method = RequestMethod.GET)
    public String showManageTotal(ModelMap modelMap) {
        try {

            modelMap.addAttribute("imageInfoTable", columnGraphService.getImageInfoTable());

            modelMap.addAttribute("replicaFactor", columnGraphService.getReplicaFactor());
            modelMap.addAttribute("imageRate", columnGraphService.getImageRate());

            modelMap.addAttribute("replicaNum", columnGraphService.getReplicaNum());
            modelMap.addAttribute("imageTrans", columnGraphService.getTransRate());

            modelMap.addAttribute("storageUti", otherGraphService.getStorageUtilization());

            return "manageTotal.ftl";
        } catch (Exception ex) {
            logger.info("Error in showManageTotal, error " + ex);
            return null;

        }
    }

    @RequestMapping(value = "totalMonitorLoading", method = RequestMethod.GET)
    public String showMonitorLoading(ModelMap modelMap) {
        try {
            modelMap.addAttribute("vm3dresource", otherGraphService.getVM3dResource());
            modelMap.addAttribute("vminfos", otherGraphService.getVMInfoTable());

            BigInteger bigInteger1 = new BigInteger(123);
            BigInteger bigInteger2 = 2323;
            BigInteger result = bigInteger1 * bigInteger2;
            return "totalMonitorLoading.ftl";
        } catch (Exception ex) {
            logger.info("error in show MonitorLoading, error " + ex);
            return null;
        }
    }

    @RequestMapping(value = "netMonitorLoading", method = RequestMethod.GET)
    public String showNetMonitorLoading(ModelMap modelMap) {
        try {
            modelMap.addAttribute("d3graph", d3GraphService.getD3Graph());
            modelMap.addAttribute("vminfoTable", vmInfoService.getVMInfoTable());
            modelMap.addAttribute("networkUtilization", otherGraphService.getNetworkUtilization());
            modelMap.addAttribute("networkLoad", lineGraphService.getNetworkLoad());

            return "netMonitorLoading.ftl";

        } catch (Exception ex) {
            logger.info("Error in showNetMonitorLoading, error " + ex);
            return null;
        }
    }

    @RequestMapping(value = "vmMonitorLoading", method = RequestMethod.GET)
    public String showVMMonitorLoading(ModelMap modelMap) {
        try {
            modelMap.addAttribute("cpu", lineGraphService.getVMCpuLoading());
            modelMap.addAttribute("mem", lineGraphService.getVMMemLoading());
            modelMap.addAttribute("net", lineGraphService.getVMNetworkLoading());

            return "vmMonitorLoading.ftl";
        } catch (Exception ex) {
            logger.info("Error in showVMMonitorLoading, error " + ex);
            return null;
        }
    }

    @RequestMapping(value = "loadingMonitor", method = RequestMethod.GET)
    public String showLoadMonitor() {
        return "loadingMonitor.ftl";
    }

    @RequestMapping(value = "loadingForcast", method = RequestMethod.GET)
    public String showloadingForcast() {
        return "loadingForcast.ftl";
    }
    @RequestMapping(value = "resourceAllocator", method = RequestMethod.GET)
    public String showresourceAllocator() {
        return "resourceAllocator.ftl";
    }
    @RequestMapping(value = "imageRepo", method = RequestMethod.GET)
    public String showimageRepo() {
        return "imageRepo.ftl";
    }
    @RequestMapping(value = "singleImage", method = RequestMethod.GET)
    public String showsingleImage() {
        return "singleImage.ftl";
    }

    @RequestMapping(value = "graph/{belong}/{count}", method = RequestMethod.GET)
    @ResponseBody
    public String showDynamicResource(@PathVariable String belong,
                                      @PathVariable int count) {
        try {
            if (belong.equals("cpu"))
                return lineGraphService.getMostRecentCPULoading(count);
            if (belong.equals("memory"))
                return lineGraphService.getMostRecentMemLoading(count);
            return null;
        } catch (Exception ex) {
            logger.info("Error in showDynamicResource, error " + ex);
            return null;
        }
    }

}
