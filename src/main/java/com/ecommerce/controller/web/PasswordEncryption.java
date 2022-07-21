package com.ecommerce.controller.web;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordEncryption {

    public static String MD5(String input) {
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());
            BigInteger number = new BigInteger(1, messageDigest);
            String hashtext = number.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return SHA1(hashtext);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
    public static String SHA1(String input){
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("SHA1");
            byte[] result = md.digest(input.getBytes());
            StringBuffer sb = new StringBuffer();
            for(int i = 0; i < result.length; i++){
                sb.append(Integer.toString((result[i] & 0xff) + 0x100, 16).substring(1));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
    public static void main(String[] args) {
        String password = "123456";
        System.out.println(PasswordEncryption.MD5(password));
    }
}
