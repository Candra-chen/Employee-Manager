package com.pojo;

import java.sql.Date;

public class attends {
    int aid;
    int eid;
    int pid;
    Date startd;
    Date endd;
    String staut;

    public String getStaut() {
        return staut;
    }

    public void setStaut(String staut) {
        this.staut = staut;
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public Date getStartd() {
        return startd;
    }

    public void setStartd(Date startd) {
        this.startd = startd;
    }

    public Date getEndd() {
        return endd;
    }

    public void setEndd(Date endd) {
        this.endd = endd;
    }
}
