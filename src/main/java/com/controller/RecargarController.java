/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.entitys.Detalles;
import com.jsonEntitys.Account;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.util.httpRecargar;
import com.jsonEntitys.ResultadoRecarga;
import com.util.httpAccount;

/**
 *
 * @author intercitydev
 */
@Controller
public class RecargarController {

    HttpSession sesion;
    String sesionUser;
    String mensaje;
    static String returnUrl = "http://customer.intercitytm.com/recargar.htm";
    static String returnUrl2 = "http://customer.intercitytm.com/recargar.htm";

    @RequestMapping(value = "recargar.htm", method = RequestMethod.GET)
    public ModelAndView getResultado(HttpServletRequest request) {
        sesion = request.getSession();
        ModelAndView mav = new ModelAndView();

        try {

            if (sesion.getAttribute("usuario") == null) {
                mensaje = "No esta logeado para obtener las vistas";
                mav.addObject("mensaje", mensaje);
                mav.setViewName("login/login");

            } else {

                String token = request.getParameter("token");
                ResultadoRecarga resRecarga = new ResultadoRecarga();

                if (token != null) {
                    httpRecargar recargasHelper = new httpRecargar();
                    resRecarga = recargasHelper.getResultadoRecarga(token);
                    String rsStatus = resRecarga.getRs_status();

                    Account account = new Account();
                    httpAccount accountHelper = new httpAccount();
                    Detalles cuenta = new Detalles();

                    cuenta = (Detalles) sesion.getAttribute("cuenta");

                    if (resRecarga.getCodeServer().compareTo("200") == 0) {
                        //cuenta.setSaldo(resRecarga.getAmount());

                        if (rsStatus.compareTo("COMPLETED") == 0) {
                            mensaje = "Transaccion Completa";
                            //cuenta.setSaldo(resRecarga.getAmount());
                            account = accountHelper.getAccountObject(cuenta.getTelefono());
                        } else if (rsStatus.compareTo("REGISTERED") == 0) {
                            mensaje = "La Transacion aun esta en proceso";
                        } else if (rsStatus.compareTo("VERIFYING") == 0) {
                            mensaje = "La transaccion ha sido procesada en pagadito, pero ha quedado en "
                                    + "verificacion, en este punto el cobro ha quedado en validacion administrativa"
                                    + "Posteriormente la transaccion puede marcarse como valida o denegada< por lo que se debe de "
                                    + "monitorear mediante esta funcion hasta que su estado cambie a completado o revocado, \n "
                                    + "el dodigo de la transaccion es " + resRecarga.getToken();
                        } else if (rsStatus.compareTo("REVOKED") == 0) {
                            mensaje = "Lo sentimos, la transaccion de su recarga ha sido deneada en pagadito, consulete al "
                                    + "administrador del sistema, Gracias";
                        } else if (rsStatus.compareTo("FAILED") == 0) {
                            mensaje = "La Transaccion ha fallado, por favor intente de nuevo";
                        } else if (rsStatus.compareTo("null") == 0) {
                            mensaje = "El servidor no ha respondido correctamente, vuelva a intentar en otro momento a verificar su transaccion";
                        }

                    } else {

                        mensaje = "No se ha encontrado informacion a cerca de la recarga";

                    }
                    mav.addObject("mensaje", mensaje);
                    mav.addObject("resRecarga", resRecarga);
                    mav.addObject("cuenta", cuenta);
                    if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                        mav.setViewName("viewsAdmin/recargarAdmin");
                        System.out.println("El usuario es administrador ");
                    } else {

                        mav.setViewName("recargar/recargar");
                    }
                } else {

                    mensaje = "No se ha recibido el token del servidor de pago";
                    mav.addObject("mensaje", mensaje);

                    if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {

                        mav.setViewName("viewsAdmin/recargarAdmin");
                        System.out.println("El usuario es administrador ");
                    } else {

                        mav.setViewName("recargar/recargar");
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("Ha ocurrido un error de validacion en el servidor ");
            mav.addObject("mensaje", mensaje);

            if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {

                mav.setViewName("viewsAdmin/recargarAdmin");
                System.out.println("El usuario es administrador ");
            } else {

                mav.setViewName("recargar/recargar");
            }

        }
        return mav;

    }

    @RequestMapping(value = "postRecargar.htm", method = RequestMethod.GET)
    public ModelAndView postRecargar(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        sesion = request.getSession();
        Detalles cuenta = new Detalles();

        try {

            cuenta = (Detalles) sesion.getAttribute("cuenta");
            String amount = request.getParameter("amount");
            String details = "Relizando una recarga ";
            String accountid = cuenta.getAccountId();

            // System.out.print("Se realizara una recarga a "+cuenta.getAccountId() + " monto "+amount);
            String datoRecarga = ("Account " + cuenta.getAccountId() + " monot " + amount + " urlRetorno " + returnUrl + " Detalles " + details);
            System.out.println(datoRecarga);

            if (sesion.getAttribute("usuario") == null) {
                mensaje = "No esta logeado para obtener las vistas";
                mav.addObject("mensaje", mensaje);
                mav.setViewName("login/login");

            } else {

                httpRecargar recargarHelper = new httpRecargar();
                String redirect = recargarHelper.getRecargar(accountid, amount, returnUrl, details);
                String urlRedirect = "redirect:" + redirect;
                System.out.println(urlRedirect);

                if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {

                    System.out.println("El usuario es administrador ");
                    mav.addObject("datoRecarga", datoRecarga);
                    //mav.setViewName("viewsAdmin/recargarAdmin");
                    mav.setViewName(urlRedirect);
                } else {
                    //mav.setViewName("recargar/recargar");
                    mav.addObject("datoRecarga", datoRecarga);
                    mav.setViewName(urlRedirect);
                }
            }
        } catch (Exception e) {
            if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {

                System.out.println("El usuario es administrador ");

                mav.setViewName("panel/panel");
            } else {

                mav.setViewName("viewsAdmin/panel");

            }
        }
        return mav;

    }
}
