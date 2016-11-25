/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.entitys.Detalles;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.util.httpRecargar;

/**
 *
 * @author intercitydev
 */
@Controller
public class RecargarController {
    HttpSession sesion;
    String sesionUser;
    String mensaje;
    static String returnUrl ="recargar.htm";
    static String returnUrl2 ="recargarAdmin.htm";
    
    
    @RequestMapping("resultado.htm")
    public ModelAndView getResultado()
    {
        ModelAndView mav = new ModelAndView();
        
        if (sesion.getAttribute("usuario") == null) {
            mensaje = "No esta logeado para obtener las vistas";
            mav.addObject("mensaje", mensaje);
            mav.setViewName("login/login");

        } else {
           
           
            if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                 
                mav.setViewName("viewsAdmin/recargarAdmin");
                System.out.println("El usuario es administrador ");
            } else {
                
                 
                mav.setViewName("recargar/recargar");
            }

        }
        
        return mav;
        
    }
    @RequestMapping(value="recargar.htm",method = RequestMethod.GET)
    public ModelAndView getRecargar(HttpServletRequest request)
    {
        ModelAndView mav = new ModelAndView();
        sesion = request.getSession();
        Detalles cuenta = new Detalles();
        
        cuenta= (Detalles) sesion.getAttribute("cuenta");
        String amount = request.getParameter("amount");
        String details = "Relizando una recarga ";
        String accountid = cuenta.getAccountId();
        
       // System.out.print("Se realizara una recarga a "+cuenta.getAccountId() + " monto "+amount);
        String datoRecarga  = ("Account "+cuenta.getAccountId() + " monot "+amount+ " urlRetorno "+returnUrl+ " Detalles " + details);
        System.out.println(datoRecarga);
        
        if (sesion.getAttribute("usuario") == null) {
            mensaje = "No esta logeado para obtener las vistas";
            mav.addObject("mensaje", mensaje);
            mav.setViewName("login/login");

        } else {
            
            
            
            httpRecargar recargarHelper = new httpRecargar();
            String redirect = recargarHelper.getRecargas(accountid, amount, returnUrl, details);
            String urlRedirect ="redirect:"+redirect;
            System.out.println(urlRedirect);

            if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                
                System.out.println("El usuario es administrador ");
                mav.addObject("datoRecarga",datoRecarga);
                //mav.setViewName("viewsAdmin/recargarAdmin");
                mav.setViewName(urlRedirect);
            } else {
                //mav.setViewName("recargar/recargar");
                mav.addObject("datoRecarga",datoRecarga);   
                mav.setViewName(urlRedirect);
            }
        }
        
        return mav;
        
    }
    
    
}
