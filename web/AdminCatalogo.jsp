<%-- 
    Document   : principal
    Created on : 25-oct-2020, 13:49:14
    Author     : MitSuKy
--%>
<%@page import="Modelo.PdfVO"%>
<%@page import="Modelo.PdfDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Catalogo</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="./css/main.css">
    </head>
    <body>
        <%
            PdfDAO emp = new PdfDAO();
            PdfVO pdfvo = new PdfVO();
            ArrayList<PdfVO> listar = emp.Listar_PdfVO();
        %>
        <!-- Content page-->
        <section class="full-box dashboard-contentPage">
            <!-- NavBar -->
            <nav class="full-box dashboard-Navbar">
                <ul class="full-box list-unstyled text-right">
                    <li class="pull-left">
                        <a href="#!" class="btn-menu-dashboard"><i class="zmdi zmdi-more-vert"></i></a>
                    </li>
                    <li>
                        <a href="search.html" class="btn-search">
                            <i class="zmdi zmdi-search"></i>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- Content page -->
            <div class="container-fluid">
                <div class="page-header">
                    <h1 class="text-titles"><i class="zmdi zmdi-book-image zmdi-hc-fw"></i> CATALOGO</h1>
                </div>
            </div>
            <div class="container-fluid text-center">
                <div class="btn-group">
                    <a href="javascript:void(0)" class="btn btn-default btn-raised">SELECCIONE UNA CATEORÍA</a>
                    <a href="javascript:void(0)" data-target="dropdown-menu" class="btn btn-default btn-raised dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#!">Categoría 1</a></li>
                        <li><a href="#!">Categoría 2</a></li>
                        <li><a href="#!">Categoría 3</a></li>
                        <li><a href="#!">Categoría 4</a></li>

                    </ul>
                </div>
            </div>
            <div class="container-fluid">
                <h2 class="text-titles text-center">Categoría seleccionada</h2>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="list-group">
                            <%if (listar.size() > 0) {
                                    for (PdfVO listar2 : listar) {
                                        pdfvo = listar2;
                            %>

                            <div class="list-group-item">
                                <div class="row-picture">
                                    <img class="circle" src="<%=pdfvo.getPortadapdf()%>" alt="icon">
                                </div>
                                <div class="row-content">
                                    <h4 class="list-group-item-heading"><%=pdfvo.getNombrepdf()%> </h4>
                                    <p class="list-group-item-text">
                                        <strong>Autor: </strong><%=pdfvo.getAutorpdf()%> <br>
                                        <a href="book-info.html" class="btn btn-primary" title="Más información"><i class="zmdi zmdi-info"></i></a>
                                            <%
                                                if (pdfvo.getArchivopdf2() != null) {
                                            %>
                                        <a href="pdf?id=<%=pdfvo.getCodigopdf()%>" class="btn btn-primary" title="Ver PDF"><i class="zmdi zmdi-file"></i></a>
                                            <%
                                                } else {
                                                    out.print("Vacio");
                                                }
                                            %>
                                        <a href="ControllerPdf?action=delete&id=<%=pdfvo.getCodigopdf()%>" class="btn btn-primary" title="Eliminar"><i class="zmdi zmdi-delete"></i></a>
                                        <a href="book-config.html" class="btn btn-primary" title="Modificar"><i class="zmdi zmdi-wrench"></i></a>
                                    </p>
                                </div>
                            </div>
                            <div class="list-group-separator"></div>
                            <%}
    }%>


                        </div>
                        <nav class="text-center">
                            <ul class="pagination pagination-sm">
                                <li class="disabled"><a href="javascript:void(0)">«</a></li>
                                <li class="active"><a href="javascript:void(0)">1</a></li>
                                <li><a href="javascript:void(0)">2</a></li>
                                <li><a href="javascript:void(0)">3</a></li>
                                <li><a href="javascript:void(0)">4</a></li>
                                <li><a href="javascript:void(0)">5</a></li>
                                <li><a href="javascript:void(0)">»</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>


        </section>

        <!--====== Scripts -->
        <script src="./js/jquery-3.1.1.min.js"></script>
        <script src="./js/sweetalert2.min.js"></script>
        <script src="./js/bootstrap.min.js"></script>
        <script src="./js/material.min.js"></script>
        <script src="./js/ripples.min.js"></script>
        <script src="./js/jquery.mCustomScrollbar.concat.min.js"></script>
        <script src="./js/main.js"></script>
        <script>
            $.material.init();
        </script>
    </body>
</html>