/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author intercitydev
 */
public class ConvertirFecha {
    public String StringFecha(String fecha) throws ParseException
    {
        String resultado = null;
        SimpleDateFormat formato = new SimpleDateFormat("MM/dd/yyyy");
        Date fechaDate = formato.parse(fecha);
        System.out.println("recibiendo del historial " + fechaDate);

        SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy-MM-dd");

        try {
            resultado = formatoDelTexto.format(fechaDate);
            System.out.println(resultado);
            System.out.println("convirtiendo para consulta " + formatoDelTexto.format(fechaDate));

        } catch (Exception ex) {

        }
        return resultado;
     
    }
    
}
