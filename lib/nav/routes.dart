import 'package:get/get.dart';
import 'package:guliva_assessment_app/ui/views/login/login_view.dart';
import 'package:guliva_assessment_app/ui/views/splash/splash_view.dart';
import 'package:yana_app/core/utils/exports.dart';
import 'package:yana_app/ui/modules/credit/credit_binding.dart';
import 'package:yana_app/ui/modules/credit/credit_transfer_info_view.dart';
import 'package:yana_app/ui/modules/credit/credit_transfer_view.dart';
import 'package:yana_app/ui/modules/credit/credit_view.dart';
import 'package:yana_app/ui/modules/credit_details/credit_details_binding.dart';
import 'package:yana_app/ui/modules/credit_details/credit_details_view.dart';
import 'package:yana_app/ui/modules/credit_details/repayment/repayment_transfer.dart';
import 'package:yana_app/ui/modules/credit_details/repayment/repayment_view.dart';
import 'package:yana_app/ui/modules/credit_setup/bank_connection/bank_connection_view.dart';
import 'package:yana_app/ui/modules/credit_setup/bank_connection/bank_setup_view.dart';
import 'package:yana_app/ui/modules/credit_setup/bank_connection/fund_deposit_view.dart';
import 'package:yana_app/ui/modules/credit_setup/credit_setup_binding.dart';
import 'package:yana_app/ui/modules/dashboard/dashboard_binding.dart';
import 'package:yana_app/ui/modules/dashboard/dashboard_utils/legal_webview.dart';
import 'package:yana_app/ui/modules/dashboard/dashboard_utils/main_dashboard_view.dart';
import 'package:yana_app/ui/modules/dashboard/dashboard_utils/pay_legalfees_view.dart';
import 'package:yana_app/ui/modules/dashboard/dashboard_utils/welcome_view.dart';
import 'package:yana_app/ui/modules/deposit/deposit_binding.dart';
import 'package:yana_app/ui/modules/deposit/deposit_funds_view.dart';
import 'package:yana_app/ui/modules/deposit/deposit_view.dart';
import 'package:yana_app/ui/modules/deposit/sending_view.dart';
import 'package:yana_app/ui/modules/deposit/transfer_funds_view.dart';
import 'package:yana_app/ui/modules/deposit_details/deposit_details_bindings.dart';
import 'package:yana_app/ui/modules/deposit_details/deposit_details_view.dart';
import 'package:yana_app/ui/modules/deposit_details/pdfviewer/pdfviewer_view.dart';
import 'package:yana_app/ui/modules/eligibility/cash_eligible_view.dart';
import 'package:yana_app/ui/modules/eligibility/full_eligible_view.dart';
import 'package:yana_app/ui/modules/eligibility/ineligible_view.dart';
import 'package:yana_app/ui/modules/external_account/external_account_bindings.dart';
import 'package:yana_app/ui/modules/external_account/external_account_view.dart';
import 'package:yana_app/ui/modules/external_account/manage_account_view.dart';
import 'package:yana_app/ui/modules/profile/business/business_details_view.dart';
import 'package:yana_app/ui/modules/profile/business/business_document_view.dart';
import 'package:yana_app/ui/modules/profile/business/business_view.dart';
import 'package:yana_app/ui/modules/profile/business/statement_view.dart';
import 'package:yana_app/ui/modules/profile/directory/customer_details/customer_details_view.dart';
import 'package:yana_app/ui/modules/profile/directory/customer_view.dart';
import 'package:yana_app/ui/modules/profile/directory/directory_view.dart';
import 'package:yana_app/ui/modules/profile/directory/vendor_details/vendor_details_view.dart';
import 'package:yana_app/ui/modules/profile/directory/vendor_view.dart';
import 'package:yana_app/ui/modules/profile/nok_view.dart';
import 'package:yana_app/ui/modules/profile/personal_view.dart';
import 'package:yana_app/ui/modules/profile/profile_binding.dart';
import 'package:yana_app/ui/modules/profile/profile_view.dart';
import 'package:yana_app/ui/modules/profile/resaddress_view.dart';
import 'package:yana_app/ui/modules/profile/support/support_view.dart';
import 'package:yana_app/ui/modules/sign_in/signin_binding.dart';
import 'package:yana_app/ui/modules/sign_in/signin_view.dart';

class Routes {
  static const String splash = '/splash';
  static const String register = '/register';
  static const String login = '/login';
}

///This class handles navigation in the app
class Routers {
  final List<GetPage> views = [
    GetPage(
      name: Routes.splash,
      page: () => SplashView(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.register,
      page: () => RegisterView(),
      binding: SignInBinding(),
    ),
  ];
}
