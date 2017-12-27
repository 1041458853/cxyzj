package com.cxyzj.demo.tool;

import org.springframework.stereotype.Component;

import java.lang.reflect.Field;

/**
 *@author 耿志强
 */
@Component
public class StatusInfo {
    private String message;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
