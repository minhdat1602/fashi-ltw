document.addEventListener('DOMContentLoaded', function() {
	var usernameInput = document.getElementById('username');
	var fullnameInput = document.getElementById('fullname');
	var passwordInput = document.getElementById('password');
	var repeatPasswordInput = document.getElementById('repeatPassword');
	var emailInput = document.getElementById('email');
	var phoneInput = document.getElementById('phone');
	var addressInput = document.getElementById('address');
	var gender = document.getElementById('gender');
    var birth = document.getElementById('birth');
	document.getElementById('submitBtn').addEventListener("click", function(event) {
		event.preventDefault();
		if (addressInput.value=="") {
			addressInput.nextElementSibling.innerText = "Vui lòng nhập địa chỉ!";
			addressInput.value = "";
		} else usernameInput.nextElementSibling.innerText = "";
		if (!validateName(usernameInput.value)) {
			usernameInput.nextElementSibling.innerText = "Vui lòng nhập tên hợp lệ!";
			usernameInput.value = "";
		} else usernameInput.nextElementSibling.innerText = "";
		if (!validateName(fullnameInput.value)) {
			fullnameInput.nextElementSibling.innerText = "Vui lòng nhập tên hợp lệ!";
			fullnameInput.value = "";
		} else usernameInput.nextElementSibling.innerText = "";
		if (!validateEmail(emailInput.value)) {
			emailInput.nextElementSibling.innerText = "Vui lòng nhập email hợp lệ!";
			emailInput.value = "";
		} else emailInput.nextElementSibling.innerText = "";
		if (!validateNumber(phoneInput.value)) {
			phoneInput.nextElementSibling.innerText = "Vui lòng nhập số điện thoại hợp lệ!";
			phoneInput.value = "";
		} else phoneInput.nextElementSibling.innerText = "";
		if (!validatePassword(passwordInput.value, repeatPasswordInput.value)) {
			repeatPasswordInput.nextElementSibling.innerText = "Mật khẩu không trùng khớp!";
			repeatPasswordInput.value = "";
		} else repeatPasswordInput.nextElementSibling.innerText = "";
		if (!validateSelect(gender)){
            gender.nextElementSibling.innerText = "Vui lòng chọn giới tính";
        }
        if (!validateChooseDate(birth)){
            birth.nextElementSibling.innerText = "Vui lòng chọn ngày sinh";
        }
		if (validateName(usernameInput.value) && validateEmail(emailInput.value) && validateNumber(phoneInput.value) && validatePassword(passwordInput.value, repeatPasswordInput.value)&&validateSelect(gender)&&validateChooseDate(birth)&&validateName(fullnameInput.value)) {
			document.querySelector("#form").submit();
		}
	})

	function validateEmptyValue(input) {
		if (input.value == "") return false;
		else return true;
	}
	function validateChooseDate(formDate) {
		if (formDate.value == "") return false;
		else return true;
	}
	function validateName(name) {
	    var result = /^[A-Za-z\s]+$/.test(name);
	    if (name=="") result = false;
		return result;
	}
	function validateNumber(number) {
		return /^[0-9\s]+$/.test(number);
	}
	function validatePassword(password, repassword) {
		if (password === repassword) return true;
		else return false;
	}
	function validateEmail(email) {
		if (email.includes("@")) {
			var count = 0;
			for (var i = 0; i < email.length; i++) {
				if (email[i] == "@") count++;
			}
			if (count == 1 && email.indexOf("@") > 0 && email.indexOf("@") < email.length - 1) {
				return true;
			}
		}
		return false;
	}
	function validateCheckbox(checkboxName) {
		var count = 0;
		for (var i = 0; i < checkboxName.length; i++) {
			if (checkboxName[i].checked == true) {
				count++;
			}
		}
		if (count == 1) return true;
		else return false;
	}
	function validateSelect(selectBox) {
		if (selectBox.value != "") return true;
		else return false;
	}
})