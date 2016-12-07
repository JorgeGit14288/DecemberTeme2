/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;

/**
 *
 * @author intercitydev
 */
@Controller
public class LenguajeController {
    HttpSession sesion;
    String sesionUser;
    
     @RequestMapping(value="cambiarLenguaje.htm",method = RequestMethod.GET)
    public ModelAndView setLenguaje(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView();
        String idioma = request.getParameter("lenguaje");
        System.out.println("Se desea cambiar a lenguaje "+idioma);
        try{
        
        RequestContextUtils.getLocaleResolver(request).setLocale(request, response, new Locale(request.getParameter("lenguaje")));
        mav.addObject("idioma", idioma);
        }
        catch(Exception e)
        {
            e.printStackTrace();
            System.out.println("No se pudo cargar el lenguaje");
        }

        mav.setViewName("login/login");
        return mav;
    }
     @RequestMapping(value="cambiarLenguajeEscritorio.htm",method = RequestMethod.GET)
    public ModelAndView setLenguajeEscritorio(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView();
        String lenguaje = request.getParameter("lenguaje");
        String idioma = request.getParameter("lenguaje");
        sesion = request.getSession();
        System.out.println("Se desea cambiar a lenguaje "+lenguaje);
        try{
        mav.addObject("idioma", idioma);
        RequestContextUtils.getLocaleResolver(request).setLocale(request, response, new Locale(request.getParameter("lenguaje")));
        }
        catch(Exception e)
        {
            e.printStackTrace();
            System.out.println("No se pudo cargar el lenguaje");
        }
        
        if (sesion.getAttribute("usuario") == null) {
            mav.setViewName("login/login");

        } else {
            sesionUser = sesion.getAttribute("usuario").toString();
            mav.addObject("idioma", idioma);
            if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                mav.setViewName("viewsAdmin/panelAdmin");
                System.out.println("el usuario es administrador");
            } else {
                mav.setViewName("panel/panel");
            }
        }
        return mav;

        
        
    }
    
}
