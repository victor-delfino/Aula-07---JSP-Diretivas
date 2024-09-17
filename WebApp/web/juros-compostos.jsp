<%-- 
    Document   : juros-compostos
    Created on : 17 de set de 2024, 15:01:11
    Author     : Fatec
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Juros Compostos</title>
    </head>
    <body>
         <%@include file="WEB-INF/jspf/menu.jspf" %>
         
          <h1>Calcular seu Juros Composto</h1>
        <form action="juros-compostos.jsp" method="post">
            
            <label for="montante">Montante Inicial:</label>
            <input type="text" id="montante" name="montante" required><br>
            
            <label for="taxa">Taxa de Juros (% ao mês):</label>
            <input type="text" id="taxa" name="taxa" required><br>
            
            <label for="meses">Meses:</label>
            <input type="text" id="meses" name="meses" required><br>
            
            <input type="submit" value="Calcular">
        </form>
        
      <%  
          
        String montantei = request.getParameter("montante");
        String taxajc = request.getParameter("taxa");
        String mesest = request.getParameter("meses");
        
        if(montantei != null && taxajc != null && mesest != null) {
            try {
            double montante = Double.parseDouble(montantei);
            double taxa = Double.parseDouble(taxajc) / 100;
            double meses = Double.parseDouble(mesest);
            
            double valorFuturo = montante * Math.pow((1 + taxa), meses);
            
            out.println("<h2>Resultado: </h2>");
            out.println("<p>Montante Inicial: R$ " + String.format("%.2f", montante) + "</p>");
            out.println("<p>Taxa de Juros: " + (taxa * 100) + "% ao mês</p>");
            out.println("<p>Quantidade de Meses: " + meses + "</p>");
            out.println("<p>Valor Futuro: R$ " + String.format("%.2f", valorFuturo) + "</p>");
            
          }catch (Exception e) {
            out.println("<p>Erro: Verificar se os campos foram digitados corretamente.</p>");
          }
         }    
        %>
    </body>
</html>
