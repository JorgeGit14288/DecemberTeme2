/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.dao.TelefonosDao;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.entitys.Telefonos;
import com.dao.UsuariosDao;
import com.entitys.Usuarios;
import com.util.Cifrar;
import com.util.GeneradorCodigos;
import com.util.httpAccount;
import com.util.httpSendMsg;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 *
 * @author jorge
 */
@Controller
@SessionAttributes({"userSession"})
public class RegistrarController {

    HttpSession sesion;
    String codigo;
    int contador = 0;
    private Usuarios userP;
    private Telefonos telP;
    String mensaje;

    public Usuarios getUserP() {
        return userP;
    }

    public void setUserP(Usuarios userP) {
        this.userP = userP;
    }

    public Telefonos getTelP() {
        return telP;
    }

    public void setTelP(Telefonos telP) {
        this.telP = telP;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public HttpSession getSesion() {
        return sesion;
    }

    public void setSesion(HttpSession sesion) {
        this.sesion = sesion;
    }

    @RequestMapping("registrar.htm")
    public ModelAndView Registrar() {
        ModelAndView mav = new ModelAndView();
        try {
            mav.setViewName("telefonos/registrar");
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

    @RequestMapping(value = "validarRegistro.htm", method = RequestMethod.POST)
    public ModelAndView ValidarRegistro(HttpServletRequest request) {
        String mensaje = null;
        sesion = request.getSession();
        ModelAndView mav = new ModelAndView();
        Telefonos telefono = new Telefonos();
        UsuariosDao userDao = new UsuariosDao();
        try {
            //cargamos los datos en un objeto usuario
            telefono.setCodigoArea(request.getParameter("codigo"));
            telefono.setTelefono(request.getParameter("telefono"));
            telefono.setTelefonoArea(telefono.getCodigoArea() + "-" + telefono.getTelefono());
            telefono.setStatus("Activo");
            Cifrar varCifrar = new Cifrar();
            String pass = varCifrar.Encriptar(request.getParameter("password"));
            //telefono.setPassword(pass);

            Usuarios usuario = new Usuarios();
            int idi = userDao.countUsuarios();
            String id = "icu0" + idi;
            usuario.setIdUsuario(id);
            usuario.setPassword(pass);
            usuario.setNombres(request.getParameter("nombres"));
            usuario.setApellidos(request.getParameter("apellidos"));
            usuario.setStatus("Activo");
            usuario.setTipoUsuario("Estandar");
            this.setTelP(telefono);
            this.setUserP(usuario);
            this.createCodigo();
            String telArea = telefono.getCodigoArea() + telefono.getTelefono();
            System.out.print("enviando el codigo a " + telArea);
            String mensajeCodigo = "InterCity Registration Code " + this.getCodigo();
            System.err.print(mensajeCodigo);
            httpSendMsg msgHelper = new httpSendMsg();
            String resultmsg = msgHelper.sendMsg(telArea, mensajeCodigo);
            mav.setViewName("telefonos/confirmPhone");

        } catch (Exception e) {
            mensaje = null;
            e.printStackTrace();
            mensaje = "Sorry, service is not available, try later ";
            mav.setViewName("telefonos/registrar");
        }
        mav.addObject("mensaje", mensaje);

        return mav;
    }

    public String createCodigo() {
        GeneradorCodigos codigosHelper = new GeneradorCodigos();
        String varCod = codigosHelper.getCodigo();
        //System.out.print(varCod);
        return varCod;
    }

    @RequestMapping("confirmPhone.htm")
    public ModelAndView getConfirm() {

        ModelAndView mav = new ModelAndView();
        try {
            mensaje = null;
            mensaje = "Enter the code you received on your phone " ;

            mav.addObject("mensaje", mensaje);
            mav.setViewName("telefonos/confirmPhone");
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

    @RequestMapping(value = "validarPhone.htm", method = RequestMethod.POST)
    public ModelAndView ValidarPhone(HttpServletRequest request) {
        String mensaje = null;
        sesion = request.getSession();
        ModelAndView mav = new ModelAndView();
        String codigo2 = request.getParameter("codigo");
        try {

            if (this.getCodigo().compareTo(codigo2) == 0) {

                Telefonos telefono = new Telefonos();
                telefono = this.getTelP();
                Usuarios usuario = this.getUserP();
                TelefonosDao telDao = new TelefonosDao();
                UsuariosDao userDao = new UsuariosDao();
                telefono.setCodigoConfirm(this.getCodigo());

                if (userDao.createUsuarios(usuario)) {
                    telefono.setUsuarios(usuario);
                    String sesUser = telefono.getTelefonoArea();

                    httpAccount accountHelper = new httpAccount();

                    usuario.setIdAccount(accountHelper.getIdAccount(sesUser));
                    userDao.updateUsuarios(usuario);

                    if (telDao.createTelefono(telefono) == true) {
                        mensaje = null;
                        sesUser = telefono.getTelefonoArea();

                        sesion.setAttribute("usuario", sesUser);
                        sesion.setAttribute("tipoUsuario", usuario.getTipoUsuario());
                        mensaje = "Welcome";
                        this.createCodigo();
                        mav.setViewName("telefonos/confirmPhone");
                        System.out.print("se ha creado un usuario");
                    } else {
                        mensaje = null;
                        mensaje = "Could not register the phone number";
                        mav.setViewName("telefonos/registrar");
                        System.out.print("NO SE ha creado un usuario");
                    }
                } else {
                    mensaje = null;
                    mensaje = "Could not create user";
                    mav.setViewName("telefonos/registrar");
                }

                if (telDao.updateTelefono(telefono)) {

                    if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                        mav.setViewName("viewsAdmin/panelAdmin");
                        System.out.println("el usuario es administrador");
                    } else {
                        mav.setViewName("panel/panel");
                    }

                } else {
                    mensaje = "The code is correct but could not be loaded into your account";
                    mav.addObject("mensaje", mensaje);
                    mav.setViewName("usuarios/confirmPhone");
                }
            } else {

                mensaje = "The code you entered is not correct, please try again.";
                mav.addObject("mensaje", mensaje);
                mav.setViewName("telefonos/confirmPhone");
            }

        } catch (Exception e) {
          e.printStackTrace();
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

    @ModelAttribute("codigo")
    public String obtenerCodigo() {

        if (this.getCodigo() == null) {
            this.setCodigo(this.createCodigo());
            return this.getCodigo();

        } else {
            return this.getCodigo();
            // return this.createCodigo();
        }
    }

}
