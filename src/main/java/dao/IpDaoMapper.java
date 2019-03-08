package dao;

import entity.Ip;
import org.apache.ibatis.annotations.Param;

import java.util.Date;

public interface IpDaoMapper {
    void insertOne(@Param("date") Date date,@Param("ip") String ip);
}
