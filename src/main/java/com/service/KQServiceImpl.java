package com.service;

import com.dao.KQDao;
import com.pojo.check1;
import com.pojo.dept;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class KQServiceImpl implements KQService{
    @Autowired
    KQDao kqDao;
    @Override
    public String toKQ(Model model,Integer pageCur,Integer perPageSize,Integer eid,Integer type) {
        List<Map<String, Object>>KQList=kqDao.toKQ(eid);
        if(type==1)
            KQList=kqDao.toKQ1();
        //1111
        int temp=KQList.size();
        model.addAttribute("totalCount", temp);
        int totalPage = 0;
        if (temp == 0) {
            totalPage = 0;
        } else {
            totalPage = (int) Math.ceil((double) temp / 5);
        }
        if (pageCur == null) {
            pageCur = 1;
        }
        if ((pageCur - 1) * 5> temp) {
            pageCur = pageCur - 1;
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("startIndex", (pageCur - 1) * 5);
        map.put("perPageSize", 5);
        map.put("eid",eid);
        System.out.println(type);
        map.put("type",type);
        KQList = kqDao. selectAllKQByPage1(map);
        if(type==2)
            KQList = kqDao. selectAllKQByPage(map);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("pageCur", pageCur);
        model.addAttribute("KQList",KQList);
        model.addAttribute("eid",eid);
        model.addAttribute("type",type);
        return "e_KQ";
    }

    @Override
    public String showAdd(Timestamp t,check1 check1, Model model, HttpSession session,int eid) throws ParseException {
        SimpleDateFormat df = new SimpleDateFormat("HH:mm");
     java.util.Date begin = df.parse("08:00");
     java.util.Date center=df.parse("12:00");
     java.util.Date afternoon=df.parse("14:00");
      java.util.Date end =df.parse("18:00");
        if (t.before(begin)|| t.after(center)&&t.before(afternoon)||t.after(end)) {
            check1.setCheckstaut("正常");
        } else  if(t.after(begin)&&t.before(center)||t.after(afternoon)&&t.before(end))
                check1.setCheckstaut("早退或迟到");

        check1.setChdate(t);
        check1.setCid(eid);
        int type=Integer.parseInt(session.getAttribute("type").toString());
        kqDao.addKQ(check1);
        return "forward:/KQ/toKQ?eid="+eid+"&type="+type;
    }
}
