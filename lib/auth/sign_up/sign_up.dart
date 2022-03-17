import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../constant.dart';
import '../../controller/gender_selection_controller.dart';
import '../../controller/sign_up_controller.dart';
import '../login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _animation;
  TextEditingController _fullNameTextEditingController =
      TextEditingController(text: '');
  TextEditingController _emailTextEditingController =
      TextEditingController(text: '');
  TextEditingController _passwordTextEditingController =
      TextEditingController(text: '');

  TextEditingController _phoneTextEditingController =
      TextEditingController(text: '');
  TextEditingController _cityTextEditingController =
      TextEditingController(text: '');

  GenderSelectedController genderSelectedController = Get.find();

  final FocusNode _fullNameFocusNode = FocusNode();

  final FocusNode _emailFocusNode = FocusNode();

  final FocusNode _passwordFocusNode = FocusNode();

  final FocusNode _cityFocusNode = FocusNode();

  final FocusNode _phoneFocusNode = FocusNode();

  // File? imageFile;

  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();

  SignUpController signUpController = Get.put(SignUpController());

  SignUpController signUpControllers = Get.find();

  bool _obscureText = true;
  bool _obscureTexts = true;

  final _globalKey = GlobalKey<FormState>();

  bool _isLoading = false;
  String? url;

  @override
  void dispose() {
    _animationController.dispose();
    _fullNameTextEditingController.dispose();
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _phoneTextEditingController.dispose();
    _cityTextEditingController.dispose();
    _fullNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _phoneFocusNode.dispose();
    _cityFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 20));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _animationController.reset();
              _animationController.forward();
            }
          });
    _animationController.forward();
    super.initState();
  }

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
                        key: _globalKey,
                        child: Column(
                          children: [
                            ///Full name
                            Row(
                              children: [
                                Flexible(
                                  child: TextFormField(
                                    textInputAction: TextInputAction.next,
                                    focusNode: _fullNameFocusNode,
                                    onEditingComplete: () =>
                                        FocusScope.of(context)
                                            .requestFocus(_emailFocusNode),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Field can\'t be missing';
                                      }
                                      return null;
                                    },
                                    controller: _fullNameTextEditingController,
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
                                Flexible(
                                    child: Obx(
                                  () => Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: size.width * 0.24,
                                          height: size.width * 0.18,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            child: signUpController
                                                        .isProfilePicPathSet
                                                        .value ==
                                                    true
                                                ? Image.file(
                                                    File(signUpController
                                                        .profilePicPath.value),
                                                    fit: BoxFit.fill,
                                                  )
                                                : Image.asset(
                                                    'assets/red.JPG',
                                                    fit: BoxFit.fill,
                                                  ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          top: 0.0,
                                          right: 0.0,
                                          child: InkWell(
                                            onTap: () => showModalBottomSheet(
                                                context: context,
                                                builder: (context) =>
                                                    bottomSheet(context)),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.pink,
                                                    border: Border.all(
                                                        color: Colors.white,
                                                        width: 2),
                                                    shape: BoxShape.circle),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    pickedFile == null
                                                        ? Icons.add_a_photo
                                                        : Icons.edit_outlined,
                                                    size: 18,
                                                    color: Colors.white,
                                                  ),
                                                )),
                                          ))
                                    ],
                                  ),
                                )),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            ///Email
                            TextFormField(
                              focusNode: _emailFocusNode,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () => FocusScope.of(context)
                                  .requestFocus(_passwordFocusNode),
                              validator: (value) {
                                if (value!.isEmpty || !value.contains('@')) {
                                  return 'Please enter a valid address';
                                }
                                return null;
                              },
                              controller: _emailTextEditingController,
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
                              focusNode: _passwordFocusNode,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () => FocusScope.of(context)
                                  .requestFocus(_phoneFocusNode),
                              validator: (value) {
                                if (value!.isEmpty || value.length < 7) {
                                  return 'Please enter a valid password';
                                }
                                return null;
                              },
                              obscureText: _obscureText,
                              controller: _passwordTextEditingController,
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    child: Icon(
                                      _obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
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
                              focusNode: _phoneFocusNode,
                              onEditingComplete: () => FocusScope.of(context)
                                  .requestFocus(_cityFocusNode),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Field can\'t be missing';
                                }
                                return null;
                              },
                              onChanged: (val) {
                                print(
                                    '_phoneTextEditingController.text : ${_phoneTextEditingController.text}');
                              },
                              controller: _phoneTextEditingController,
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

                    /// Chose city
                    GestureDetector(
                      onTap: () => _showCity(size),
                      child: Align(
                        alignment: Alignment.center,
                        child: TextFormField(
                          enabled: false,
                          focusNode: _cityFocusNode,
                          textInputAction: TextInputAction.done,
                          onEditingComplete: signUp,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field can\'t be missing';
                            }
                            return null;
                          },
                          onChanged: (value) {},
                          controller: _cityTextEditingController,
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
                    _isLoading
                        ? Center(
                            child: Container(
                              width: 70,
                              height: 70,
                              child: const CircularProgressIndicator(),
                            ),
                          )
                        : MaterialButton(
                            onPressed: signUp,
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
                          ),
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
                              ..onTap = () => Get.to(const LoginScreen()),
                            /*
                                    Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const LoginScreen())),


                                     */

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

  void _showCity(size) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(
              'Chose city ',
              style: TextStyle(color: Colors.pink.shade300, fontSize: 20),
            ),
            content: Container(
              width: size.width * 0.9,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(40)),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: Constants.city.length,
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _cityTextEditingController.text =
                              Constants.city[index];
                        });
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
            ],
          );
        });
  }

  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          const Text(
            'Please choose an option',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.camera_alt,
                      color: Colors.redAccent,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Camera',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                onTap: () {
                  takePhoto(ImageSource.camera);
                },
              ),
              const SizedBox(
                width: 80,
              ),
              InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.image,
                      color: Colors.redAccent,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Gallery',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    )
                  ],
                ),
                onTap: () {
                  takePhoto(ImageSource.gallery);
                },
              )
            ],
          )
        ],
      ),
    );
  }

  void signUp() {
    final _isValid = _globalKey.currentState!.validate();
    if (_isValid) {
      //  print(_fullNameTextEditingController.text) ;
      //  print(_emailTextEditingController.text) ;
      //  print(_phoneTextEditingController.text) ;
      //  print(_passwordTextEditingController.text) ;
      //  print(_positionCPTextEditingController.text) ;
      //  print(genderSelectedController.selectedGender.value) ;
      //  print(signUpController.profilePicPath.value) ;

      signUpController.signUpUser(
          _fullNameTextEditingController.text,
          _emailTextEditingController.text,
          _phoneTextEditingController.text,
          _passwordTextEditingController.text,
          genderSelectedController.selectedGender.value,
          _cityTextEditingController.text
      );
    } else {
      return null;
    }
  }

  void takePhoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);
    pickedFile = File(pickedImage!.path);
    signUpController.setProfileImagePath(pickedFile!.path);
    Get.back();
    //print(pickedFile);
  }
}
