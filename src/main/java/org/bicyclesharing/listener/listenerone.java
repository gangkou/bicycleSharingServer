package org.bicyclesharing.listener;

import org.bicyclesharing.entities.User;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
/**
 * 用户重复登录监听器
 * @author 小米饭
 *
 */
public class listenerone implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {

	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
		HttpSession session=httpSessionEvent.getSession();
        String name=((User)session.getAttribute("user")).getUserEmail();
        if(name!=null){
            ServletContext apl=session.getServletContext();
            Map<String, Object> ln=(Map<String, Object>)apl.getAttribute("ln");
            ln.remove(name);
            apl.setAttribute("ln",ln);
            session.removeAttribute("email");
        }		
	}
}
