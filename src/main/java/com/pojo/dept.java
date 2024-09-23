package com.pojo;

import java.sql.Date;

public class dept {
    private int did;
    private String dname;
    private String duty_man;
    private Date cdate;
    private String tips;

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public String getDuty_man() {
        return duty_man;
    }

    public void setDuty_man(String duty_man) {
        this.duty_man = duty_man;
    }

    public Date getCdate() {
        return cdate;
    }

    public void setCdate(Date cdate) {
        this.cdate = cdate;
    }

    public String getTips() {
        return tips;
    }

    public void setTips(String tips) {
        this.tips = tips;
    }
}
