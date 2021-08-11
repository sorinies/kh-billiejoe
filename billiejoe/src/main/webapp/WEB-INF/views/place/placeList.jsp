<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp"></jsp:include>
  <div class="container py-5">
    <div class="content-header row">
      <h2 class="col">장소 찾기</h2>
      <div class="col text-end">
        <a href="#" class="btn btn-primary">장소 등록</a>
      </div>
    </div>
    <div class="col-md-9 mx-auto">
      <form action="" class="row mb-3">
        <div class="col-md-4">
          <select class="form-select" aria-label="Default select example">
            <option selected>Open this select menu</option>
            <option value="1">One</option>
            <option value="2">Two</option>
            <option value="3">Three</option>
          </select>
        </div>
        <div class="col-md-4">
          <input class="form-control" type="date">
        </div>
        <div class="col-md-4">
          <select class="form-select" aria-label="Default select example">
            <option selected>Open this select menu</option>
            <option value="1">One</option>
            <option value="2">Two</option>
            <option value="3">Three</option>
          </select>
        </div>
      </form>
      <div class="card mb-3 place">
        <div class="row g-0">
          <div class="place-thumb col-md-4" style="background-image:url(https://via.placeholder.com/720x480)"></div>
          <div class="col-md-8">
            <div class="card-body">
              <h3 class="card-title"><a href="#" class="stretched-link">모임공간 모락 서울대입구</a></h3>
              <p class="card-text">모임이 즐거워지는 공간! 서울대입구역 단독룸!</p>
              <ul class="place-tag list-inline">
                <li class="list-inline-item"><a class="badge rounded-pill bg-secondary" href="#"><i class="bi bi-hash"></i> Secondary</a></li>
                <li class="list-inline-item"><a class="badge rounded-pill bg-secondary" href="#"><i class="bi bi-hash"></i> Secondary</a></li>
                <li class="list-inline-item"><a class="badge rounded-pill bg-secondary" href="#"><i class="bi bi-hash"></i> Secondary</a></li>
                <li class="list-inline-item"><a class="badge rounded-pill bg-secondary" href="#"><i class="bi bi-hash"></i> Secondary</a></li>
              </ul>
            </div>
            <div class="card-footer">
              <ul class="list-inline place-info">
                <li class="list-inline-item">30,000원<small>/시간</small></li>
                <li class="list-inline-item"><i class="bi bi-chat-square-text"></i> 12</li>
                <li class="list-inline-item"><i class="bi bi-heart-fill"></i> 144</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
          <li class="page-item disabled">
            <a class="page-link" href="#" aria-label="Previous">
              <span aria-hidden="true">&laquo;</span>
            </a>
          </li>
          <li class="page-item active"><a class="page-link" href="#">1</a></li>
          <li class="page-item"><a class="page-link" href="#">2</a></li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
            </a>
          </li>
        </ul>
      </nav>
    </div>
  </div>
<jsp:include page="../common/footer.jsp"></jsp:include>