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
import com.jsonEntitys.Llamadas;
import com.jsonEntitys.Recarga;
import com.util.ConvertirFecha;
import com.util.httpHistorial;
import com.util.httpRecargas;
import java.text.ParseException;
import java.util.Calendar;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author jorge
 */
@Controller
public class HistorialController {

    HttpSession sesion;
    String sesionUser;
    String mensaje;
    String startDate;
    String endDate;
    String destination = "";
    String idAccount;
    int pagenext;
    int pageprevius;
    int page = 1;
    int max = 10;
    List<Llamadas> llamadas;
    List<Recarga> recargas;

    @RequestMapping("historial.htm")
    public ModelAndView Historial(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();

        try {
            sesion = request.getSession();

            if (sesion.getAttribute("usuario") == null) {

                mav.setViewName("login/login");

            } else {

                // Para obtener las fechas a mandar
                Calendar c = Calendar.getInstance();
                int dia = c.get(Calendar.DAY_OF_MONTH);

                int mes = c.get(Calendar.MONTH);
                int year = c.get(Calendar.YEAR);
                mes = mes + 1;
                String fechaActual = dia + "/" + mes + "/" + year;
                System.out.println("Fecha acual " + fechaActual);

                int mesAnterior;
                int yearAnterior;

                if (mes == 1) {
                    mesAnterior = 12;
                    yearAnterior = year - 1;
                } else {
                    mesAnterior = mes - 1;
                    yearAnterior = year;
                }

                String fechaAnterior = dia + "/" + mesAnterior + "/" + yearAnterior;
                System.out.println("La fecha de un mes anterior es " + fechaAnterior);
                startDate = fechaAnterior;
                endDate = fechaActual;
                //fin fecha

                try {
                    String telUser = sesion.getAttribute("usuario").toString();
                    Usuarios usuario = new Usuarios();
                    UsuariosDao userDao = new UsuariosDao();
                    Telefonos telefono = new Telefonos();
                    TelefonosDao telDao = new TelefonosDao();
                    telefono = telDao.getTelefono(telUser);
                    usuario = userDao.getUsuario(telefono.getUsuarios().getIdUsuario());
                    idAccount = usuario.getIdAccount();
                    String endDate2 = endDate + " 23:59:00";
                    String startDate2 = startDate + " 00:00:00";

                    System.out.println(idAccount + " " + page + " " + max + " " + startDate2 + " " + endDate2 + " " + destination + " ");
                    this.llenarHistorial(idAccount, startDate2, endDate2, String.valueOf(page), String.valueOf(max), destination);
                    if (llamadas.isEmpty()) {
                        mensaje = "No se realizaron llamadas en los ultimos 30 dias";
                        mav.addObject("startDate", startDate);
                        mav.addObject("endDate", endDate);
                        mav.addObject("page", page);
                        mav.addObject("pagenext", pagenext);
                        mav.addObject("pageprevius", pageprevius);
                        mav.addObject("max", max);
                        mav.addObject("destination", destination);
                        mav.addObject("mensaje", mensaje);

                        if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                            mav.setViewName("viewsAdmin/historialAdmin");
                        } else {
                            mav.setViewName("historial/historial");
                        }

                    } else {
                        mensaje = "HISTORIAL DE LLAMADAS DE LOS ULTIMOS 30 DIAS ";
                        mav.addObject("startDate", startDate);
                        mav.addObject("endDate", endDate);
                        mav.addObject("pagenext", pagenext);
                        mav.addObject("pageprevius", pageprevius);
                        mav.addObject("page", page);
                        mav.addObject("max", max);
                        mav.addObject("destination", destination);
                        mav.addObject("llamadas", llamadas);
                        mav.addObject("mensaje", mensaje);
                        if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                            mav.setViewName("viewsAdmin/historialAdmin");
                        } else {
                            mav.setViewName("historial/historial");
                        }

                    }
                } catch (Exception e) {

                    mensaje = "LO SENTIMOS, NO SE HA PODIO CONECTAR CON EL SERVIDOR";
                    mav.addObject("startDate", startDate);
                    mav.addObject("endDate", endDate);
                    mav.addObject("page", page);
                    mav.addObject("pagenext", pagenext);
                    mav.addObject("pageprevius", pageprevius);
                    mav.addObject("max", max);
                    mav.addObject("destination", destination);
                    mav.addObject("mensaje", mensaje);

                    if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                        mav.setViewName("viewsAdmin/historialAdmin");
                    } else {
                        mav.setViewName("historial/historial");
                    }
                    System.out.println("No se pudo obtener el historial de llamadas");
                    e.printStackTrace();

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

    @RequestMapping(value = "getHistorial.htm", method = RequestMethod.GET)
    public ModelAndView getHistorial(HttpServletRequest request) throws ParseException {
        ModelAndView mav = new ModelAndView();

        try {
            sesion = request.getSession();

            if (sesion.getAttribute("usuario") == null) {
                mensaje = "No esta logeado para obtener las vistas";
                mav.addObject("mensaje", mensaje);
                mav.setViewName("login/login");

            } else {
                String telUser = sesion.getAttribute("usuario").toString();
                Usuarios usuario = new Usuarios();
                UsuariosDao userDao = new UsuariosDao();
                Telefonos telefono = new Telefonos();
                TelefonosDao telDao = new TelefonosDao();
                telefono = telDao.getTelefono(telUser);
                usuario = userDao.getUsuario(telefono.getUsuarios().getIdUsuario());
                idAccount = usuario.getIdAccount();

                //String idAccount = "22";
                String max2 = request.getParameter("max");
                String startDate2 = request.getParameter("startDate");
                String endDate2 = request.getParameter("endDate");
                String destination2 = request.getParameter("destination");
                String page2 = request.getParameter("page");

                if (max2 != null) {
                    max = Integer.valueOf(max2);
                }
                if (startDate2 != null) {
                    startDate = startDate2;
                }
                if (endDate2 != null) {
                    endDate = endDate2;
                }
                if (destination2 != null) {
                    destination = destination2;
                }
                if (page2 != null) {
                    page = Integer.parseInt(page2);
                }
                if (page == 1) {
                    pageprevius = 1;
                } else {
                    pageprevius = page - 1;
                }

                pagenext = page + 1;
                ConvertirFecha convertir = new ConvertirFecha();

                String startFecha = convertir.StringFecha(startDate);
                String endFecha = convertir.StringFecha(endDate);

                System.out.println("\n\n LAS FECHAS BUSCADAS SON " + startFecha + "\n\n " + endFecha);

                System.out.println(idAccount + " " + page + " " + max + " " + startFecha + " " + endFecha + " " + destination + " ");

                try {
                    this.llenarHistorial(idAccount, startFecha, endFecha, String.valueOf(page), String.valueOf(max), destination);
                    if (llamadas.isEmpty()) {
                        mensaje = "No Existe registro de llamadas en las fechas comprendidas";
                        mav.addObject("startDate", startDate);
                        mav.addObject("endDate", endDate);
                        mav.addObject("page", page);
                        mav.addObject("pagenext", pagenext);
                        mav.addObject("pageprevius", pageprevius);
                        mav.addObject("max", max);
                        mav.addObject("destination", destination);
                        mav.addObject("mensaje", mensaje);

                        if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                            mav.setViewName("viewsAdmin/historialAdmin");
                        } else {
                            mav.setViewName("historial/historial");
                        }

                    } else {
                        mensaje = "Llamadas Realizadas en las fechas comprendidas ";
                        mav.addObject("startDate", startDate);
                        mav.addObject("endDate", endDate);
                        mav.addObject("pagenext", pagenext);
                        mav.addObject("pageprevius", pageprevius);
                        mav.addObject("page", page);
                        mav.addObject("max", max);
                        mav.addObject("destination", destination);
                        mav.addObject("llamadas", llamadas);
                        mav.addObject("mensaje", mensaje);
                        if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                            mav.setViewName("viewsAdmin/historialAdmin");
                        } else {
                            mav.setViewName("historial/historial");
                        }

                    }
                } catch (Exception e) {

                    mensaje = "LO SENTIMOS, NO SE HA PODIO CONECTAR CON EL SERVIDOR";
                    mav.addObject("startDate", startDate);
                    mav.addObject("endDate", endDate);
                    mav.addObject("page", page);
                    mav.addObject("pagenext", pagenext);
                    mav.addObject("pageprevius", pageprevius);
                    mav.addObject("max", max);
                    mav.addObject("destination", destination);
                    mav.addObject("mensaje", mensaje);

                    if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                        mav.setViewName("viewsAdmin/historialAdmin");
                    } else {
                        mav.setViewName("historial/historial");
                    }
                    System.out.println("No se pudo obtener el historial de llamadas");
                    e.printStackTrace();

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

    public void llenarHistorial(String idAccount, String startDate, String endDate, String page, String max, String destination) {

        httpHistorial historial = new httpHistorial();
        this.llamadas = historial.getHistorial(idAccount, page, max, startDate, endDate, destination);
    }

    public void llenarRecargas(String idAccount, String startDate, String endDate, String page, String max) {
        try {
            httpRecargas recargaHelper = new httpRecargas();
            recargas = recargaHelper.getRecargas(idAccount, page, max, startDate, endDate);
        } catch (Exception e) {
            System.out.println("No se pudo obtener el historial de recargas");
            e.printStackTrace();
        }

    }

    @RequestMapping("recargas.htm")
    public ModelAndView Recargas(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        try {
            sesion = request.getSession();

            if (sesion.getAttribute("usuario") == null) {
                mensaje = "No esta logeado para obtener las vistas";
                mav.addObject("mensaje", mensaje);
                mav.setViewName("login/login");

            } else {

                // Para obtener las fechas a mandar
                Calendar c = Calendar.getInstance();
                int dia = c.get(Calendar.DAY_OF_MONTH);

                int mes = c.get(Calendar.MONTH);
                int year = c.get(Calendar.YEAR);
                mes = mes + 1;
                String fechaActual = year + "-" + mes + "-" + dia;
                System.out.println("Fecha acual " + fechaActual);

                int mesAnterior;
                int yearAnterior;

                if (mes == 1) {
                    mesAnterior = 12;
                    yearAnterior = year - 1;
                } else {
                    mesAnterior = mes - 1;
                    yearAnterior = year;
                }

                String fechaAnterior = yearAnterior + "-" + mesAnterior + "-" + dia;
                System.out.println("La fecha de un mes anterior es " + fechaAnterior);
                startDate = fechaAnterior;
                endDate = fechaActual;

                //fin fechas
                page = 1;
                pagenext = page + 1;
                pageprevius = page - 1;
                mav.addObject("pagenext", pagenext);
                mav.addObject("pageprevius", pageprevius);
                mav.addObject("page", page);
                mav.addObject("max", max);
                String endDate2 = endDate + " 23:59:00";
                String startDate2 = startDate + " 00:00:00";
                System.out.println("account" + idAccount + " page  " + page + " max " + max + " startDate " + startDate2 + " endDate " + endDate2);

                try {
                    this.llenarRecargas(idAccount, startDate, endDate, String.valueOf(page), String.valueOf(max));

                    if (recargas.isEmpty()) {
                        System.out.println("No se encontraron recargas en los ultimos 30 dias");
                        mensaje = "No se encontraron recargas en los ultimos 30 dias";
                        mav.addObject("startDate", startDate);
                        mav.addObject("endDate", endDate);
                        mav.addObject("page", page);
                        mav.addObject("pagenext", pagenext);
                        mav.addObject("pageprevius", pageprevius);
                        mav.addObject("max", max);
                        mav.addObject("mensaje", mensaje);
                        mav.addObject("recargas", this.recargas);

                        if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                            mav.setViewName("viewsAdmin/recargasAdmin");
                            System.out.println("el usuario es administrador");
                        } else {
                            mav.setViewName("historial/recargas");
                        }

                    } else {
                        System.out.println("Recargas realizadas en los ultimos 30 dias");
                        mensaje = "Recargas realizadas en los ultimos 30 dias";

                        mav.addObject("startDate", startDate);
                        mav.addObject("endDate", endDate);
                        mav.addObject("pagenext", pagenext);
                        mav.addObject("pageprevius", pageprevius);
                        mav.addObject("page", page);
                        mav.addObject("max", max);
                        mav.addObject("recargas", this.recargas);
                        mav.addObject("mensaje", mensaje);

                        if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                            mav.setViewName("viewsAdmin/recargasAdmin");
                        } else {
                            mav.setViewName("historial/recargas");
                        }
                    }

                } catch (Exception e) {
                    mensaje = "LO SENTIMOS, NO SE HA PODIDO CONECTAR CON EL SERVIDOR";
                    mav.addObject("startDate", startDate);
                    mav.addObject("endDate", endDate);
                    mav.addObject("page", page);
                    mav.addObject("pagenext", pagenext);
                    mav.addObject("pageprevius", pageprevius);
                    mav.addObject("max", max);
                    mav.addObject("mensaje", mensaje);

                    if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                        mav.setViewName("viewsAdmin/recargasAdmin");
                        System.out.println("el usuario es administrador");
                    } else {
                        mav.setViewName("historial/recargas");
                    }

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

    @RequestMapping(value = "getRecargas.htm", method = RequestMethod.GET)
    public ModelAndView getRecargas(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        try {
            sesion = request.getSession();

            if (sesion.getAttribute("usuario") == null) {
                mensaje = "No esta logeado para obtener las vistas";
                mav.addObject("mensaje", mensaje);
                mav.setViewName("login/login");

            } else {

                String telUser = sesion.getAttribute("usuario").toString();
                Usuarios usuario = new Usuarios();
                UsuariosDao userDao = new UsuariosDao();
                Telefonos telefono = new Telefonos();
                TelefonosDao telDao = new TelefonosDao();
                telefono = telDao.getTelefono(telUser);
                usuario = userDao.getUsuario(telefono.getUsuarios().getIdUsuario());
                idAccount = usuario.getIdAccount();

                //String idAccount = "22";
                String max2 = request.getParameter("max");
                String startDate2 = request.getParameter("startDate");
                String endDate2 = request.getParameter("endDate");
                String destination2 = request.getParameter("destination");
                String page2 = request.getParameter("page");
                if (max2 != null) {
                    max = Integer.valueOf(max2);
                }
                if (startDate2 != null) {
                    startDate = startDate2;
                }
                if (endDate2 != null) {
                    endDate = endDate2;
                }
                if (destination2 != null) {
                    destination = destination2;
                }
                if (page2 != null) {
                    page = Integer.parseInt(page2);
                }
                if (page == 1) {
                    pageprevius = 1;
                } else {
                    pageprevius = page - 1;
                }

                pagenext = page + 1;

                System.out.println("\n\n LAS FECHAS BUSCADAS SON " + startDate + "\n\n " + endDate);

                System.out.println("account" + idAccount + " page  " + page + " max " + max + " startDate " + startDate + " endDate " + endDate);

                try {
                    this.llenarRecargas(idAccount, startDate, endDate, String.valueOf(page), String.valueOf(max));

                    if (recargas.isEmpty()) {
                        System.out.println("No se encontraron recargas en las fechas comprendidas");
                        mensaje = "No Existe historial de llamadas en las fechas comprendidas";
                        mav.addObject("startDate", startDate);
                        mav.addObject("endDate", endDate);
                        mav.addObject("page", page);
                        mav.addObject("pagenext", pagenext);
                        mav.addObject("pageprevius", pageprevius);
                        mav.addObject("max", max);
                        mav.addObject("mensaje", mensaje);
                        mav.addObject("recargas", this.recargas);

                        if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                            mav.setViewName("viewsAdmin/recargasAdmin");
                            System.out.println("el usuario es administrador");
                        } else {
                            mav.setViewName("historial/recargas");
                        }

                    } else {
                        System.out.println("Recargas realizadas en las fechas comprendidas");
                        mensaje = "Recargas realizadas en las fechas comprendidas";

                        mav.addObject("startDate", startDate);
                        mav.addObject("endDate", endDate);
                        mav.addObject("pagenext", pagenext);
                        mav.addObject("pageprevius", pageprevius);
                        mav.addObject("page", page);
                        mav.addObject("max", max);
                        mav.addObject("recargas", this.recargas);
                        mav.addObject("mensaje", mensaje);

                        if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                            mav.setViewName("viewsAdmin/recargasAdmin");
                        } else {
                            mav.setViewName("historial/recargas");
                        }
                    }

                } catch (Exception e) {
                    mensaje = "LO SENTIMOS, NO SE HA PODIDO CONECTAR CON EL SERVIDOR";
                    mav.addObject("startDate", startDate);
                    mav.addObject("endDate", endDate);
                    mav.addObject("page", page);
                    mav.addObject("pagenext", pagenext);
                    mav.addObject("pageprevius", pageprevius);
                    mav.addObject("max", max);
                    mav.addObject("mensaje", mensaje);

                    if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                        mav.setViewName("viewsAdmin/recargasAdmin");
                        System.out.println("el usuario es administrador");
                    } else {
                        mav.setViewName("historial/recargas");
                    }

                }

            }
        } catch (Exception ex) {
            ex.printStackTrace();
            mensaje = "Ha ocurrido un error al obtener la vista";
            mav.addObject("mensaje", mensaje);
            if (sesion.getAttribute("tipoUsuario").toString().compareTo("Administrador") == 0) {
                mav.setViewName("viewsAdmin/recargasAdmin");
                System.out.println("el usuario es administrador");
            } else {
                mav.setViewName("historial/recargas");
            }

        }
        return mav;
    }

}
