<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <title>Update User</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <link href="/css/styles.css" rel="stylesheet">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
                                <h1 class="mt-4">Update User</h1>
                                <div class="btn-create text-end mb-3">
                                    <a href="/admin/user" class="btn btn-secondary">← Back</a>
                                </div>

                                <div class="container d-flex justify-content-center align-items-center min-vh-70">
                                    <div class="form-card shadow p-4 bg-white rounded"
                                        style="width: 100%; max-width: 500px;">
                                        <form:form action="/admin/user/update" method="post" modelAttribute="updateUser"
                                            enctype="multipart/form-data">
                                            <form:input path="id" type="hidden" />

                                            <!-- Email -->
                                            <div class="mb-3">
                                                <label class="form-label">Email:</label>
                                                <form:input path="email" type="email" class="form-control"
                                                    readonly="true" />
                                            </div>

                                            <!-- Password ẩn để không ghi đè-->
                                            <form:input path="password" type="hidden" readonly="true" />

                                            <!-- Phone -->
                                            <div class="mb-3">
                                                <c:set var="errorPhone">
                                                    <form:errors path="phone" cssClass="invalid-feedback" />
                                                </c:set>
                                                <label class="form-label">Phone number:</label>
                                                <form:input path="phone" type="text"
                                                    class="form-control ${not empty errorPhone ? 'is-invalid':''}"
                                                    required="true" />
                                                ${errorPhone}
                                            </div>

                                            <!-- Fullname -->
                                            <div class="mb-3">
                                                <label class="form-label">Full Name:</label>
                                                <form:input path="fullname" type="text" class="form-control"
                                                    required="true" />
                                            </div>

                                            <!-- Address -->
                                            <div class="mb-3">
                                                <label class="form-label">Address:</label>
                                                <form:input path="address" type="text" class="form-control"
                                                    required="true" />
                                            </div>

                                            <!-- Role & Avatar -->
                                            <div class="row mb-4">
                                                <div class="col-md-6">
                                                    <label class="form-label">Role:</label>
                                                    <form:select class="form-select" path="role.name">
                                                        <form:option value="ADMIN">ADMIN</form:option>
                                                        <form:option value="USER">USER</form:option>
                                                    </form:select>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="avatarFile" class="form-label">Avatar:</label>
                                                    <input class="form-control" type="file" id="avatarFile" name="file"
                                                        accept=".png, .jpg, .jpeg, .jfif" />

                                                    <img id="avatarPreview"
                                                        src="${updateUser.avatar != null ? updateUser.avatar : '/images/default-avatar.png'}"
                                                        alt="Avatar Preview"
                                                        style="max-height: 200px; border-radius: 8px; margin-top: 10px; display: block;" />
                                                </div>
                                            </div>

                                            <button type="submit" class="btn btn-primary w-100">Update</button>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp"></jsp:include>
                    </div>
                </div>

                <!-- Scripts -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>

                <script>
                    $(document).ready(() => {
                        $("#avatarFile").change(function (e) {
                            const file = e.target.files[0];
                            if (file) {
                                const imgURL = URL.createObjectURL(file);
                                $("#avatarPreview").attr("src", imgURL).show();
                            }
                        });
                    });
                </script>
            </body>

            </html>