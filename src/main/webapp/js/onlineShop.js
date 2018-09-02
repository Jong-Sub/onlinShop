/* 제고 확인 함수 */
function checkCount(obj){
	var count = parseInt(obj[1].value);
	if( count < 0 ){
		alert("재고가 없습니다.");
		return false;
	} else {
		return true;
	}
}

