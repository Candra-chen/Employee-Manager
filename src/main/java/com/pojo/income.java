package com.pojo;

import java.sql.Date;

public class income {
    int id;
    int eid;
    String itype;
    String ireason;
    Date idate;
    int staut;
    int did;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public String getItype() {
        return itype;
    }

    public void setItype(String itype) {
        this.itype = itype;
    }

    public String getIreason() {
        return ireason;
    }

    public void setIreason(String ireason) {
        this.ireason = ireason;
    }

    public Date getIdate() {
        return idate;
    }

    public void setIdate(Date idate) {
        this.idate = idate;
    }

    public int getStaut() {
        return staut;
    }

    public void setStaut(int staut) {
        this.staut = staut;
    }

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }
}
