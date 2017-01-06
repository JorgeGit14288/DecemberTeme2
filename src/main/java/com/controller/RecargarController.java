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

        ModelAndView mav = new ModelAndView();

        try {
            sesion = request.getSession();

            if (sesion.getAttribute("usuario") == null) {
                mensaje = "Please log in";
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

                        account = accountHelper.getAccountObject(cuenta.getTelefono());
                        cuenta.setSaldo(account.getBalance());
                        sesion.setAttribute("cuenta", cuenta);

                        if (rsStatus.compareTo("COMPLETED") == 0) {
                            mensaje = "Transaction successfully completed";
                            //cuenta.setSaldo(resRecarga.getAmount());

                        } else if (rsStatus.compareTo("REGISTERED") == 0) {
                            mensaje = "The Transaction is still in process";
                        } else if (rsStatus.compareTo("VERIFYING") == 0) {
                            mensaje = " "
                                    + "The transaction has been processed in the payment server, but has remained pending administrative validation of the same, then the transaction can be validated or denied, so it should be monitored by this means, the code of the transaction is: " + resRecarga.getToken();
                        } else if (rsStatus.compareTo("REVOKED") == 0) {
                            mensaje = "Sorry, the transaction of your recharge has been denied in paid, consulete, contact us for more information ";                        } else if (rsStatus.compareTo("FAILED") == 0) {
                            mensaje = "Transaction has failed, please try again";
                        } else if (rsStatus.compareTo("null") == 0) {
                            mensaje = "The server did not respond correctly, try again at another time to verify your transaction";
                        }

                    } else {

                        mensaje = "No information found about the recharge";
                        mav.setViewName("panel/panel");

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

                    mensaje = "Payment server token was not received";
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
            System.out.println("A validation error has occurred on the server ");
            mav.addObject("mensaje", mensaje);

            if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {

                mav.setViewName("viewsAdmin/panelAdmin");
                System.out.println("El usuario es administrador ");
            } else {

                mav.setViewName("panel/panel");
            }

        }
        return mav;

    }

    @RequestMapping(value = "postRecargar.htm", method = RequestMethod.GET)
    public ModelAndView postRecargar(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();

        try {
            sesion = request.getSession();

            if (sesion.getAttribute("usuario") == null) {
                mensaje = "No esta logeado para obtener las vistas";
                mav.addObject("mensaje", mensaje);
                mav.setViewName("login/login");

            } else {
                Detalles cuenta = new Detalles();
                cuenta = (Detalles) sesion.getAttribute("cuenta");
                String amount = request.getParameter("amount");
                String details = "Details: Amount=$" +amount+" phone "+cuenta.getTelefono()+" Thanks";
                String accountid = cuenta.getAccountId();

                // System.out.print("Se realizara una recarga a "+cuenta.getAccountId() + " monto "+amount);
                String datoRecarga = ("Account " + cuenta.getAccountId() + " monot " + amount + " urlRetorno " + returnUrl + " Detalles " + details);
                System.out.println(datoRecarga);

                httpRecargar recargarHelper = new httpRecargar();
                String redirect = recargarHelper.getRecargar(accountid, amount, returnUrl, details);
                String urlRedirect = null;
                if (redirect == null) {
                    redirect = "panel/panel.htm";
                    urlRedirect = redirect;
                    mensaje = "El servidor de recargas no esta disponible, Disculpe";

                } else {
                    urlRedirect = "redirect:" + redirect;
                    System.out.println(urlRedirect);
                }
                mav.addObject("mensaje", mensaje);

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
