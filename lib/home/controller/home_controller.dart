import 'package:flutter_application_1/login2/login_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {


 @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var _loginController = Get.find<LoginController>();
/*     String? estado=_loginController.usuarioLogin!.usuario!.estado;
    print(_loginController.usuarioLogin!.usuario!.estado);
  if(identical(estado,0)){

    print("Esta desactivado");
  }else{
    print("No esta desactivado");
  } */
   
  }

}