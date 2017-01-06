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
    int pagenext = 2;
    int pageprevius = 1;
    int page = 1;
    int max = 15;
    int totalPages = 1;
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

                ConvertirFecha convertir = new ConvertirFecha();
                String startFecha = convertir.StringFecha(startDate);
                String endFecha = convertir.StringFecha(endDate);

                System.out.println("\n\n LAS FECHAS BUSCADAS SON " + startDate + "\n\n " + endDate);

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

                    System.out.println("id account = " + idAccount + " " + page + " " + max + " " + startDate2 + " " + endDate2 + " " + destination + " ");
                    this.llenarHistorial(idAccount, startFecha, endFecha, String.valueOf(page), String.valueOf(max), destination);
                    if (totalPages == 1) {
                        pagenext = 1;
                    }
                    if (llamadas.isEmpty()) {
                        mensaje = "There is no call log for the last 30 days";
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

                        mensaje = "Call history for the last 30 days";
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

                    mensaje = "Sorry, service is not available, try later";
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

    @RequestMapping(value = "getHistorial.htm", method = RequestMethod.GET)
    public ModelAndView getHistorial(HttpServletRequest request) throws ParseException {
        ModelAndView mav = new ModelAndView();

        try {
            sesion = request.getSession();

            if (sesion.getAttribute("usuario") == null) {
                mensaje = "Please login to the system";
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
                System.out.println("la fecha ingresada desde la vista es " + startDate2);
                String endDate2 = request.getParameter("endDate");
                System.out.println("la fecha ingresada desde la vista es " + endDate2);

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
                    System.out.print("La pagina solicitada es " + page2);
                }
                if (page == 1) {
                    pageprevius = 1;
                } else {
                    pageprevius = page - 1;
                }
                if (pagenext == totalPages) {
                    pagenext = totalPages;
                } else {
                    pagenext = page + 1;
                }
                ConvertirFecha convertir = new ConvertirFecha();
                String startFecha = convertir.StringFecha(startDate);
                String endFecha = convertir.StringFecha(endDate);

                System.out.println("\n\n LAS FECHAS BUSCADAS SON " + startDate + "\n\n " + endDate);

                System.out.println("id account " + idAccount + " " + page + " " + max + " " + startFecha + " " + endFecha + " " + destination + " ");

                try {
                    this.llenarHistorial(idAccount, startFecha, endFecha, String.valueOf(page), String.valueOf(max), destination);
                    if (llamadas.isEmpty()) {
                        mensaje = "There is no call log on the dates included";
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
                        mensaje = "Calls made on the dates entered";
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

                    mensaje = "Sorry, service is not available, try later";
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

    public void llenarHistorial(String idAccount, String startDate, String endDate, String page, String max, String destination) {

        httpHistorial historial = new httpHistorial();
        this.llamadas = historial.getHistorial(idAccount, page, max, startDate, endDate, destination);
        int noItems = historial.getTotalCount();

        int divi = (noItems / 15);
        double diviMod = noItems % 15;
        System.out.println("\n\n\n modulo residuo =" + diviMod);
        if (divi <= 1) {
            totalPages = 1;
        } else if (diviMod > 0) {
            totalPages = divi+1;
        } else {
            totalPages = divi;

        }
        System.out.print("\n\n\n\n el numero de paginas a mostrar es " + totalPages);
    }

    public void llenarRecargas(String idAccount, String startDate, String endDate, String page, String max) {
        try {
            httpRecargas recargaHelper = new httpRecargas();
            recargas = recargaHelper.getRecargas(idAccount, page, max, startDate, endDate);

            int noItems = recargaHelper.getTotalCount();

        int divi = (noItems / 15);
        double diviMod = noItems % 15;
        System.out.println("\n\n\n modulo residuo =" + diviMod);
        if (divi <= 1) {
            totalPages = 1;
        } else if (diviMod > 0) {
            totalPages = divi+1;
        } else {
            totalPages = divi;

        }
        System.out.print("\n\n\n\n el numero de paginas a mostrar es " + totalPages);
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
                mensaje = "Please login to the system";
                mav.addObject("mensaje", mensaje);
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

                ConvertirFecha convertir = new ConvertirFecha();
                String startFecha = convertir.StringFecha(startDate);
                String endFecha = convertir.StringFecha(endDate);

                System.out.println("\n\n LAS FECHAS BUSCADAS SON " + startDate + "\n\n " + endDate);

                System.out.println(idAccount + " " + page + " " + max + " " + startFecha + " " + endFecha + " " + destination + " ");

                //fin fechas
                page = 1;
                pagenext = page + 1;
                pageprevius = page = 1;
                mav.addObject("pagenext", pagenext);
                mav.addObject("pageprevius", pageprevius);
                mav.addObject("page", page);
                mav.addObject("max", max);
                String endDate2 = endDate + " 23:59:00";
                String startDate2 = startDate + " 00:00:00";

                try {
                    this.llenarRecargas(idAccount, startFecha, endFecha, String.valueOf(page), String.valueOf(max));
                    if (totalPages == 1) {
                        pagenext = 1;
                    }

                    if (recargas.isEmpty()) {
                        System.out.println("No se encontraron recargas en los ultimos 30 dias");
                        mensaje = "No recharges were made in the last 30 days";
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
                        System.out.println("Refills from the last 30 days");
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
                    mensaje = "Sorry, service is not available, try later";
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

    @RequestMapping(value = "getRecargas.htm", method = RequestMethod.GET)
    public ModelAndView getRecargas(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        try {
            sesion = request.getSession();

            if (sesion.getAttribute("usuario") == null) {
                mensaje = "Please login to the system";
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
                
                
                if (pagenext == totalPages) {
                    pagenext = totalPages;
                } else {
                    pagenext = page + 1;
                }

                ConvertirFecha convertir = new ConvertirFecha();
                String startFecha = convertir.StringFecha(startDate);
                String endFecha = convertir.StringFecha(endDate);

                System.out.println("\n\n LAS FECHAS BUSCADAS SON " + startDate + "\n\n " + endDate);

                System.out.println(idAccount + " " + page + " " + max + " " + startFecha + " " + endFecha + " " + destination + " ");

               

                try {
                    this.llenarRecargas(idAccount, startFecha, endFecha, String.valueOf(page), String.valueOf(max));

                    if (recargas.isEmpty()) {
                        System.out.println("No se encontraron recargas en las fechas comprendidas");
                        mensaje = "No refills found";
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
                        mensaje = "List of refills";

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
                    mensaje = "Sorry, service is not available, try later";
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
            mensaje = "Sorry, view unavailable at this time";
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
