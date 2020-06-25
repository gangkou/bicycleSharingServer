package org.bicyclesharing.service;



import org.bicyclesharing.entities.Emploee;

import java.util.List;

/**
 * 管理员相关逻辑接口
 * @author 小米饭
 * @date 2020/6/13
 **/
public interface EmploeeService {


    /**
     * 添加员工
     */
    boolean addemploee(Emploee emploee);

    /**
     * 删除员工
     */
    boolean removeemploee(Integer emploeeId);

    /**
     * 根据id查询员工信息
     *
     * @param emploeeId
     * @return 具体员工实例
     */
    Emploee getemploeeById(Integer emploeeId);

    /**
     * 通过员工名称获得该员工信息(查询)
     *
     * @param emploeeName
     * @return 员工信息(实例)
     */
    List<Emploee> getemploeeByName(String emploeeName);


    /**
     * 查询所有员工信息
     *
     * @return 所有员工实例集合(表格)
     */
    List<Emploee> getAllemploee();


    /**
     * 7.通过员工名类似进行模糊查询其信息
     *
     * @param name
     * @return 员工实例集合(n行, n>=0)
     */
    List<Emploee> getemploeeByNameLike(String name);


    /**
     * 8.修改员工信息
     */
    boolean editemploee(Emploee emploee);


}
