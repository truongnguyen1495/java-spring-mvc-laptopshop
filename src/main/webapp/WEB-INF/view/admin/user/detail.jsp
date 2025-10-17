<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <head><!-- Latest compiled and minified CSS-->
                <meta charset="UTF-8">
                <title>Users Detail</title>
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
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">User Detail with ID = ${id}</h1>
                                <div>
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="/admin/user">Admin</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">User detail
                                            </li>
                                        </ol>
                                    </nav>
                                </div>

                                <div class="btn-create text-end mb-3">
                                    <a href="/admin/user" class="btn btn-primary">Back</a>
                                </div>
                                <div class="container mt-4">
                                    <div class="info-box mx-auto">
                                        <h4>User information</h4>

                                        <div class="info-item">
                                            <span class="info-label">ID:</span> ${user.id}
                                        </div>
                                        <div class="info-item">
                                            <span class="info-label">Email:</span> ${user.email}
                                        </div>
                                        <div class="info-item">
                                            <span class="info-label">FullName:</span> ${user.fullname}
                                        </div>
                                        <div class="info-item">
                                            <span class="info-label">Address:</span> ${user.address}
                                        </div>

                                        <div class="mt-3">
                                            <a href="/admin/user" class="btn btn-back">Back</a>
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