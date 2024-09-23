package com.pojo;

import net.sf.jsqlparser.expression.DateTimeLiteralExpression;

import java.sql.Date;
import java.sql.Timestamp;

public class check1 {
    int cid;
    int eid;
    String checkstaut;
    Timestamp chdate;

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public String getCheckstaut() {
        return checkstaut;
    }

    public void setCheckstaut(String checkstaut) {
        this.checkstaut = checkstaut;
    }

    public Timestamp getChdate() {
        return chdate;
    }

    public void setChdate(Timestamp chdate) {
        this.chdate = chdate;
    }
}
