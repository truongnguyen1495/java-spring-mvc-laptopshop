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
            </head>


            <body>

                <h2 class="title">Table users</h2>

                <div class="btn-create text-end mb-3">
                    <a href="/admin/user/create" class="btn btn-primary">Create a User</a>
                </div>

                <table class="table table-bordered table-striped">
                    <thead class="table-light">
                        <tr>
                            <th>ID</th>
                            <th>Email</th>
                            <th>Full Name</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- ✅ Lặp qua danh sách users -->
                        <c:forEach var="user" items="${users1}">
                            <tr>
                                <td>${user.id}</td>
                                <td>${user.email}</td>
                                <td>${user.fullname}</td>
                                <td>
                                    <a href="/admin/user/${user.id}" class="btn btn-success btn-sm">View</a>
                                    <a href="/admin/user/update/${user.id}" class="btn btn-warning btn-sm">Update</a>
                                    <a href="/admin/user/delete/${user.id}" class="btn btn-danger btn-sm">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

            </body>

            </html>