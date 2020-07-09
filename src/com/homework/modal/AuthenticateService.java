package com.homework.modal;

public class AuthenticateService {

    public boolean authenticateUser(String username,String password){
        return username!=null && username.equalsIgnoreCase("java") && password!=null && password.equalsIgnoreCase("java");
    }

}
