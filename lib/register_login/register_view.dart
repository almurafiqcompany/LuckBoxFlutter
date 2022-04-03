import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../constant.dart';
import '../logic/controllers/register_controller.dart';
import '../routes/routes.dart';


class RegisterView extends GetView <RegisterController>{
  RegisterView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.redAccent,
        body: SafeArea(
          child: Stack(
            //alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.18,
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/red.JPG'),
                        ),
                      ),
                    ),

                    const Text(
                      "Register",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),

                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Form(
                        key: controller.registerGlobalKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          children: [
                            ///Full name
                            Row(
                              children: [
                                Flexible(
                                  child: TextFormField(
                                    textInputAction: TextInputAction.next,

                                    onSaved: (value) {
                                      controller.name = value!;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Field can\'t be missing';
                                      }
                                      return null;
                                    },
                                    controller: controller
                                        .fullNameTextEditingController,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                        hintText: 'Full name',
                                        prefixIcon: const Icon(
                                          Icons.person,
                                          color: Colors.white,
                                        ),
                                        hintStyle: const TextStyle(
                                            color: Colors.white),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.white),
                                            borderRadius:
                                            BorderRadius.circular(20)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                                color: Colors.pink.shade700)),
                                        errorBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                                color: Colors.red))),
                                  ),
                                  flex: 3,
                                ),


                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            ///Email
                            TextFormField(
                              //   focusNode: _emailFocusNode,
                              textInputAction: TextInputAction.next,
                              // onEditingComplete: () => FocusScope.of(context)
                              //   .requestFocus(_passwordFocusNode),
                              validator: (value) {
                                 return controller.validateEmail(value!);
                              },
                              onSaved: (value) {
                                controller.email = value!;
                              },
                              controller: controller.emailTextEditingController,
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  prefixIcon: const Icon(
                                    Icons.email_outlined,
                                    color: Colors.white,
                                  ),
                                  hintStyle:
                                  const TextStyle(color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: Colors.pink.shade700)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                      const BorderSide(color: Colors.red))),
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            ///Password
                            TextFormField(
                              //   focusNode: _passwordFocusNode,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                   return controller.validatePassword(value!);
                              },
                              onSaved: (value) {
                                controller.password = value!;
                              },
                              //  obscureText: _obscureText,
                              controller:
                              controller.passwordTextEditingController,
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      //        setState(() {
                                      //        _obscureText = !_obscureText;
                                      //   });
                                    },
                                    child: const Icon(Icons.visibility_off ,
                                      // _obscureText
                                      //  ? Icons.visibility
                                      //: Icons.visibility_off,
                                      color: Colors.white,
                                    ),
                                  ),
                                  hintText: 'Password',
                                  hintStyle:
                                  const TextStyle(color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: Colors.pink.shade700)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                      const BorderSide(color: Colors.red))),
                            ),

                            const SizedBox(
                              height: 10,
                            ),

                            /// phone number
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Field can\'t be missing';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                controller.phone = value!;
                              },
                              onChanged: (val) {},
                              controller: controller.phoneTextEditingController,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.phone,
                                    color: Colors.white,
                                  ),
                                  hintText: 'Phone number',
                                  hintStyle:
                                  const TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: Colors.pink.shade700)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                      const BorderSide(color: Colors.red))),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
/*
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Expanded(
                              child: Text(
                            'Gender',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                          Row(
                            children: [
                              Obx(
                                () => Radio(
                                  value: 'Male',
                                  groupValue: genderSelectedController
                                      .selectedGender.value,
                                  onChanged: (value) {
                                    genderSelectedController
                                        .onChangeGender(value);
                                  },
                                  activeColor: Colors.white,
                                  fillColor:
                                      MaterialStateProperty.all(Colors.white),
                                ),
                              ),
                              const Text(
                                'Male',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Obx(
                                () => Radio(
                                  value: 'Female',
                                  groupValue: genderSelectedController
                                      .selectedGender.value,
                                  onChanged: (value) {
                                    genderSelectedController
                                        .onChangeGender(value);
                                  },
                                  activeColor: Colors.white,
                                  fillColor:
                                      MaterialStateProperty.all(Colors.white),
                                ),
                              ),
                              const Text(
                                'Female',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                    ),


 */

                    /// Chose city
                    GestureDetector(
                      onTap: () => _showCity(context , size),
                      child: Align(
                        alignment: Alignment.center,
                        child: TextFormField(
                          enabled: false,
                          // focusNode: _cityFocusNode,
                          textInputAction: TextInputAction.done,
                    //      onEditingComplete: signUp,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field can\'t be missing';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            controller.governateTextEditingController =
                            value! as TextEditingController;
                          },
                          onChanged: (value) {},
                          controller: controller.governateTextEditingController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintText: 'Chose city',
                              hintStyle: const TextStyle(color: Colors.white),
                              prefixIcon: const Icon(
                                Icons.location_city,
                                color: Colors.white,
                              ),
                              suffixIcon: const Icon(Icons.filter_list,
                                  color: Colors.white),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.pink.shade700)),
                              errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red))),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 16,
                    ),
                    Obx(() => controller.isLoading.value == true
                        ? Center(
                      child: Container(
                        width: 70,
                        height: 70,
                        child: const CircularProgressIndicator(),
                      ),
                    )
                        : const Text('') ),
                    const SizedBox(
                      height: 16,
                    ),
                    MaterialButton(
                      // onPressed: signUp,
                      onPressed: ()async {
                        await controller.doRegister() ;
                        print('${controller.fullNameTextEditingController.text} 12334556667') ;

                      },
                      color: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide.none),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            child: Text('Register',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.person_add,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ) ,
                    const SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: RichText(
                          text: TextSpan(children: [
                            const TextSpan(
                                text: 'Already have an account ?',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            const TextSpan(text: '   '),
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Get.offAllNamed(AppRoutes.login),
                                text: 'Login',
                                style: TextStyle(
                                    color: Colors.blue.shade300,
                                    decoration: TextDecoration.underline,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold))
                          ])),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }


  _showCity(BuildContext context , size) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(
              'Jobs ',
              style: TextStyle(color: Colors.pink.shade300, fontSize: 20),
            ),
            content: Container(
              width: size.width * 0.9,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: Constants.city.length,
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () {

                        controller.governateTextEditingController.text =
                        Constants.city[index];

                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle_rounded,
                            color: Colors.red[200],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              Constants.city[index],
                              style: const TextStyle(
                                  color: Color(0xFF00325A),
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.canPop(context) ? Navigator.pop(context) : null;
                },
                child: const Text('Close'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Cancel filter'),
              )
            ],
          );
        });
  }


}
