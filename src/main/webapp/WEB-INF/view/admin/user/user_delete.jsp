<div class="mb-3">
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


                <!-- Latest compiled and minified CSS-->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Latest compiled JavaScript-->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <link href="/css/create.css" rel="stylesheet">


                <body>
                    <div class="container d-flex justify-content-center align-items-center min-vh-100">
                        <div class="form-card shadow p-4 bg-white rounded" style="width: 100%; max-width: 400px;">

                            <h2 class="mb-4 text-center">Delete a User ID ${id}</h2>

                            <form:form action="/admin/user/user_delete" method="post" modelAttribute="deleteUser">
                                <form:hidden path="id" />
                                <div class="mb-3" style="display: none;">
                                    <label class="form-label">User ID:</label>
                                    <form:input path="id" type="text" class="form-control" disabled="true" />
                                </div>

                                <div class="alert alert-danger" role="alert">
                                    Bạn có chắc chắn muốn xóa user này không?
                                </div>
                                <button type="submit" class="btn btn-danger w-100">Đồng ý</button>
                            </form:form>

                        </div>
                    </div>
                </body>

                </html>