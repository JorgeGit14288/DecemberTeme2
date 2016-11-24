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
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.entitys.Usuarios;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jorge
 */
@Controller
public class UsuariosController {

    public UsuariosController() {

    }

    HttpSession sesion;
    String sesionUser;
    String mensaje;

    @RequestMapping("usuarios.htm")
    public ModelAndView getListUsuarios(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        sesion = request.getSession();
        if (sesion.getAttribute("usuario") == null) {
            mensaje = "Ingrese sus datos para poder ingresar al sistema";
            mav.addObject("mensaje", mensaje);
            mav.setViewName("login/login");

        } else {
            if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {

                UsuariosDao userDao = new UsuariosDao();
                List<Usuarios> listUser = userDao.getAllUsuarios();
                mav.addObject("listaUsuarios", listUser);
                //sesion.setAttribute("listaUsuarios", listUser);
                mav.setViewName("usuarios/usuarios");
            } else {
                mav.setViewName("panel/panel");
            }
        }
        return mav;
    }

    @RequestMapping(value = "editarUsuarios.htm", method = RequestMethod.GET)
    public ModelAndView getEditUsuarios(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        sesion = request.getSession();
        if (sesion.getAttribute("usuario") == null) {
            mensaje = "Ingrese sus datos para poder ingresar al sistema";
            mav.addObject("mensaje", mensaje);
            mav.setViewName("login/login");

        } else {

            String userId = request.getParameter("idUsuario");
            UsuariosDao userDao = new UsuariosDao();
            Usuarios usuario = userDao.getUsuario(userId);

            Telefonos telUser = new Telefonos();
            TelefonosDao telDao = new TelefonosDao();
            telUser = telDao.getTelUser(userId);

            if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                mav.addObject("usuario", usuario);
                mav.addObject("telUser", telUser);
                mav.setViewName("usuarios/editarUsuarios");
            } else {
                mav.addObject("usuario", usuario);
                mav.setViewName("panel/editarPerfil");
            }
        }
        return mav;
    }

    @RequestMapping(value = "validarEditarUsuario.htm", method = RequestMethod.POST)
    public ModelAndView getValidarEditarUsuarios(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        sesion = request.getSession();
        if (sesion.getAttribute("usuario") == null) {
            mensaje = "Ingrese sus datos para poder ingresar al sistema";
            mav.addObject("mensaje", mensaje);
            mav.setViewName("login/login");

        } else {

            String userId = request.getParameter("idUsuario");
            UsuariosDao userDao = new UsuariosDao();
            Usuarios usuario = userDao.getUsuario(userId);

            usuario.setTipoUsuario(request.getParameter("tipoUsuario"));
            usuario.setStatus(request.getParameter("status"));

            String nombres = request.getParameter("nombres");
            if (nombres != null) {
                usuario.setNombres(nombres);
            }
            String apellidos = request.getParameter("apellidos");
            if (apellidos != null) {
                usuario.setApellidos(apellidos);
            }
            String pais = request.getParameter("pais");
            if (pais != null) {
                usuario.setPais(pais);
            }
            String email = request.getParameter("email");
            if (email != null) {
                usuario.setEmail(email);
            }

            Telefonos telUser = new Telefonos();
            TelefonosDao telDao = new TelefonosDao();
            telUser = telDao.getTelUser(userId);

            if (userDao.updateUsuarios(usuario)) {
                System.out.println("Se ha actualizado el usuario");
                mensaje = "Se ha realizado la actualizacion";
                if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                    mav.addObject("usuario", usuario);
                    mav.addObject("telUser", telUser);
                    mav.setViewName("usuarios/editarUsuarios");
                } else {
                    mav.addObject("usuario", usuario);
                    mav.setViewName("panel/editarPerfil");
                }
            } else {
                System.out.println("No se ha podido realizar la actualizacion");
                mensaje = "No se ha realizado la actualizacion";
                if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                    mav.addObject("usuario", usuario);
                    mav.addObject("telUser", telUser);
                    mav.setViewName("usuarios/editarUsuarios");
                } else {
                    mav.addObject("usuario", usuario);
                    mav.setViewName("panel/editarPerfil");
                }
            }

            if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                mav.addObject("usuario", usuario);
                mav.addObject("telUser", telUser);
                mav.setViewName("usuarios/editarUsuarios");
            } else {
                mav.addObject("usuario", usuario);
                mav.setViewName("panel/editarPerfil");
            }
        }
        return mav;
    }
}
