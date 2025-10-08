<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <head><!-- Latest compiled and minified CSS-->
                <meta charset="UTF-8">
                <title>Users Detail ${id}</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- Latest compiled JavaScript-->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <link href="/css/table_user.css" rel="stylesheet">
            </head>


            <body>

                <h2 class="title">User Detail with ID = ${id}</h2>

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

            </body>

            </html>