package dao;

import org.apache.ibatis.annotations.Param;

import java.util.Date;

public interface IpDao {
    void insertOne(@Param("date") Date date, @Param("ip") String ip);
}
