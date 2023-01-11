package com.xrom.springboot.start.domain;

/**
 * Teejson 这个 主要是根据ajax 的习惯 来设计的 基础类json 这个主要是根据T9的习惯 给大家设计的
 * 
 * @author 赵鹏
 *
 */
public class TeeJson {

    private boolean rtState = false;// 成功标记
    private String rtMsg = "";// 信息提示
    private Object rtData = null;// 返回

    public TeeJson() {
    }

    public TeeJson(boolean rtState) {
        this.rtState = rtState;
    }

    public TeeJson(boolean rtState, Object rtData) {
        this.rtState = rtState;
        this.rtData = rtData;
    }

    public TeeJson(boolean rtState, String msg) {
        this.rtState = rtState;
        this.rtMsg = msg;
    }

    public static TeeJson OK() {
        return new TeeJson(true);
    }

    public static TeeJson OK(Object rtData) {
        return new TeeJson(true, rtData);
    }

    public static TeeJson ERROR(String msg) {
        return new TeeJson(false, msg);
    }

    public boolean isRtState() {
        return rtState;
    }

    public void setRtState(boolean rtState) {
        this.rtState = rtState;
    }

    public String getRtMsg() {
        return rtMsg;
    }

    public void setRtMsg(String rtMsg) {
        this.rtMsg = rtMsg;
    }

    public Object getRtData() {
        return rtData;
    }

    public void setRtData(Object rtData) {
        this.rtData = rtData;
    }

    @Override
    public String toString() {
        return "{\"rtState\":" + rtState + ",rtMsg:\"" + rtMsg + "\",rtData:\"" + rtData + "\"}";
    }

}
