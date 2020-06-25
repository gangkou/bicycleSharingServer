package org.bicyclesharing.util;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * 验证邮箱有效性
 * @author 小米饭
 * @date 2020/6/25
 * @descrition：org.bicyclesharing.util
 **/
public class MailUtil {
    static Properties properties;
    static Message msg;
    static Transport transport;
    //初始化Mail信息
    public MailUtil(){
        properties = new Properties();
        //调试模式发送
        properties.setProperty("mail.debug", "true");
        //身份验证设置
        properties.setProperty("mail.smtp.auth", "true");
        //发件人邮箱主机名
        properties.setProperty("mail.host", "smtp.qq.com");
        //发件协议
        properties.setProperty("mail.transport.protocol", "smtp");

        properties.put("mail.smtp.starttls.enable", "true");

        properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        Session session = Session.getInstance(properties);

        msg = new MimeMessage(session);

        try {
            msg.setSubject("MtLa验证邮件,欢迎加入MtLa!");
            //设置发件人
            msg.setFrom(new InternetAddress("发件人qq.com"));

            transport = session.getTransport();
            //设置发件人在该邮箱主机上的用户名密码
            transport.connect("邮箱服务器名", "邮箱授权码");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
    /**
     * 得到邮箱地址邮箱内容发送。
     * @param address
     * @param text
     * @throws AddressException
     * @throws MessagingException
     */

    public void sendMail(String address,String text) throws AddressException, MessagingException{

        SimpleDateFormat sdf=new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");

        msg.setText("您的验证码为:"+text+"请您尽快完成注册,该验证码10分钟后失效.   "+sdf.format(new Date()));

        transport.sendMessage(msg, new Address[] {new InternetAddress(address)});
        transport.close();
    }

}
