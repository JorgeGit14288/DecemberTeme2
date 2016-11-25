/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.util;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import org.json.JSONObject;

/**
 *
 * @author intercitydev
 */
public class httpRecargar {
    
     private String getHttpString(String accountid, String amount, String returnUrl, String details) {
        String resultado = null;
       
        String myURL = "http://192.168.5.44/app_dev.php/fin/payment/new";
       
        StringBuilder sb = new StringBuilder();
        URLConnection urlConn = null;
        InputStreamReader in = null;
        try {
            URL url = new URL(myURL);
            urlConn = url.openConnection();
            if (urlConn != null) {
                System.out.println("Se Abrio la conexion");
                urlConn.setReadTimeout(60 * 1000);
                urlConn.setDoOutput(true);
                String data = URLEncoder.encode("amount", "UTF-8") + "=" + URLEncoder.encode(amount, "UTF-8");
                data += "&" + URLEncoder.encode("returnUrl", "UTF-8") + "=" + URLEncoder.encode(returnUrl, "UTF-8");
                data += "&" + URLEncoder.encode("accountid", "UTF-8") + "=" + URLEncoder.encode(accountid, "UTF-8");
                data += "&" + URLEncoder.encode("details", "UTF-8") + "=" + URLEncoder.encode(details, "UTF-8");
                
                System.out.println("los Datos a enviar por POST son " + data);

                try ( //obtenemos el flujo de escritura
                        OutputStreamWriter wr = new OutputStreamWriter(urlConn.getOutputStream())) {
                    //escribimos
                    wr.write(data);
                    wr.flush();
//cerramos la conexiÃ³n
                }
            }
            if (urlConn != null && urlConn.getInputStream() != null) {
                in = new InputStreamReader(urlConn.getInputStream(),
                        Charset.defaultCharset());

                BufferedReader bufferedReader = new BufferedReader(in);
                if (bufferedReader != null) {
                    int cp;
                    while ((cp = bufferedReader.read()) != -1) {
                        sb.append((char) cp);
                    }
                    bufferedReader.close();
                }
            }
            resultado = sb.toString();
            in.close();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Exception while calling URL:" + myURL, e);
        }
        System.out.println("DATOS ENVIADOS DEL SERVIDOR " + sb.toString());

        return resultado;
    }

    public String getRecargas(String accountid, String amount, String returnUrl, String details) {
        
        System.out.println("lo que llego del controlador "+accountid+amount+returnUrl+details);

        String resultado = this.getHttpString(accountid, amount, returnUrl, details);
        String url=null;
        //accountid ="29";
       // amount="5";
       //returnUrl="gmail.com";
      //  details="hola k ase";
        try
        {

        if (resultado!=null) {
            

            String jsonResult = resultado;

            // System.out.println("\n\n--------------------OBTENEMOS OBJETO JSON NATIVO DE LA PAGINA, USAMOS EL ARRAY DATA---------------------------\n\n");
            JSONObject objJason = new JSONObject(jsonResult);
            // JSONArray dataJson = new JSONArray();
            //  dataJson = objJason.getJSONArray("data");
            String data = objJason.optString("data");
            String mensaje = objJason.optString("message");
            String code = objJason.optString("code");
            System.out.println("\n MENSAJE DEL SERVIDOR " + mensaje);
            System.out.println("\n CODIGO DE RESPUESTA " + code);
            System.out.println(" el objeto jdata es " + data);
            
           url = data;
        } else {
            System.out.println("El servidor de las recargas no respondio correctamenteo");
        }
        }catch(Exception e)
        {
            System.out.println("No se pudo traducir la respuesta del servidor");
            e.printStackTrace();
        }
        System.out.println("La Respuesta final del servidor es "+url);
        return url;
    }   
}
