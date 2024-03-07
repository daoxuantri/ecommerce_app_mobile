import 'package:ecommerce_app_mobile/api/user_signin.dart';
import 'package:ecommerce_app_mobile/screens/login_register/login/components/default_button.dart';
import 'package:ecommerce_app_mobile/screens/login_register/login/login_screen.dart';
import 'package:ecommerce_app_mobile/screens/login_register/register/bloc/sign_up_bloc.dart';
import 'package:ecommerce_app_mobile/security_user/keyboard.dart';
import 'package:flutter/material.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key, required this.signUpBloc});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
  final SignUpBloc signUpBloc;
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  late PageController _pageController;
  late List<TextEditingController> _textControllers;

  late double heightForm;
  late int _currentPageIndex;
  String? username;
  String? numberPhone;
  String? email;
  String? password;
  String? confirmPassword;
  String errorText_email = '';

  String wrongPassword = '';

  late bool obscureText;
  late bool obscureText_cf;


  late bool check1;
  late bool check2;
  late bool check3;
  late bool check4;
  late bool check5;
  
   bool value = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _textControllers = List<TextEditingController>.generate(
      5,
      (_) => TextEditingController(),
    );
    _currentPageIndex = 0;
    heightForm = getProportionateScreenHeight(355);
    check1 = false;
    check2 = false;
    check3 = false;
    check4 = false;
    check5 = false;
    obscureText = true;
    obscureText_cf = true;
  }
  

  @override
  void dispose() {
    _pageController.dispose();
    for (var controller in _textControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _goToNextPage() {
    if (_currentPageIndex < 1) {
      setState(() {
        _currentPageIndex++;
      });
      _pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.bounceIn);
    }
  }

  void _goToPreviousPage() {
    if (_currentPageIndex > 0) {
      setState(() {
        _currentPageIndex--;
      });
      _pageController.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.bounceIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundcolor,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(
              child: Column(
                children: [
                  FormStart(),
                ],
              ),
            ),
            SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:  <Widget>[ 
                  Checkbox(
                  value: this.value,
                  fillColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.red; // Màu nền khi checkbox được check
                    } else if (states.contains(MaterialState.disabled)) {
                      return Colors.grey; // Màu nền khi checkbox bị vô hiệu hóa
                    } else {
                      return Colors.transparent; // Màu nền khi checkbox không được check
                    }
                  }),
                  checkColor: Colors.white,
                  onChanged: (bool? newValue) {  // Change the parameter type to bool?
                    setState(() {
                      this.value = newValue ?? false; // Handle null case if needed
                    });
                  },
                ),  
                Text(
                  "  Tôi đồng ý với",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(15),
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                      onTap: () {},
                      child: Text(
                        " Điều khoản bảo mật cá nhân",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(15),
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                    Text(
                      ".",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(15),
                        color: Colors.black,
                      ),
                    ),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            DefaultButton(
              text: 'Đăng ký ngay',
              press: () async {
                if(_formKey.currentState!.validate()){
                  _formKey.currentState!.save();
                  KeyboardUtil.hideKeyboard(context);
                  try{
                    widget.signUpBloc.add(SignUpClickedEvent(
                    email: email.toString(),
                    phone: numberPhone.toString(),
                    username: username.toString(),
                    password: password.toString(),));

                    
                  }catch(e){
                     wrongPassword = e.toString();
                    if (wrongPassword.startsWith('Exception: ')) {
                      wrongPassword =
                          wrongPassword.substring('Exception: '.length);
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBarLoginFail(wrongPassword),
                    ); 
                  }
                }
                
              },
            )
          ],
        ),
      ),
    );
  }

  TextFormField NameFormField() {
    return TextFormField(
      controller: _textControllers[0],
      keyboardType: TextInputType.name,
      onSaved: (newValue) => username = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          if (check1 == false) {
            check1 = true;
            setState(() {
              heightForm = heightForm + getProportionateScreenHeight(20);
            });
          }
          return kNamelNullError;
        }
        if (check1 == true) {
          check1 = false;
          setState(() {
            heightForm = heightForm - getProportionateScreenHeight(20);
          });
        }
        return null;
      },
      style: TextStyle(
        fontSize: getProportionateScreenHeight(18),
        color: Colors.black,
      ),
      decoration: InputDecoration(
        labelText: "Họ và tên",
        labelStyle: TextStyle(color: Colors.black), 
        
      ),
      onChanged: (value) =>username=value,
    );
  }

  TextFormField NumberPhoneFormField() {
    return TextFormField(
      controller: _textControllers[1],
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => numberPhone = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          if (check2 == false) {
            check2 = true;
            setState(() {
              heightForm = heightForm + getProportionateScreenHeight(20);
            });
          }
          return kPhoneNumberNullError;
        }
        if (phoneValidatorRegExp.hasMatch(value) == false) {
          if (check2 == false) {
            check2 = true;
            setState(() {
              heightForm = heightForm + getProportionateScreenHeight(20);
            });
          }
          return kInvalidPhoneNumberError;
        }
        if (check2 == true) {
          check2 = false;
          setState(() {
            heightForm = heightForm - getProportionateScreenHeight(20);
          });
        }
        return null;
      },
      style: TextStyle(
        fontSize: getProportionateScreenHeight(18),
        color: Colors.black,
      ),
      decoration: InputDecoration(
        labelText: "Số điện thoại",
        labelStyle: TextStyle(color: Colors.black), 
      ),
      onChanged: (value) => numberPhone=value,
    );
  }


  TextFormField EmailFormField() {
    return TextFormField(
      controller: _textControllers[2],
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        // if (errorText_email.length != 0) {
        //   setState(() {
        //     errorText_email = '';
        //   });
        // }
        email=value;
      },
      onSaved: (newValue) => email = newValue,
      validator: (value) {
        if (errorText_email.length != 0) {
          if (check3 == false) {
            check3 = true;
            check3 = true;
            setState(() {
              heightForm = heightForm + getProportionateScreenHeight(20);
            });
          }
          return errorText_email;
        }
        if (value!.isEmpty) {
          if (check3 == false) {
            check3 = true;
            check3 = true;
            setState(() {
              heightForm = heightForm + getProportionateScreenHeight(20);
            });
          }
          return kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          if (check3 == false) {
            check3 = true;
            check3 = true;
            setState(() {
              heightForm = heightForm + getProportionateScreenHeight(20);
            });
          }
          return kInvalidEmailError;
        }
        if (check3 == true) {
          check3 = false;
          setState(() {
            heightForm = heightForm - getProportionateScreenHeight(20);
          });
        }
        return null;
      },
      style: TextStyle(
        fontSize: getProportionateScreenHeight(18),
        color: Colors.black,
      ),
      decoration: InputDecoration( 
        labelText: "Địa chỉ email", 
        labelStyle: TextStyle(color: Colors.black), 
      ),
    );
  }

  TextFormField PasswordFormField() {
    return TextFormField(
      controller: _textControllers[3],
      obscureText: obscureText,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          if (check4 == false) {
            check4 = true;
            setState(() {
              heightForm = heightForm + getProportionateScreenHeight(20);
            });
          }
          return kPassNullError;
        }
        if (value.length < 8) {
          if (check4 == false) {
            check4 = true;
            setState(() {
              heightForm = heightForm + getProportionateScreenHeight(20);
            });
          }
          return kShortPassError;
        }
        if (confirmPassword != value) {
          if (check4 == false) {
            check4 = true;
            setState(() {
              heightForm = heightForm + getProportionateScreenHeight(20);
            });
          }
          return kMatchPassError;
        }
        if (check4 == true) {
          check4 = false;
          setState(() {
            heightForm = heightForm - getProportionateScreenHeight(20);
          });
        }
        return null;
      },
      style: TextStyle(
        fontSize: getProportionateScreenHeight(18),
        color: Colors.black,
      ),
      decoration: InputDecoration(
        labelText: "Mật khẩu",
        labelStyle: TextStyle(color: Colors.black), 
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: getProportionateScreenWidth(10)),
          child: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: obscureText == true
                ? Icon(Icons.visibility_off)
                : Icon(Icons.visibility),
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  TextFormField ConfirmPasswordFormField() {
    return TextFormField(
      controller: _textControllers[4],
      obscureText: obscureText_cf,
      onSaved: (newValue) => confirmPassword = newValue,
      onChanged: (value) {
        confirmPassword = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          if (check5 == false) {
            check5 = true;
            setState(() {
              heightForm = heightForm + getProportionateScreenHeight(20);
            });
          }
          return kPassNullError;
        }
        if (value.length < 8) {
          if (check5 == false) {
            check5 = true;
            setState(() {
              heightForm = heightForm + getProportionateScreenHeight(20);
            });
          }
          return kShortPassError;
        }
        if (password != value) {
          if (check5 == false) {
            check5 = true;
            setState(() {
              heightForm = heightForm + getProportionateScreenHeight(20);
            });
          }
          return kMatchPassError;
        }
        if (check5 == true) {
          check5 = false;
          setState(() {
            heightForm = heightForm - getProportionateScreenHeight(20);
          });
        }
        return null;
      },
      style: TextStyle(
        fontSize: getProportionateScreenHeight(18),
        color: Colors.black,
      ),
      decoration: InputDecoration(
        labelText: "Nhập lại mật khẩu",
        labelStyle: TextStyle(color: Colors.black), 
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: getProportionateScreenWidth(10)),
          child: IconButton(
            onPressed: () {
              setState(() {
                obscureText_cf = !obscureText_cf;
              });
            },
            icon: obscureText_cf == true
                ? Icon(Icons.visibility_off)
                : Icon(Icons.visibility),
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Container FormStart() {
    return Container( 
      child: Column(
        children: [
          NameFormField(),
          SizedBox(height: getProportionateScreenHeight(13)),
          NumberPhoneFormField(),
          SizedBox(height: getProportionateScreenHeight(13)),
          EmailFormField(),
          SizedBox(height: getProportionateScreenHeight(13)),
          PasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(13)),
          ConfirmPasswordFormField(),
        ],
      ),
    );
  }
  VoidCallback TiepTuc() {
    return () {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        KeyboardUtil.hideKeyboard(context);
        _goToNextPage();
      }
    };
  }

  VoidCallback DangKyNgay() {
    return () async {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        KeyboardUtil.hideKeyboard(context);
        try {
          await ApiServiceVendors()
              .signUpMini(email!, numberPhone!, password!, username!);
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBarLoginSuccess(),
          );
        } catch (e) {
          String error = e.toString();
          if (error.startsWith('Exception: ')) {
            error = error.substring('Exception: '.length);
          }
          if (error.startsWith('E')) {
            errorText_email = error;
            _formKey.currentState!.validate();
          } else if (error.startsWith('T')) {
            // errorText_storename = error;
            _goToPreviousPage();
            _formKey.currentState!.validate();
          }
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBarLoginFail(error),
          // );
        }
      }
    };
  }

  SnackBar SnackBarLoginSuccess() {
    return SnackBar(
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        padding: EdgeInsets.all(getProportionateScreenWidth(10)),
        height: getProportionateScreenHeight(50),
        width: SizeConfig.screenWidth * 0.6,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Colors.white,
            ),
            SizedBox(width: getProportionateScreenWidth(25)),
            Text(
              'Đăng ký thành công',
              style: TextStyle(
                color: Colors.white,
                fontSize: getProportionateScreenWidth(15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SnackBar SnackBarLoginFail(String wrongPassword) {
    return SnackBar(
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        padding: EdgeInsets.all(getProportionateScreenWidth(10)),
        height: getProportionateScreenHeight(50),
        width: SizeConfig.screenWidth * 0.6,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.white,
            ),
            SizedBox(width: getProportionateScreenWidth(25)),
            Text(
              wrongPassword,
              style: TextStyle(
                color: Colors.white,
                fontSize: getProportionateScreenWidth(14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
