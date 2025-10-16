<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


            <head><!-- Latest compiled and minified CSS-->
                <meta charset="UTF-8">
                <title>Create new Product</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- Latest compiled JavaScript-->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <link href="/css/table_user.css" rel="stylesheet">

                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Update a Product</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                <!-- ✅ Thêm đoạn script để preview khi chọn file mới -->
                <script>
                    document.getElementById('productFile').addEventListener('change', function (event) {
                        const [file] = event.target.files;
                        const preview = document.getElementById('productPreview');

                        if (file) {
                            preview.src = URL.createObjectURL(file);
                            preview.style.display = 'block';
                        }
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
                                <h1 class="mt-4">Update Product</h1>
                                <div class="btn-create text-end mb-3">
                                    <a href="/admin/product" class="btn btn-secondary">← Back</a>
                                </div>
                                <div class="container-fluid px-4">

                                    <div class="container d-flex justify-content-center align-items-center min-vh-70">
                                        <div class="form-card shadow p-4 bg-white rounded"
                                            style="width: 100%; max-width: 600px;">
                                            <form:form action="/admin/product/update" method="post"
                                                modelAttribute="updateProduct" enctype="multipart/form-data">
                                                <form:input path="id" type="hidden" />


                                                <div class="row mb-3">
                                                    <div class="col-md-6">
                                                        <c:set var="errorName">
                                                            <form:errors path="name" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <label class="form-label">Tên sản phẩm:</label>
                                                        <form:input path="name" type="text"
                                                            class="form-control ${not empty errorName ? 'is-invalid':''}"
                                                            required="true" />
                                                        <form:errors path="name" cssClass="invalid-feedback" />

                                                    </div>
                                                    <div class="col-md-6">
                                                        <c:set var="errorPrice">
                                                            <form:errors path="price" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <label class="form-label">Price:</label>
                                                        <form:input path="price" type="text"
                                                            class="form-control ${not empty errorPrice ? 'is-invalid':''}"
                                                            required="true" />
                                                        ${errorPrice}
                                                    </div>
                                                </div>
                                                <div class="mb-3">
                                                    <div class="col-md-6">
                                                        <c:set var="errorQuantity">
                                                            <form:errors path="quantity" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <label class="form-label">Quantity</label>
                                                        <form:input path="quantity" type="text"
                                                            class="form-control ${not empty errorQuantity ? 'is-invalid':''}"
                                                            required="true" />
                                                        ${errorQuantity}
                                                    </div>

                                                </div>

                                                <div class="col-md-12">
                                                    <label class="form-label">Detail Description:</label>
                                                    <form:textarea path="detailDesc" class="form-control" rows="5"
                                                        style="resize: vertical; font-size:16px; padding:10px; line-height:1.5;"
                                                        required="true" />
                                                </div>
                                                <div class="col-md-12">
                                                    <label class="form-label">Short Description:</label>
                                                    <form:textarea path="shortDesc" class="form-control" rows="5"
                                                        style="resize: vertical; font-size:16px; padding:10px; line-height:1.5;"
                                                        required="true" />
                                                </div>



                                                <div>

                                                    <div class="row mb-4">
                                                        <div class="col-md-6">
                                                            <label class="form-label">Factory</label>
                                                            <form:select class="form-select" path="factory">
                                                                <form:option value="APPLE">Apple(Macbook)
                                                                </form:option>
                                                                <form:option value="ASUS">Asus
                                                                </form:option>
                                                                <form:option value="DELL">Dell
                                                                </form:option>
                                                                <form:option value="HP">Hp
                                                                </form:option>
                                                                <form:option value="MSI">MSI
                                                                </form:option>
                                                                <form:option value="LEVONO">Levono
                                                                </form:option>
                                                                <form:option value="ACER">Acer
                                                                </form:option>


                                                            </form:select>

                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="form-label">Target</label>
                                                            <form:select class="form-select" path="target">
                                                                <form:option value="GAMING">Gaming
                                                                </form:option>
                                                                <form:option value="STUDENT_WORK_OFFICE">Sinh viên - Văn
                                                                    Phòng
                                                                </form:option>
                                                                <form:option value="GRAPHIC">Đồ họa
                                                                </form:option>
                                                                <form:option value="EMTREPRENEUR">Doanh nhân
                                                                </form:option>
                                                                <form:option value="SLIM_LIGHTWEIGHT">Mỏng nhẹ
                                                                </form:option>

                                                            </form:select>
                                                        </div>

                                                        <div class="row mb-3">
                                                            <!-- Cột upload ảnh -->
                                                            <div class="col-md-6">
                                                                <label for="productFile"
                                                                    class="form-label">Image:</label>
                                                                <input class="form-control" type="file" id="productFile"
                                                                    accept=".png, .jpg, .jpeg, .jfif" name="file" />
                                                            </div>

                                                            <!-- Cột hiển thị ảnh hiện tại hoặc ảnh mới chọn -->
                                                            <div class="col-md-6">
                                                                <c:if test="${not empty updateProduct.image}">
                                                                    <img id="productPreview"
                                                                        src="${pageContext.request.contextPath}/images/product/${updateProduct.image}"
                                                                        alt="product preview"
                                                                        style="display:block; max-width:200px; margin-top:10px; border-radius:8px;">
                                                                </c:if>

                                                                <c:if test="${empty updateProduct.image}">
                                                                    <img id="productPreview" src=""
                                                                        alt="No image selected"
                                                                        style="display:none; max-width:200px; margin-top:10px; border-radius:8px;">
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                        <div class="text-center">
                                                            <button type="submit" class="btn btn-primary px-4">Update
                                                                Product
                                                            </button>
                                                        </div>
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