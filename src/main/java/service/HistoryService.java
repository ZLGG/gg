package service;

import dao.HistoryMapper;
import entity.History;
import entity.HistoryExample;
import entity.Record;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.Date;
import java.util.List;

@Service
public class HistoryService  {

    @Autowired
    private HistoryMapper historyMapper;

    //添加一条操作记录(关于请假的)
    public History addOneHistory(Integer recordId, String operationResult, String operationReason){
        History history = new History();
        history.setRecordId(recordId);
        User user = (User) ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
                .getRequest().getSession()
                .getAttribute("user");
        history.setOperationUser(user.getUsername());
        history.setOperationReason(operationReason);
        history.setOperationResult(operationResult);
        history.setOperationTime(new Date());
        historyMapper.insert(history);
        return history;
    }

    //返回指定请假单的历史
    public List<History> getHistoryByRecordId(Integer recordId){
        HistoryExample example = new HistoryExample();
        example.createCriteria().andRecordIdEqualTo(new Integer(recordId));
        List<History> historyList = historyMapper.selectByExample(example);
        return historyList;
    }
}
