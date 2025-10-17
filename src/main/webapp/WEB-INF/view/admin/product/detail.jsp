<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <head><!-- Latest compiled and minified CSS-->
                <meta charset="UTF-8">
                <title>Users Table</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- Latest compiled JavaScript-->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <link href="/css/table_user.css" rel="stylesheet">

                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Dashboard - SB Admin</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp"></jsp:include>
                <div id="layoutSidenav">
                    <div id="layoutSidenav_nav">
                        <jsp:include page="../layout/sidebar.jsp"></jsp:include>
                    </div>
                    <div id="layoutSidenav_content">
                        <main>

                            <div class="d-flex justify-content-between align-items-center mb-3">

                                <h1 class="page-title">Product Detail</h1>
                                <div class="btn-create text-end mb-3">
                                    <a href="/admin/product" class="btn btn-primary">Back</a>
                                </div>
                            </div>

                            <div class="card-product mx-auto">
                                <img src="/images/product/${products.image}" alt="${products.name}">
                                <div class="product-info">
                                    <h3>${products.name}</h3>
                                    <div class="info-item">
                                        <span class="info-label">Price:</span> ${products.price}
                                    </div>
                                    <div class="info-item">
                                        <span class="info-label">Quantity:</span> ${products.quantity}
                                    </div>
                                    <div class="info-item">
                                        <span class="info-label">Factory:</span> ${products.factory}
                                    </div>
                                    <div class="info-item">
                                        <span class="info-label">Short Description:</span> ${products.shortDesc}
                                    </div>
                                    <div class="info-item">
                                        <span class="info-label">Detail Description:</span> ${products.detailDesc}
                                    </div>
                                </div>
                            </div>
                    </div>
                    </main>
                    <jsp:include page="../layout/footer.jsp"></jsp:include>
                </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/scripts.js"></script>


            </body>

            </html>