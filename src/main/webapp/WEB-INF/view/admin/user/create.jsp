<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


            <head><!-- Latest compiled and minified CSS-->
                <meta charset="UTF-8">
                <title>Create a User</title>
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
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
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
                                <h1 class="mt-4">Create a User</h1>
                                <div class="container d-flex justify-content-center align-items-center min-vh-70">
                                    <div class="form-card shadow p-4 bg-white rounded"
                                        style="width: 100%; max-width: 600px;">
                                        <form:form action="/admin/user/create" method="post" modelAttribute="newUser"
                                            enctype="multipart/form-data">

                                            <div class="row mb-6">

                                                <!-- Email -->
                                                <div class="col-md-6">
                                                    <c:set var="errorEmail">
                                                        <form:errors path="email" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label class="form-label">Email:</label>
                                                    <form:input path="email" type="email"
                                                        class="form-control ${not empty errorEmail ? 'is-invalid':''}" />
                                                    <form:errors path="email" cssClass="invalid-feedback" />
                                                </div>
                                                <!-- Phone -->
                                                <div class="col-md-6">
                                                    <c:set var="errorPhone">
                                                        <form:errors path="phone" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label class="form-label">Phone number:</label>
                                                    <form:input path="phone" type="text"
                                                        class="form-control ${not empty errorPhone ? 'is-invalid':''}" />
                                                    <form:errors path="phone" cssClass="invalid-feedback" />
                                                </div>


                                            </div>


                                            <div class="row mb-3">
                                                <!-- Address -->
                                                <div class="col-md-6">
                                                    <label class="form-label">Address:</label>
                                                    <form:input path="address" type="text" class="form-control" />
                                                </div>

                                                <!-- Full Name -->
                                                <div class="col-md-6">
                                                    <c:set var="errorFullname">
                                                        <form:errors path="fullname" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label class="form-label">Full Name:</label>
                                                    <form:input path="fullname" type="text"
                                                        class="form-control ${not empty errorFullname ? 'is-invalid':''}" />
                                                    ${errorFullname}
                                                </div>
                                            </div>
                                            <!-- Password -->
                                            <div class="col-md-6">
                                                <c:set var="errorPassword">
                                                    <form:errors path="password" cssClass="invalid-feedback" />
                                                </c:set>
                                                <label class="form-label">Password:</label>
                                                <form:input path="password" type="password"
                                                    class="form-control ${not empty errorPassword ? 'is-invalid':''}" />

                                                <form:errors path="password" cssClass="invalid-feedback" />
                                            </div>

                                            <!-- Role -->
                                            <div class="row mb-4">
                                                <div class="col-md-6">
                                                    <label class="form-label">Role</label>
                                                    <form:select class="form-select" path="role.name">
                                                        <form:option value="ADMIN">ADMIN</form:option>

                                                        <form:option value="USER">USER </form:option>
                                                    </form:select>

                                                </div>

                                                <!-- Avatar-->
                                                <div class="col-md-6">
                                                    <label for="avatarFile" class="form-label">Avatar:</label>
                                                    <input class="form-control" type="file" id="avatarFile"
                                                        accept=".png, .jpg, .jpeg, .jfif" name="file" />
                                                </div>
                                                <div class="col mb-6">
                                                    <!-- Thẻ img hiển thị avatar sau khi chọn file -->
                                                    <img id="avatarPreview" alt="avatar preview"
                                                        style="max-height: 250px; display: none; border-radius: 8px; border: 1px solid #ddd;" />
                                                </div>
                                            </div>

                                            <div class="text-center">
                                                <button type="submit" class="btn btn-primary px-4">Create</button>
                                            </div>


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