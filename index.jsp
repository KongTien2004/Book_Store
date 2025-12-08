<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/header.jsp" %>

<div class="p-5 mb-4 bg-light rounded-3 text-center" style="background-image: url('https://picsum.photos/1200/400?grayscale'); background-size: cover; color: white; text-shadow: 2px 2px 4px #000;">
    <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">Sách hay mỗi ngày</h1>
        <p class="fs-4">Khám phá kho tàng tri thức vô tận cùng BookStore.</p>
        <button class="btn btn-primary btn-lg" type="button">Mua ngay</button>
    </div>
</div>

<h3 class="mb-4 border-bottom pb-2">Sách Nổi Bật</h3>

<div class="row row-cols-1 row-cols-md-4 g-4">

    <div class="col">
        <div class="card h-100 card-book">
            <img src="https://placehold.co/300x400?text=Java+Core" class="card-img-top" alt="Sách Java">
            <div class="card-body">
                <h5 class="card-title">Lập trình Java Core</h5>
                <p class="card-text text-danger fw-bold">150.000 đ</p>
                <p class="card-text small text-muted">Tác giả: NXB Giáo Dục</p>
            </div>
            <div class="card-footer bg-transparent border-top-0">
                <a href="${pageContext.request.contextPath}/product-detail.jsp" class="btn btn-outline-primary w-100">Xem chi tiết</a>
            </div>
        </div>
    </div>

    <div class="col">
        <div class="card h-100 card-book">
            <img src="https://placehold.co/300x400?text=Web+Design" class="card-img-top" alt="Sách Web">
            <div class="card-body">
                <h5 class="card-title">Thiết kế Web hiện đại</h5>
                <p class="card-text text-danger fw-bold">200.000 đ</p>
                <p class="card-text small text-muted">Tác giả: Jon Duckett</p>
            </div>
            <div class="card-footer bg-transparent border-top-0">
                <a href="${pageContext.request.contextPath}/product-detail.jsp" class="btn btn-outline-primary w-100">Xem chi tiết</a>
            </div>
        </div>
    </div>

</div> </div> <%@ include file="common/footer.jsp" %>