package org.bicyclesharing.web;

import org.bicyclesharing.entities.Bicycle;
import org.bicyclesharing.service.BicycleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 * 单车相关api
 * @author 小米饭
 * @date 2020/6/13
 **/
@Controller
@RequestMapping(value = "/")
public class BicycleApi {
    @Autowired
    private BicycleService bicycleService;

    /**
     * 1.获取附近各状态车辆信息api
     */
    @RequestMapping(value = "api-bicycle-queryByLocation/{bicycleCurrentX}/{bicycleCurrentY}")
    @ResponseBody
    public ArrayList<Bicycle> getBicycleByLocation(@PathVariable("bicycleCurrentX") double bicycleCurrentX, @PathVariable("bicycleCurrentY") double bicycleCurrentY) {
        ArrayList<Bicycle> bicycles = (ArrayList<Bicycle>) bicycleService.getBicycleByLocation(bicycleCurrentX, bicycleCurrentY);
        return bicycles;
    }

    /**
     * 2.获取不同状态车辆的经纬度
     */
    @RequestMapping(value = "api-bicycle-getX/{bicycleStatement}")
    @ResponseBody
    public Double[] getXByStatement(@PathVariable("bicycleStatement") Integer bicycleStatement) {
        return bicycleService.getBicycleCurrentXByStatement(bicycleStatement);
    }

    @RequestMapping(value = "api-bicycle-getY/{bicycleStatement}")
    @ResponseBody
    public Double[] getYByStatement(@PathVariable("bicycleStatement") Integer bicycleStatement) {
        return bicycleService.getBicycleCurrentYByStatement(bicycleStatement);
    }

    /**
     * 1.获取附近各状态车辆信息api
     */
    @RequestMapping(value = "api-bicycleid-queryByLocation")
    public String getBicycleidByLocation(HttpServletRequest request) {
        double bicycleCurrentX=Double.parseDouble(request.getParameter("currentx"));
        double bicycleCurrentY=Double.parseDouble(request.getParameter("currenty"));
        ArrayList<Bicycle> bicycles = (ArrayList<Bicycle>) bicycleService.getBicycleByLocation(bicycleCurrentX, bicycleCurrentY);
        return "redirect:/judge-borrow-or-return?bicycleId="+bicycles.get(0).getBicycleId();
    }
}
