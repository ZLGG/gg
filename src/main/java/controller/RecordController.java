package controller;

import entity.History;
import entity.Record;
import entity.User;
import vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import service.HistoryService;
import service.RecordService;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class RecordController {

    @Autowired
    private RecordService recordService;
    @Autowired
    private HistoryService historyService;

    //填写请假单时候的提交
    @ResponseBody
    @RequestMapping(value = "/addRecord", method = RequestMethod.POST)
    public Result addRecord(Record record){
        try {
            //添加到record表中
            Record record1 = recordService.addRecord(record);

            String operationMessage = null;
            //如果是重新申请
            if(record.getStatusId().equals(5)){
                operationMessage = "重新申请请假";
            }else{
                operationMessage = "申请请假";
            }
            History history = historyService.addOneHistory(record1.getRecordId(),operationMessage,"无");
            //如果是第二次申请
            return new Result(200, "操作成功", record1);
        }catch (RuntimeException e){
            e.printStackTrace();
            return new Result(400, "失败啊了", null);
        }
    }

    //查询一个请假单的详情
    @RequestMapping(value = "/recordDetail", method = RequestMethod.GET)
    public String recordDetail(@RequestParam("record_id") Integer recordId, Model model){
        Record record = recordService.getOneById(recordId);
        model.addAttribute("record", record);
        return "recordDetail";
    }


    //获取一个请假单的历史流程
    @ResponseBody
    @RequestMapping(value = "/getHistory", method = RequestMethod.GET)
    public Result<List<History>> getHistory(@RequestParam("record_id") Integer recordId){
        return new Result<List<History>>(0, "成功", historyService.getHistoryByRecordId(recordId));
    }

    //返回一个用户可以批准的请假
    @ResponseBody
    @RequestMapping("/getListUserCanApprove")
    public Result getListUserCanApprove(HttpSession httpSession){
        User user = (User) httpSession.getAttribute("user");
        List<Record> list = recordService.getListUserCanApprove(user);
        return new Result(0, "成功", list);
    }

    //获得 自己的请假单
    @ResponseBody
    @RequestMapping("/getMyLeave")
    public Result getMyLeave(HttpSession session){
        User user = (User) session.getAttribute("user");
        return new Result(0, "请求成功", recordService.getUserLeave(user));
    }

    //批准一个请假申请  不能批准自己的请假单，不能跨权限申请请假单
    @ResponseBody
    @RequestMapping("/approve")
    public Result approve(@RequestParam("record_id")Integer recordId, HttpSession session){
        User user = (User) session.getAttribute("user");
        Record record = recordService.getOneById(recordId);
        if(record.getRecordProposer().equals(user.getUsername())//如果是自己的
                ||!record.getStatusId().equals(new Integer(user.getAuthority()))){//如果是跨权限
            return new Result(400, "没有权限", null);
        }
        try{
            //修改一个请假单的状态
            recordService.approve(recordId, user.getAuthority());
            //添加一条操作历史
            historyService.addOneHistory(recordId,recordService.chooseApproveType(user.getAuthority()),"无");
            return new Result(200, "操作成功", null);
        }catch (RuntimeException e){
            e.printStackTrace();
            return new Result(400, "操作失败，请稍后再试", null);
        }
    }

    //拒绝一个请假申请
    @ResponseBody
    @RequestMapping(value = "/reject", method = RequestMethod.POST)
    public Result reject(@RequestParam("record_id")Integer recordId,
                         @RequestParam("reason") String reason,
                         HttpSession session){
        User user = (User) session.getAttribute("user");
       try{
           //修改这个请假单的状态 设置为4
           recordService.reject(recordId, user.getAuthority());
           //然后插入一条数据库的信息
           historyService.addOneHistory(recordId, recordService.chooseRejectType(user.getAuthority()), reason);
           return new Result(200, "操作成功", null);
       }catch (RuntimeException e){
           e.printStackTrace();
           return new Result(400, "操作失败", null);
       }
    }


    //获得所有请假单 测试用
    @ResponseBody
    @RequestMapping("/getAll")
    public Result getAll(){
        return new Result(0, "成功", recordService.getAll());
    }
    //去allLeave.jsp这个页面
    @RequestMapping("/gotoGetAll")
    public String gotoGetAll(){
        return "allLeave";
    }

    //更新一条记录 用于编辑申请或者重新申请
    @ResponseBody
    @RequestMapping(value = {"/submitAgain","editAgain"},method = RequestMethod.POST)
    public Result updateOneRecord(Record record){
        try{
            recordService.updateOneRecord(record);
            historyService.addOneHistory(record.getRecordId(), "重新申请", "无");
            return new Result(200, "操作成功", null);
        }catch (RuntimeException e){
            e.printStackTrace();
            return new Result(400, "操作失败", null);
        }
    }


    //让spring将表单中2018-10-01的字符串转换为Date 然后注入
    @InitBinder
    public void initBinder(WebDataBinder binder){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        simpleDateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(simpleDateFormat, true));
    }
}
