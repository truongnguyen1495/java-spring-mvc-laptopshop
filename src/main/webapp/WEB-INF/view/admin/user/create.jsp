<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


            <head><!-- Latest compiled and minified CSS-->
                <meta charset="UTF-8">
                <title>Create new User</title>
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
                                <h1 class="mt-4">Dashboard</h1>
                                <div class="container d-flex justify-content-center align-items-center min-vh-100">
                                    <div class="form-card shadow p-4 bg-white rounded"
                                        style="width: 100%; max-width: 400px;">
                                        <form:form action="/admin/user/create" method="post" modelAttribute="newUser">
                                            <h2 class="mb-4 text-center">Create a user</h2>

                                            <div class="mb-3">
                                                <label class="form-label">Email:</label>
                                                <form:input path="email" type="email" class="form-control"
                                                    required="true" />
                                            </div>

                                            <div class="mb-3">
                                                <label class="form-label">Password:</label>
                                                <form:input path="password" type="password" class="form-control"
                                                    required="true" />
                                            </div>

                                            <div class="mb-3">
                                                <label class="form-label">Phone number:</label>
                                                <form:input path="phone" type="text" class="form-control"
                                                    required="true" />
                                            </div>

                                            <div class="mb-3">
                                                <label class="form-label">Full Name:</label>
                                                <form:input path="fullname" type="text" class="form-control"
                                                    required="true" />
                                            </div>

                                            <div class="mb-3">
                                                <label class="form-label">Address:</label>
                                                <form:input path="address" type="text" class="form-control"
                                                    required="true" />
                                            </div>

                                            <button type="submit" class="btn btn-primary w-100">Create</button>
                                        </form:form>
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