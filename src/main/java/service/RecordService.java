package service;


import dao.HistoryMapper;
import dao.RecordMapper;
import entity.Record;
import entity.RecordExample;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.InitBinder;

import java.util.Date;
import java.util.List;


/*
* record的staus说明：
        0	申请中
        1	一级批准中
        2	二级批准中
        3	三级审批中
        4	全部通过
        5	被拒绝，等待重新申请
* */
@Service
public class RecordService {


    @Autowired
    private RecordMapper recordMapper;

    @Autowired
    private HistoryMapper historyMapper;

    public Record addRecord(Record record){
        record.setRecordTime(new Date());
        record.setStatusId(0);
        recordMapper.insert(record);
        return record;
    }

    //返回一个请假单 根据id（主键）
    public Record getOneById(Integer id) {
        return recordMapper.selectByPrimaryKey(id);
    }

    //返回一个用户可以批准的请假列表
    public List<Record> getListUserCanApprove(User user){
        Byte authorityLevel = user.getAuthority();
        RecordExample example= new RecordExample();
        example.createCriteria().andStatusIdEqualTo(new Integer(authorityLevel)).andRecordProposerNotEqualTo(user.getUsername());
        List<Record> recordList = recordMapper.selectByExample(example);
        return recordList;
    }

    //批准一个申请请求,根据用户权限的不同来判断这个批准权限应该是什么
    //返回的是受影响的行数
    public int approve(Integer recordId, Byte authority){
        RecordExample example= new RecordExample();
        Record record = new Record();
        record.setRecordId(recordId);
        record.setStatusId(authority+1);//来到下一个状态
        return recordMapper.updateByPrimaryKeySelective(record);
    }

    //根据用户的权限来选择 批准的操作类型 为了操作历史服务
    public String chooseApproveType(Byte userAuthority){
        String type = null;
        switch (userAuthority){
            case 0:
                type = "同意申请";
                break;
            case 1:
                type = "一级审批通过";
                break;
            case 2:
                type = "二级审批通过";
                break;
            case 3:
                type = "三级审批通过";
                break;
        }
        return type;
    }

    //根据用户的权限来选择 拒绝 的操作类型 为了操作历史服务
    public String chooseRejectType(Byte userAuthority){
        String type = null;
        switch (userAuthority){
            case 0:
                type = "不同意申请,请重新申请";
                break;
            case 1:
                type = "未通过一级审批,请重新申请";
                break;
            case 2:
                type = "未通过二级审批,请重新申请";
                break;
            case 3:
                type = "未通过三级审批,请重新申请";
                break;
        }
        return type;
    }

    //拒绝一个请假申请 打回申请的状态
    public int reject(Integer recordId, Byte authority){
        RecordExample example= new RecordExample();
        Record record = new Record();
        record.setRecordId(recordId);
        record.setStatusId(5);//状态是 未通过，等待重新申请

        return recordMapper.updateByPrimaryKeySelective(record);
    }

    //获取所有的请假单
    public List<Record> getAll() {
        return recordMapper.getAllRecord();
    }

    public void updateOneRecord(Record record) {
        record.setStatusId(0);
        recordMapper.updateByPrimaryKeySelective(record);
    }

    //返回一个用户自己的请假单
    public List<Record> getUserLeave(User user){
        RecordExample example = new RecordExample();
        example.createCriteria().andRecordProposerEqualTo(user.getUsername());
        return recordMapper.selectByExample(example);
    }
}
