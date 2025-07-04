class AppStrings {
  // Language Selection Screen
  static const String chooseLanguage = "Choose Your Language";
  static const String selectLanguage = "Select Language";
  static const String continueText = "Continue";

  // Welcome/Signup Screen
  static const String welcomeTitle = "Welcome!";
  static const String registerSubtitle = "Please register to continue";
  static const String nameHint = "Full Name";
  static const String emailHint = "Email Address";
  static const String passwordHint = "Password";
  static const String whatsappHint = "WhatsApp Number";
  static const String mobileHint = "Mobile Number";
  static const String signupButton = "Sign Up";
  static const String alreadyHaveAccount = "Already have an account? ";
  static const String signinText = "Sign In";

  // Supported Languages
  static const List<Map<String, String>> languages = [
    {"code": "en", "name": "English"},
    {"code": "hi", "name": "हिंदी"},
    {"code": "bn", "name": "বাংলা"},
    {"code": "ta", "name": "தமிழ்"},
    {"code": "te", "name": "తెలుగు"},
    {"code": "mr", "name": "मराठी"},
    {"code": "es", "name": "Español"},
    {"code": "fr", "name": "Français"},
  ];

  // OTP Verification Screen
  static const String otpVerificationTitle = "WhatsApp OTP Verification";
  static const String otpVerificationSubtitle =
      "Please ensure that the email id mentioned is valid as we have sent an OTP to your email.";
  static const String resendOtpText = "Didn't receive OTP code? Resend OTP";
  static const String verifyButton = "Verify";

  // Login Screen
  static const String loginTitle = "Welcome Back!";
  static const String loginSubtitle = "Login to continue";
  static const String loginButton = "Login";
  static const String dontHaveAccount = "Don't have an account? ";
  static const String signupText = "Signup";

  // Dashboard Strings
  static const String dashboardTitle = 'Dashboard';
  static const String welcomeMessage = 'Welcome to Calley!';
  static const String loadNumbersTitle = 'LOAD NUMBER TO CALL';
  static const String loadNumbersText = ' to upload numbers that you wish to call using Calley Mobile App.';
  static const String calleyUrl = 'https://app.getcalley.com';
  static const String startCalling = 'Start Calling Now';

  // Add these new strings
  static const String callingListsTitle = 'Calling Lists';
  static const String selectCallingList = 'Select Calling List';
  static const String testList = 'Test List';

  // Graph View Screen
  static const String graphViewTitle = 'Dashboard';
  // static const String testList = 'Test List';
  static const String totalCalls = 'CALLS';
  static const String pending = 'Pending';
  static const String done = 'Done';
  static const String scheduled = 'Scheduled';
  // static const String startCalling = 'Start Calling Now';
}