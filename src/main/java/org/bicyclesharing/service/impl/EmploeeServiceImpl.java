package org.bicyclesharing.service.impl;

import org.bicyclesharing.dao.EmploeeDao;
import org.bicyclesharing.entities.Emploee;
import org.bicyclesharing.service.EmploeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * 管理员业务逻辑实现类
 * @author 小米饭
 * @date 2020/6/13
 **/
@Service
@Transactional
public class EmploeeServiceImpl implements EmploeeService {
    //引入Dao依赖
    @Autowired
    private EmploeeDao emploeeDao;


    @Override
    public boolean addemploee(Emploee emploee) {
                emploeeDao.insertEmploee(emploee);
                return true;
}
    @Override
    public boolean removeemploee(Integer emploeeId) {
        //根据输入的Id移除,慎用
        if (emploeeId <= 0 || emploeeId == null) {
            return false;
        } else {
            //这里其实不严谨,但是我不用删除这个操作,所以不需要多写
            emploeeDao.deleteEmploee(emploeeId);
            return true;
        }
    }

    @Override
    public Emploee getemploeeById(Integer EmploeeId) {
        return emploeeDao.selectEmploeeById(EmploeeId);
    }

    @Override
    public List<Emploee> getemploeeByName(String EmploeeName) {
        return (List<Emploee>) emploeeDao.selectEmploeeByName(EmploeeName);
    }

    @Override
    public List<Emploee> getAllemploee() {
        return emploeeDao.selectAllEmploee();
    }

    @Override
    public List<Emploee> getemploeeByNameLike(String name) {
        return emploeeDao.selectEmploeeByNameLike(name);
    }

    @Override
    public boolean editemploee(Emploee emploee) {
            Emploee Emploee = emploeeDao.selectEmploeeById(emploee.getEmploeeid());

            Emploee.setEmploeename(emploee.getEmploeename());
            Emploee.setEmploeeage(emploee.getEmploeeage());
            Emploee.setEmploeesex(emploee.getEmploeesex());
            Emploee.setEmploeeemail(emploee.getEmploeeemail());
            Emploee.setEmploeedepartment(emploee.getEmploeedepartment());

            emploeeDao.updateEmploee(Emploee);
            return true;
    }
}
