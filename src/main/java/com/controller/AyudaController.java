/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.dao.TelefonosDao;
import com.dao.UsuariosDao;
import com.entitys.Detalles;
import com.entitys.Telefonos;
import com.entitys.Usuarios;
import com.jsonEntitys.Did;
import com.util.httpCuotas;
import com.util.httpDids;
import com.util.httpHelp;
import com.util.httpServicioCliente;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
public class AyudaController {

    HttpSession sesion;
    String sesionUser;
    String mensaje;
    List<Did> dids;

    @RequestMapping("ayuda.htm")
    public ModelAndView getAyuda(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();

        try {
            sesion = request.getSession();

            mensaje = null;

            if (sesion.getAttribute("usuario") == null) {
                mav.setViewName("login/login");

            } else {
                Detalles detalle = (Detalles) sesion.getAttribute("cuenta");

                String country = detalle.getCiudad();
                String idioma = RequestContextUtils.getLocale(request).getLanguage();
                System.out.println("mostrar ayuda con el idioma " + idioma);

                sesionUser = sesion.getAttribute("usuario").toString();
                
                
                httpServicioCliente help = new httpServicioCliente();
                String resultado = help.getServicioCliente(idioma);
                mav.addObject("resultado", resultado);
                mensaje = "Servicio al Cliente";
                mav.addObject("mensaje", mensaje);
                


                if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                    mav.setViewName("viewsAdmin/ayudaAdmin");
                    System.out.println("el usuario es administrador");
                } else {
                    mav.setViewName("ayuda/ayuda");
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            mensaje = "Ha ocurrido un error al obtener la vista";
            mav.addObject("mensaje", mensaje);

            if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                mav.setViewName("viewsAdmin/panelAdmin");
                System.out.println("el usuario es administrador");
            } else {
                mav.setViewName("panel/panel");
            }

        }

        return mav;

    }

    @RequestMapping("servicioCliente.htm")
    public ModelAndView getServicioCliente(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        try {
            sesion = request.getSession();

            mensaje = null;

            if (sesion.getAttribute("usuario") == null) {
                mav.setViewName("login/login");

            } else {
                Detalles detalle = (Detalles) sesion.getAttribute("cuenta");

                String country = detalle.getCiudad();
                String idioma = RequestContextUtils.getLocale(request).getLanguage();
                System.out.println("mostrar ayuda con el idioma " + idioma);
                sesionUser = sesion.getAttribute("usuario").toString();
                
                
                httpHelp help = new httpHelp();
                String resultado = help.getHelp(idioma);
                mav.addObject("resultado", resultado);
                mensaje = "Ayuda";
                mav.addObject("mensaje", mensaje);
                

                if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                    mav.setViewName("viewsAdmin/servicioClienteAdmin");
                    System.out.println("el usuario es administrador");
                } else {
                    mav.setViewName("ayuda/servicioCliente");
                }
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            mensaje = "Ha ocurrido un error al obtener la vista";
            mav.addObject("mensaje", mensaje);

            if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                mav.setViewName("viewsAdmin/panelAdmin");
                System.out.println("el usuario es administrador");
            } else {
                mav.setViewName("panel/panel");
            }

        }
        return mav;

    }

    @RequestMapping("dids.htm")
    public ModelAndView Dids(HttpServletRequest request) {

        ModelAndView mav = new ModelAndView();

        try {
            sesion = request.getSession();

            if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                mav.setViewName("viewsAdmin/didsAdmin");
            } else {
                mav.setViewName("ayuda/dids");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            mensaje = "Ha ocurrido un error al obtener la vista";
            mav.addObject("mensaje", mensaje);

            if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                mav.setViewName("viewsAdmin/panelAdmin");
                System.out.println("el usuario es administrador");
            } else {
                mav.setViewName("panel/panel");
            }

        }
        return mav;
    }

    @RequestMapping(value = "getDids.htm", method = RequestMethod.GET)
    public ModelAndView getDids(HttpServletRequest request) {
        sesion = request.getSession();
        ModelAndView mav = new ModelAndView();

        if (sesion.getAttribute("usuario") == null) {
            mensaje = "No esta logeado para obtener las vistas";
            mav.addObject("mensaje", mensaje);
            mav.setViewName("login/login");

        } else {
            String state = request.getParameter("state");
            String area = request.getParameter("area");

            try {
                this.llenarDids(state, area);
                if (dids.isEmpty()) {
                    mensaje = "No se encontraron Dids para este estado ";
                    mav.addObject("state", state);
                    mav.addObject("area", area);
                    mav.addObject("mensaje", mensaje);

                    if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                        mav.setViewName("viewsAdmin/didsAdmin");
                    } else {
                        mav.setViewName("ayuda/dids");
                    }

                } else {
                    mensaje = "Dids Encontrados";
                    mav.addObject("state", state);
                    mav.addObject("area", area);
                    mav.addObject("dids", dids);
                    mav.addObject("mensaje", mensaje);
                    if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                        mav.setViewName("viewsAdmin/didsAdmin");
                    } else {
                        mav.setViewName("ayuda/dids");
                    }

                }
            } catch (Exception e) {

                mensaje = "LO SENTIMOS, NO SE HA PODIO CONECTAR CON EL SERVIDOR";

                mav.addObject("mensaje", mensaje);

                if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                    mav.setViewName("viewsAdmin/didsAdmin");
                } else {
                    mav.setViewName("ayuda/dids");
                }
                System.out.println("No se pudo obtener el historial de llamadas");
                e.printStackTrace();

            }
        }
        return mav;
    }

    public void llenarDids(String state, String area) {
        try {
            httpDids didsHelper = new httpDids();
            dids = didsHelper.getDids(state, area);
        } catch (Exception e) {
            System.out.println("No se pudo obtener el historial de recargas");
            e.printStackTrace();
        }

    }

}
