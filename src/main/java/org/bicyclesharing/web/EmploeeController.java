package org.bicyclesharing.web;

import org.bicyclesharing.entities.Bicycle;
import org.bicyclesharing.entities.Department;
import org.bicyclesharing.entities.Emploee;
import org.bicyclesharing.service.BicycleService;
import org.bicyclesharing.service.EmploeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

/**
 * @author 小米饭
 * @date 2020/6/13
 **/
@Controller
@RequestMapping(value = "/")
public class EmploeeController {
    @Autowired
    private EmploeeService emploeeService;

    @RequestMapping(value = "admin-emploee-list-show", method = RequestMethod.GET)
    public String listShow(Map<String, Object> requestMap, @RequestParam("page") Integer page) {
        requestMap.put("nav", "emploee");
        ArrayList<Emploee> emploees = (ArrayList<Emploee>) emploeeService.getAllemploee();
        requestMap.put("emploees", emploees);

        int pageCount = emploees.size();  //数据条数
        int pageSize = 20;  //分页条数
        int pageMax = pageCount / pageSize;  //最大页数
        int pagePointer = 1;  //当前指向页
        if (pageMax != 0 && pageCount % pageSize != 0) {
            ++pageMax;
        }
        if (pageMax == 0) {
            pageMax = 1;
        }
        if (page < 1 || page > pageMax) {
            pagePointer = 1;
        } else {
            pagePointer = page;
        }
        ArrayList<Emploee> pageEmploees = new ArrayList<>();
        if (pageMax == 1) {
            pageEmploees.addAll(emploees);
        } else if (pagePointer == pageMax) {
            int tmp = pageCount % pageSize;
            if (tmp == 0) {
                tmp = pageSize;
            }
            for (int i = pageSize * (pagePointer - 1); i < pageSize * (pagePointer - 1) + tmp; ++i) {
                pageEmploees.add(emploees.get(i));
            }
        } else {
            for (int i = pageSize * (pagePointer - 1); i < pageSize * pagePointer; ++i) {
               pageEmploees.add(emploees.get(i));
            }
        }
        requestMap.put("pageMax", pageMax);
        requestMap.put("pagePoint", pagePointer);
        requestMap.put("pageEmploees", pageEmploees);

        return "emploee/emploee_list";
    }

    @RequestMapping(value = "admin-emploee-searchemploee-show", method = RequestMethod.GET)
    public String searchBicycleShow(Map<String, Object> requestMap, @RequestParam("statement") String statement) {
        requestMap.put("nav", "emploee-list");
        ArrayList<Emploee> emploees = (ArrayList<Emploee>) emploeeService.getemploeeByNameLike(statement);
        requestMap.put("pageEmploees", emploees);
        return "emploee/emploee_list";
    }


    @RequestMapping(value = "admin-emploee-addemploee-show", method = RequestMethod.GET)
    public String addBicycleShow() {
        return "emploee/emploee_add";
    }



    @RequestMapping(value = "admin-emploee-addemploee-execute", method = RequestMethod.POST)
    public String addBicycleExcute(HttpServletRequest request) {
        Emploee  emploee=new Emploee();
        Department department =new Department();
        department.setDepart_id(Integer.parseInt(request.getParameter("emploeedepartid")));
        department.setDepart_name(request.getParameter("emploeedepartname"));
        emploee.setEmploeedepartment(department);

        emploee.setEmploeename(request.getParameter("emploeename"));
        emploee.setEmploeeage(Integer.parseInt(request.getParameter("emploeeage")));
        emploee.setEmploeeemail(request.getParameter("emploeeemail"));
        emploee.setEmploeesex(request.getParameter("emploeesex"));

        emploeeService.addemploee(emploee);
        String view = "redirect:/admin-emploee-list-show?page=1";
        return view;
    }

    @RequestMapping(value = "admin-emploee-editemploee-show/{id}", method = RequestMethod.GET)
    public String editBicycleShow(@PathVariable("id") Integer id, Map<String, Object> requestMap) {
        Emploee emploee =emploeeService.getemploeeById(id);
        requestMap.put("emploee", emploee);
        return "emploee/emploee_edit";
    }

    @RequestMapping(value = "admin-emploee-editemploee-execute", method = RequestMethod.PUT)
    public String editBicycleExecute(HttpServletRequest request) {
        Emploee  emploee=new Emploee();
        Department department =new Department();
        department.setDepart_name(request.getParameter("emploeedepartname"));
        department.setDepart_id(Integer.parseInt(request.getParameter("emploeedepartid")));
        emploee.setEmploeedepartment(department);
        emploee.setEmploeeid(Integer.parseInt(request.getParameter("emploeeid")));
        emploee.setEmploeename(request.getParameter("emploeename"));
        emploee.setEmploeeage(Integer.parseInt(request.getParameter("emploeeage")));
        emploee.setEmploeeemail(request.getParameter("emploeeemail"));
        emploee.setEmploeesex(request.getParameter("emploeesex"));

        emploeeService.editemploee(emploee);
        return "redirect:/admin-emploee-list-show?page=1";
    }

    @RequestMapping(value = "admin-emploee-delete-execute/{id}", method = RequestMethod.DELETE)
    public String deleteOneBicycle(@PathVariable("id") Integer id) {
        emploeeService.removeemploee(id);
        return "redirect:/admin-emploee-list-show?page=1";
    }

}
