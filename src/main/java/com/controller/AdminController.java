/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.dao.TelefonosDao;
import com.dao.UsuariosDao;
import com.entitys.Telefonos;
import com.entitys.Usuarios;
import com.jsonEntitys.Account;
import com.jsonEntitys.AccountLight;
import com.util.httpAccount;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author intercitydev
 */
@Controller
public class AdminController {

    HttpSession sesion;
    String mensaje;
    String sesionUser;

    @RequestMapping("panelAdmin.htm")
    public ModelAndView getPanel(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        try {

            sesion = request.getSession();
            if (sesion.getAttribute("usuario") == null) {
                mensaje = "Enter your data to enter the system";
                mav.addObject("mensaje", mensaje);
                mav.setViewName("login/login");

            } else {
                if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                    mav.setViewName("viewsAdmin/panelAdmin");
                } else {
                    mav.setViewName("panel/panel");
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            mensaje ="An error occurred while getting the view"  ;   
             mav.addObject("mensaje", mensaje);
            mav.setViewName("login/login");

        }
        return mav;
    }

}
