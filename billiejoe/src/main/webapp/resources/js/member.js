// 회원 가입 유효성 검사

// 각 유효성 검사 결과를 저장할 객체
const checkObj = {
	"id": false,
	"pwd1": false,
	"newPwd1": false,
	"newpwd2": false,
	"pwd2": false,
	"name": false,
	"phone2": false,
	"email": false
};

// 아이디가 입력될 때 마다 유효성 검사
// 조건 : 영어, 숫자 6~12글자 

$("#id").on("input", function(){

    // 아이디가 입력되는 경우 hidden타입 태그의 값을 false로 변경
    // $("#idDup").val(false);

    // 정규표현식 객체 생성
    const regExp = /^[a-zA-Z0-9]{6,12}$/;

    // 입력된 아이디(양쪽 공백 제거)를 얻어와 inputId 변수에 저장
    const inputId = $("#id").val().trim();

    // 입력된 아이디가 정규식에 일치하는 경우 == 유효한 값인 경우
    if(regExp.test(inputId)) { 
        //$("#checkId").text("유효한 아이디 입니다.").css("color","green");
        //checkObj.id = true;

        // Ajax를 이용하여 비동기적으로 아이디 중복 검사를 진행

        // jQuery를 이용한 Ajax
        $.ajax({
            url : "idDupCheck",  // 요청 주소(필수로 작성!)
            data : {"id" : inputId},     // 전달하려는 값(파라미터)  
            type : "post",  // 데이터 전달 방식

            success : function(result){
                // 매개변수 result : 서버에서 비동기로 전달 받은 응답 데이터

                console.log(result);

                if( result > 0){ // 아이디가 중복 되는 경우
                    $("#checkId").text("이미 사용중인 아이디 입니다.").css("color","red");
                    checkObj.id = false;
                    
                } else{ // 아이디가 중복되지 않는 경우
                    $("#checkId").text("사용 가능한 아이디 입니다.").css("color","green");
                    checkObj.id = true;
                }


            }, // 비동기 통신 성공 시 동작

            error : function(e){
                // 매개변수 e : 예외 발생 시 Exception 객체를 전달 받을 변수

                console.log("ajax 통신 실패");
                console.log(e);

            } // 비동기 통신 실패 시 동작
        });


    } else{
        $("#checkId").text("영어, 숫자 6~12글자로 작성").css("color","red");

        checkObj.id = false;
    }
});


// 이름 유효성 검사
// 조건 : 한글 두 글자 이상 5글자 이하 ->  /^[가-힣]{2,5}$/;
$("#name").on("input", function(){
    const regExp = /^[가-힣]{2,5}$/;

    // 이벤트 핸들러 내부에 작성된 this == 이벤트가 발생한 요소 == $("#name")
    const inputName = $(this).val().trim();

    if(regExp.test(inputName)){
        $("#checkName").text("유효한 이름 형식입니다.").css("color", "green");

        checkObj.name = true;

    }else{
        $("#checkName").text("한글 2~5글자").css("color", "red");

        checkObj.name = false;

    }

});



// 이메일 유효성 검사
// 조건 : 아이디 4글자 이상, 이메일 형식  ->   /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;
$("#email").on("input", function(){
    const regExp = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;

    // 이벤트 핸들러 내부에 작성된 this == 이벤트가 발생한 요소 == $("#name")
    const inputEmail = $(this).val().trim();

    if(regExp.test(inputEmail)){
        $("#checkEmail").text("유효한 이메일 형식입니다.").css("color", "green");

        checkObj.email = true;

    }else{
        $("#checkEmail").text("이메일 형식이 올바르지 않습니다.").css("color", "red");

        checkObj.email = false;
    }

});



// 비밀번호 유효성 검사
// 조건 : 영어, 숫자, 특수문자(# , -, _) 6~20글자
$("#pwd1").on("input", function () {
    const regExp = /^[a-zA-Z0-9\#\-\_]{6,20}$/;
    const inputPwd1 = $(this).val().trim();

    if(regExp.test(inputPwd1)){
        $("#checkPwd1").text("유효한 비밀번호 형식입니다.").css("color", "green");

        checkObj.pwd1 = true;
    }else{
        $("#checkPwd1").text("비밀번호가 유효하지 않습니다.").css("color", "red");

        checkObj.pwd1 = false;
    }
});

// 비밀번호, 비밀번호 확인 일치 여부 판단
$("#pwd1,  #pwd2").on("input", function(){

    const pwd1 = $("#pwd1").val();
    const pwd2 = $("#pwd2").val();

    if( pwd1.trim() == ""  && pwd2.trim() == ""  ){ // 둘다 비었을 때
        $("#checkPwd1").html("&nbsp;"); // &nbsp;  == 띄어쓰기
        $("#checkPwd2").html("&nbsp;");

        checkObj.pwd2 = false;

    } else if(  pwd1 == pwd2   ){
        $("#checkPwd2").text("비밀번호 일치").css("color", "green");

        checkObj.pwd2 = true;

    } else{
        $("#checkPwd2").text("비밀번호 불일치").css("color", "red");

        checkObj.pwd2 = false;
    }
});

// -------------------------------------- 비밀번호 변경시
// 비밀번호 유효성 검사
// 조건 : 영어, 숫자, 특수문자(# , -, _) 6~20글자
$("#newPwd1").on("input", function () {
    const regExp = /^[a-zA-Z0-9\#\-\_]{8,20}$/;
    const inputPwd1 = $(this).val().trim();

    if(regExp.test(inputPwd1)){
        $("#checkNewPwd1").text("유효한 비밀번호 형식입니다.").css("color", "green");

        checkObj.newPwd1 = true;
    }else{
        $("#checkNewPwd1").text("비밀번호가 유효하지 않습니다.").css("color", "red");

        checkObj.newPwd1 = false;
    }
});

// 비밀번호, 비밀번호 확인 일치 여부 판단
$("#newPwd2,  #newPwd1").on("input", function(){

    const pwd1 = $("#newPwd2").val();
    const pwd2 = $("#newPwd1").val();

    if( pwd1.trim() == ""  && pwd2.trim() == ""  ){ // 둘다 비었을 때
        $("#checkNewPwd1").html("&nbsp;"); // &nbsp;  == 띄어쓰기
        $("#checkNewPwd2").html("&nbsp;");

        checkObj.newPwd2 = false;

    } else if(  newPwd2 == newPwd1   ){
        $("#checkNewPwd2").text("비밀번호 일치").css("color", "green");

        checkObj.newPwd2 = true;

    } else{
        $("#checkNewPwd2").text("비밀번호 불일치").css("color", "red");

        checkObj.newPwd2 = false;
    }
});

// 전화번호 유효성 검사
$(".phone").on("input", function(){

    // 전화번호 input 태그에 4글자 초과 입력하지 못하게 하는 이벤트
	if ($(this).val().length > 4) {
		$(this).val( $(this).val().slice(0, 4));
	}

    
    const regExp1 = /^[0-9]{3,4}$/; // 숫자 3~4글자
    const regExp2 = /^[0-9]{4}$/; // 숫자 4글자

    const ph2 = $("#phone2").val();
    const ph3 = $("#phone3").val();

    if( regExp1.test(ph2)  && regExp2.test(ph3)  ){
        $("#checkPhone").text("유효한 전화번호 형식입니다.").css("color", "green");
        
        checkObj.phone2 = true;

    }else{
        $("#checkPhone").text("전화번호가 유효하지 않습니다.").css("color", "red");

        checkObj.phone2 = false;
    }
});


// 회원 가입 버튼 클릭 시 전체 유효성 검사 여부 확인
function validate(){

    // 아이디 중복 검사를 진행했는지 확인
    // * input 태그 값을 모두 String으로 반환됨!
    /*if( $("#idDup").val() != "true" ){ // 중복 검사를 안한 경우
        swal("아이디 중복 검사를 진행해 주세요.").then(function(){
            $("#idDupCheck").focus(); // 중복 검사 버튼으로 포커스 이동
        });

        return false; // submit 이벤트 제거
    }*/


    // checkObj에 작성된 속성들이 모두 true인지 확인

    // 객체 내 속성을 순차접근하는 반복문 :  for in구문
    for(const key in checkObj ){

        if( !checkObj[key] ){ // false 값을 가진 속성이 있을 경우
            let msg;
			switch (key) {
			case "id":
				msg = "아이디가 유효하지 않습니다.";
				break;
			case "pwd1":
				msg = "비밀번호가 유효하지 않습니다.";
				break;
			case "pwd2":
				msg = "비밀번호가 일치하지 않습니다. ";
				break;
			case "name":
				msg = "이름이 유효하지 않습니다.";
				break;
			case "phone2":
				msg = "전화번호가 유효하지 않습니다. ";
				break;
			case "email":
				msg = "이메일이 유효하지 않습니다.";
					break;
			} 

            // msg에 담긴 내용 출력
            swal(msg).then(function(){ 

                const selector = "#" + key;

                $(selector).focus();
                // 유효하지 않은 값을 입력한 부분으로 포커스 이동
            });

            return false;  // submit 이벤트 제거(회원가입 실행 X)

        }
    } // for end
    
    // 나눠져 있는 phone, address를 하나로 합쳐
    // form태그 내부 제일 마지막에 type="hidden"으로 추가하기
    
    const phone = $("[name='phone']"); // name 속성 값이 phone인 요소를 모두 얻어와 배열로 저장
    const address = $("[name='address']"); // name 속성 값이 address인 요소를 모두 얻어와 배열로 저장
    
    // 요소에 저장된 value만 얻어와 합치기
    const memberPhone = $(phone[0]).val() + "-" + $(phone[1]).val( ) + "-" + $(phone[2]).val( )

    const memberAddress = $(address[0]).val() + "," + $(address[1]).val( ) + "," + $(address[2]).val( )




	// form태그에 type="hidden"으로 추가
	const inputPhone = $("<input>", {type : "hidden", name : "memberPhone", value : memberPhone})
	const inputAddress= $("<input>", {type : "hidden", name : "memberAddress", value : memberAddress})

	// append() : 선택된 요소의 마지막 자식으로 추가
	$("form[name='signUpForm']").append(inputPhone).append(inputAddress);

	

}





