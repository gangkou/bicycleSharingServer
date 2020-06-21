package org.bicyclesharing.dao;

import org.bicyclesharing.entities.Emploee;

import java.util.List;

/**
 * @author 小米饭
 * @date 2020/6/19
 * @descrition：org.bicyclesharing.dao
 **/
public interface EmploeeDao {
    /**
     * 1.通过管理员id查询管理员信息
     *
     * @param EmploeeId
     * @return 返回一行管理员实例
     */
   Emploee selectEmploeeById(Integer EmploeeId);

    /**
     * 2.通过管理员名字查询管理员信息
     *
     * @param EmploeeName 管理员
     * @return 返回一行管理员实例
     */
    Emploee selectEmploeeByName(String EmploeeName);

    /**
     * 3.查询所有管理员信息
     *
     * @return 返回管理员table
     */
    List<Emploee> selectAllEmploee();

    /**
     * 4.插入管理员(inserts)
     *
     * @param Emploee
     */
    void insertEmploee(Emploee Emploee);

    /**
     * 5.根据管理员id删除管理员
     * 删除数据需谨慎,所以这个方法最好不要用,自增id表示很困扰
     * @param EmploeeId
     */
    void deleteEmploee(Integer EmploeeId);

    /**
     * 6.更新管理员信息(通过id识别哪一行,具体看sql)
     *
     * @param Emploee
     */
    void updateEmploee(Emploee Emploee);


    /**
     * 7.通过名称模糊(like)查询符合条件管理员
     * @param EmploeeName
     * @return 多行实例组成的table
     */
    List<Emploee> selectEmploeeByNameLike(String EmploeeName);


}

