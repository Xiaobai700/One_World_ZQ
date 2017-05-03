package com.oneworld.web.enums;

/**
 * Created by Master ZQ on 2017/2/13.
 */
public enum ReportType {
    /**色情低俗**/
   SEQING_DISU(1,"色情低俗"),
    /**政治敏感**/
    ZHENGZHI_MINGAN(2,"政治敏感"),
    /**违法**/
    WEI_FA(3,"违法"),
    /**广告**/
    GUANG_GAO(4,"广告"),
    /**病毒木马**/
    BINGDU_MUMA(5,"病毒木马"),
    /**其他**/
    QI_TA(6,"其他");
    private Integer type;
    private String type_name;

    ReportType(Integer type, String type_name){
        this.type = type;
        this.type_name = type_name;
    }

    public Integer getType(){
        return type;
    }
    public String getType_name(){
        return type_name;
    }



}
