/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.dao.TelefonosDao;
import com.dao.UsuariosDao;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.entitys.Telefonos;
import com.entitys.Usuarios;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.SessionAttributes;

/**
 *
 * @author jorge
 */
@Controller
@SessionAttributes({"userSession"})
public class TelefonosController {

    HttpSession sesion;
    String sesionUser;
    String mensaje;

    //creando un metodo para guaradar el login
    // metodo que devuele la vista index de los usuarios, en donde se muestran los usuarios registrados
    @RequestMapping("telefonos.htm")
    public ModelAndView getUsuarios(HttpServletRequest request) {

        ModelAndView mav = new ModelAndView();

        try {
            sesion = request.getSession();

            if (sesion.getAttribute("usuario") == null) {
                mensaje = "Please login to the system";
                mav.addObject("mensaje", mensaje);
                mav.setViewName("login/login");
            } else {
                TelefonosDao userHelper = new TelefonosDao();
                mensaje = null;
                TelefonosDao telDao = new TelefonosDao();
                List<Telefonos> listTelefonos = telDao.getAllTelefonos();
                if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                    System.out.println("Vista Administrador");

                    mav.addObject("listaTelefonos", listTelefonos);
                    mav.setViewName("telefonos/telefonos");
                } else {
                    mav.setViewName("panel/panel");
                }

            }
        } catch (Exception ex) {
            ex.printStackTrace();
            mensaje = "Sorry, view unavailable at this time";
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

    // este medoto recibe el numero del telefono del usuario, para mostrar su configuracion.
    @RequestMapping(value = "editarTelefonos.htm", method = RequestMethod.GET)
    public ModelAndView editar(HttpServletRequest request) {

        ModelAndView mav = new ModelAndView();
        try {
            sesion = request.getSession();
            if (sesion.getAttribute("usuario") == null) {
                mensaje = "Please login to the system";
                mav.addObject("mensaje", mensaje);
                mav.setViewName("login/login");

            } else {

                String idTelefono = request.getParameter("idTelefono");
                Telefonos telefono = new Telefonos();
                TelefonosDao telDao = new TelefonosDao();
                telefono = telDao.getTelefono(idTelefono);

                Usuarios usuario = new Usuarios();
                UsuariosDao userDao = new UsuariosDao();
                usuario = userDao.getUsuario(telefono.getUsuarios().getIdUsuario());
                System.out.println(usuario.getApellidos());

                if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                    mav.addObject("usuario", usuario);
                    mav.addObject("telefono", telefono);
                    mav.setViewName("telefonos/editarTelefonos");
                } else {
                    mav.addObject("usuario", usuario);
                    mav.setViewName("panel/editarPerfil");
                }

            }
        } catch (Exception ex) {
            ex.printStackTrace();
            mensaje = "Sorry, view unavailable at this time";
            mav.addObject("mensaje", mensaje);

            if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                mav.setViewName("telefonos/editarTelefonos");
                System.out.println("el usuario es administrador");
            } else {
                mav.setViewName("panel/editarPerfil");
            }

        }
        return mav;
    }

    // este medoto recibe el numero del telefono del usuario, para mostrar su configuracion.
    @RequestMapping(value = "validarEditarTelefono.htm", method = RequestMethod.POST)
    public ModelAndView validarEditarRelefono(HttpServletRequest request) {

        ModelAndView mav = new ModelAndView();
        try {
            sesion = request.getSession();
            if (sesion.getAttribute("usuario") == null) {
                mensaje = "Please login to the system";
                mav.addObject("mensaje", mensaje);
                mav.setViewName("login/login");

            } else {

                String idTelefono = request.getParameter("idTelefono");
                Telefonos telefono = new Telefonos();
                TelefonosDao telDao = new TelefonosDao();
                telefono = telDao.getTelefono(idTelefono);

                telefono.setStatus(request.getParameter("status"));

                Usuarios usuario = new Usuarios();
                UsuariosDao userDao = new UsuariosDao();

                usuario = userDao.getUsuario(telefono.getUsuarios().getIdUsuario());

                if (telDao.updateTelefono(telefono)) {
                    System.out.println("Se ha acutailzado el estado del telefono");
                    mensaje = "Phone status updated";
                    if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                        mav.addObject("usuario", usuario);
                        mav.addObject("telefono", telefono);
                        mav.addObject("mensaje", mensaje);
                        mav.setViewName("telefonos/editarTelefonos");
                    } else {
                        mav.addObject("usuario", usuario);
                        mav.addObject("mensaje", mensaje);
                        mav.setViewName("panel/editarPerfil");
                    }
                } else {
                    System.out.println("Error, phone status not updated");
                    mensaje = "No se ha realizado el cambio";
                    if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                        mav.addObject("usuario", usuario);
                        mav.addObject("telefono", telefono);
                        mav.setViewName("telefonos/editarTelefonos");
                    } else {
                        mav.addObject("usuario", usuario);
                        mav.setViewName("panel/editarPerfil");
                    }
                }

            }
        } catch (Exception ex) {
            ex.printStackTrace();
            mensaje = "Sorry, view unavailable at this time";
            mav.addObject("mensaje", mensaje);

            if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                mav.setViewName("telefonos/editarTelefonos");
                System.out.println("el usuario es administrador");
            } else {
                mav.setViewName("panel/editarPerfil");
            }

        }
        return mav;
    }
}
