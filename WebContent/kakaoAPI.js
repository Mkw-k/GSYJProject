Kakao.init('92928f9e601c2b81c37ec8882d4901ac'); //Key값으로 접속
console.log(Kakao.isInitialized());             //Key값 유효성 판단 


let email = "";
let name = "";



function kakaoLogin() {
    Kakao.Auth.login({
		scope: 'profile, account_email, gender, birthday', //추가 동의 받을 항목 키
		success: function(data) {
			
			// 유저 정보 받아오기
			Kakao.API.request({
				url:'/v2/user/me',
				success: function(res) {
					console.log(res.kakao_account);
					email = res.kakao_account['email'];
					name = res.kakao_account.profile['nickname'];
					location.href = "mem?param=kakaoLog&email="+email+"&name="+name;
				}
			}); 
		}   
	})
}
