/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author intercitydev
 */
@Controller
public class RecargarController {
    HttpSession sesion;
    String sesionUser;
    String mensaje;
    
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
    
    
}
