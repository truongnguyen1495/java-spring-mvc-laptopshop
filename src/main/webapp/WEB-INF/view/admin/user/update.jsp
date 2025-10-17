<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <title>Update User</title>

                <!-- Bootstrap + FontAwesome -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

                <!-- jQuery -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                <!-- Custom CSS -->
                <link href="/css/styles.css" rel="stylesheet" />
            </head>

            <body class="sb-nav-fixed">

                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <div id="layoutSidenav_nav">
                        <jsp:include page="../layout/sidebar.jsp" />
                    </div>

                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container py-5">
                                <h2 class="mb-4 text-center">Update User</h2>

                                <div class="text-end mb-3">
                                    <a href="/admin/user" class="btn btn-secondary"><i class="fa fa-arrow-left"></i>
                                        Back</a>
                                </div>

                                <div class="card shadow-sm mx-auto" style="max-width: 550px;">
                                    <div class="card-body p-4">

                                        <form:form action="/admin/user/update" method="post" modelAttribute="updateUser"
                                            enctype="multipart/form-data">
                                            <form:input path="id" type="hidden" />

                                            <!-- Email -->
                                            <div class="mb-3">
                                                <label class="form-label fw-semibold">Email</label>
                                                <form:input path="email" type="email" class="form-control"
                                                    readonly="true" />
                                            </div>

                                            <!-- Hidden password -->
                                            <form:input path="password" type="hidden" readonly="true" />

                                            <!-- Phone -->
                                            <div class="mb-3">
                                                <label class="form-label fw-semibold">Phone Number</label>
                                                <form:input path="phone" type="text" class="form-control"
                                                    required="true" />
                                                <form:errors path="phone" cssClass="text-danger small" />
                                            </div>

                                            <!-- Full Name -->
                                            <div class="mb-3">
                                                <label class="form-label fw-semibold">Full Name</label>
                                                <form:input path="fullname" type="text" class="form-control"
                                                    required="true" />
                                            </div>

                                            <!-- Address -->
                                            <div class="mb-3">
                                                <label class="form-label fw-semibold">Address</label>
                                                <form:input path="address" type="text" class="form-control"
                                                    required="true" />
                                            </div>

                                            <!-- Role -->
                                            <div class="mb-3">
                                                <label class="form-label fw-semibold">Role</label>
                                                <form:select path="role.name" class="form-select">
                                                    <form:option value="ADMIN">ADMIN</form:option>
                                                    <form:option value="USER">USER</form:option>
                                                </form:select>
                                            </div>

                                            <!-- Avatar -->
                                            <div class="mb-3">
                                                <label class="form-label fw-semibold">Avatar</label>
                                                <input type="file" id="avatarFile" name="file" class="form-control"
                                                    accept=".png, .jpg, .jpeg, .jfif" />

                                                <c:choose>
                                                    <c:when test="${not empty updateUser.avatar}">
                                                        <img id="avatarPreview"
                                                            src="${pageContext.request.contextPath}/images/avatar/${updateUser.avatar}"
                                                            class="img-thumbnail mt-3"
                                                            style="max-width: 180px; border-radius: 8px;">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img id="avatarPreview" src="" class="img-thumbnail mt-3"
                                                            style="display:none; max-width: 180px; border-radius: 8px;">
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>

                                            <!-- Submit -->
                                            <div class="d-grid">
                                                <button type="submit" class="btn btn-primary fw-semibold">Update
                                                    User</button>
                                            </div>

                                        </form:form>

                                    </div>
                                </div>
                            </div>
                        </main>

                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>

                <!-- Scripts -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

                <!-- Avatar Preview Script -->
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