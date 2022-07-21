package com.ecommerce.model;

public class Code {
    private String code;
    private Long startTime;
    private Long endTime;

    public Code(String code, Long startTime) {
        this.code = code;
        this.startTime = startTime;
    }

    public Long getStartTime() {
        return startTime;
    }

    public void setStartTime(Long startTime) {
        this.startTime = startTime;
    }

    public Long getEndTime() {
        return endTime;
    }

    public void setEndTime(Long endTime) {
        this.endTime = endTime;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public boolean timeout(Integer second){
        return (endTime - startTime)/1000 < second;
    }
}
