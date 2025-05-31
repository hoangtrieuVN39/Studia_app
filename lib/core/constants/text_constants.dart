import 'package:studia/core/constants/language_constants.dart';
import 'package:studia/core/di/provider.dart';

class AppTextConstants {
  final LanguageProvider languageProvider;

  AppTextConstants(this.languageProvider);

  String _get(Map<int, String> map) =>
      map[languageProvider.language.code] ?? '';
  String _getResult(int score, int total) =>
      _result(score, total)[languageProvider.language.code] ?? '';

  String get appName => _appName;
  String get appDescription => _appDescription;
  String get appVersion => _appVersion;
  String get appAuthor => _appAuthor;

  String get pleaseLogin => _get(_pleaseLogin);
  String get continueWithGoogle => _get(_continueWithGoogle);
  String get welcome => _get(_welcome);
  String get setup => _get(_setup);
  String get firstName => _get(_firstName);
  String get lastName => _get(_lastName);
  String get gender => _get(_gender);
  String get yearOfBirth => _get(_yearOfBirth);
  String get currentSchoolLevel => _get(_currentSchoolLevel);
  String get favoriteTopics => _get(_favoriteTopics);
  String get favoriteTopicsHint => _get(_favoriteTopicsHint);
  String get continueButton => _get(_continueButton);
  String get home => _get(_home);
  String get viewInfo => _get(_viewInfo);
  String get play => _get(_play);
  String get submit => _get(_submit);
  String get viewSolution => _get(_viewSolution);
  String get next => _get(_next);
  String get solution => _get(_solution);
  String get playAgain => _get(_playAgain);
  String get quitWarning => _get(_quitWarning);
  String get quit => _get(_quit);
  String get stay => _get(_stay);
  String get viewResults => _get(_viewResults);
  String get answer => _get(_answer);
  String get done => _get(_done);
  String getResult(int score, int total) => _getResult(score, total);
  String get chatPlaceholder => _get(_chatPlaceholder);
  String get hello => _get(_hello);
  String get help => _get(_help);
  String get giveAdvice => _get(_giveAdvice);
  String get howToUse => _get(_howToUse);
  String get canILearnThis => _get(_canILearnThis);
  String get menu => _get(_menu);
  String get profile => _get(_profile);
  String get skills => _get(_skills);
  String get settings => _get(_settings);
  String get logout => _get(_logout);
  String get editProfile => _get(_editProfile);
  String get skillsOverview => _get(_skillsOverview);
  String get viewAll => _get(_viewAll);
  String get learnedSkills => _get(_learnedSkills);
  String get avgPerformance => _get(_avgPerformance);
  String get latestSkills => _get(_latestSkills);
  String get oldestSkills => _get(_oldestSkills);
  String get mostPerformancedSkills => _get(_mostPerformancedSkills);
  String get leastPerformancedSkills => _get(_leastPerformancedSkills);
  String get progress => _get(_progress);
  String get domain => _get(_domain);
  String get level => _get(_level);
  String get standards => _get(_standards);
  String get subStandard => _get(_subStandard);
  String get description => _get(_description);
  String get language => _get(_language);
  String get inputYourFirstName => _get(_inputYourFirstName);
  String get inputYourLastName => _get(_inputYourLastName);
  String get chat => _get(_chat);
  String get levelDetails => _get(_levelDetails);
  String get skillDetails => _get(_skillDetails);
  String get domainDetails => _get(_domainDetails);
  String get standardDetails => _get(_standardDetails);
  String get sortBy => _get(_sortBy);
  String get male => _get(_male);
  String get female => _get(_female);
  String get other => _get(_other);
  String get maleDisplayName => _get(_maleDisplayName);
  String get femaleDisplayName => _get(_femaleDisplayName);
  String get otherDisplayName => _get(_otherDisplayName);

  static const String _appName = 'Studia';
  static const String _appDescription = 'The best way to study';
  static const String _appVersion = '1.0.0';
  static const String _appAuthor = 'Studia';

  // Auth
  static const Map<int, String> _pleaseLogin = {
    0: 'Vui lòng đăng nhập để tiếp tục!',
    1: 'Please login to continue!',
  };
  static const Map<int, String> _continueWithGoogle = {
    0: 'Tiếp tục với Google',
    1: 'Continue with Google',
  };
  static const Map<int, String> _welcome = {
    0: 'Chào mừng đến với',
    1: 'Welcome to',
  };
  static const Map<int, String> _inputYourFirstName = {
    0: 'Nhập tên của bạn',
    1: 'Input your first name',
  };
  static const Map<int, String> _inputYourLastName = {
    0: 'Nhập họ của bạn',
    1: 'Input your last name',
  };

  // Register
  static const Map<int, String> _setup = {0: 'Thiết lập', 1: 'Setup'};
  static const Map<int, String> _firstName = {0: 'Tên', 1: 'First Name'};
  static const Map<int, String> _lastName = {0: 'Họ', 1: 'Last Name'};
  static const Map<int, String> _gender = {0: 'Giới tính', 1: 'Gender'};
  static const Map<int, String> _yearOfBirth = {
    0: 'Năm sinh',
    1: 'Year of Birth',
  };
  static const Map<int, String> _currentSchoolLevel = {
    0: 'Trình độ học tập',
    1: 'Current School Level',
  };
  static const int yearOfBirthMin = 1900;
  static const int yearOfBirthMax = 2025;
  static const int yearOfBirthDefault = 2024;

  static const Map<int, String> _favoriteTopics = {
    0: 'Chủ đề yêu thích (Tùy chọn)',
    1: 'Favorite Topics (Optional)',
  };
  static const Map<int, String> _favoriteTopicsHint = {
    0: 'Chọn chủ đề bên dưới',
    1: 'Pick topics below',
  };

  static const Map<int, String> _continueButton = {
    0: 'Tiếp tục',
    1: 'Continue',
  };

  // Home
  static const Map<int, String> _home = {0: 'Trang chủ', 1: 'Home'};
  static const Map<int, String> _viewInfo = {
    0: 'Xem thông tin',
    1: 'View info',
  };
  static const Map<int, String> _play = {0: 'Chơi', 1: 'Play'};

  // Playground
  static const Map<int, String> _submit = {0: 'Nộp bài', 1: 'Submit'};
  static const Map<int, String> _viewSolution = {
    0: 'Xem cách giải',
    1: 'View solution',
  };
  static const Map<int, String> _next = {0: 'Tiếp theo', 1: 'Next'};
  static const Map<int, String> _solution = {0: 'Cách giải', 1: 'Solution'};
  static const Map<int, String> _playAgain = {0: 'Chơi lại', 1: 'Play again'};

  static const Map<int, String> _quitWarning = {
    0: 'Nếu bạn thoát, quá trình sẽ mất!',
    1: 'If you quit, your progress will be lost!',
  };
  static const Map<int, String> _quit = {0: 'Thoát', 1: 'Quit'};
  static const Map<int, String> _stay = {0: 'Ở lại', 1: 'Stay'};
  static const Map<int, String> _viewResults = {
    0: 'Xem kết quả',
    1: 'View results',
  };
  static const Map<int, String> _answer = {0: 'Câu trả lời', 1: 'Answer'};
  static const Map<int, String> _done = {0: 'Hoàn tất', 1: 'Done'};

  static Map<int, String> _result(int score, int total) {
    return {
      0: 'Đúng $score trên $total câu!',
      1: 'Correct $score out of $total!',
    };
  }

  // Chat
  static const Map<int, String> _chat = {0: 'Chat', 1: 'Chat'};
  static const Map<int, String> _chatPlaceholder = {
    0: 'Chat thôi!',
    1: 'Have a chat!',
  };
  static const Map<int, String> _hello = {0: 'Xin chào', 1: 'Hello'};
  static const Map<int, String> _help = {0: 'Giúp đỡ', 1: 'Help'};
  static const Map<int, String> _giveAdvice = {
    0: 'Cho tư vấn',
    1: 'Give advice',
  };
  static const Map<int, String> _howToUse = {
    0: 'Cách sử dụng',
    1: 'How to use',
  };
  static const Map<int, String> _canILearnThis = {
    0: 'Có thể học được không?',
    1: 'Can I learn this?',
  };

  // Menu
  static const Map<int, String> _menu = {0: 'Menu', 1: 'Menu'};
  static const Map<int, String> _profile = {0: 'Hồ sơ', 1: 'Profile'};
  static const Map<int, String> _skills = {0: 'Kỹ năng', 1: 'Skills'};
  static const Map<int, String> _settings = {0: 'Cài đặt', 1: 'Settings'};
  static const Map<int, String> _logout = {0: 'Đăng xuất', 1: 'Logout'};

  // Profile
  static const Map<int, String> _editProfile = {
    0: 'Chỉnh sửa hồ sơ',
    1: 'Edit profile',
  };
  static const Map<int, String> _skillsOverview = {
    0: 'Tổng quan kỹ năng',
    1: 'Skills overview',
  };
  static const Map<int, String> _viewAll = {0: 'Xem tất cả', 1: 'View all'};
  static const Map<int, String> _learnedSkills = {
    0: 'Kỹ năng đã học',
    1: 'Learned skills',
  };
  static const Map<int, String> _avgPerformance = {
    0: 'Hiệu suất trung bình',
    1: 'Avg. performance',
  };
  static const Map<int, String> _latestSkills = {0: 'Mới nhất', 1: 'Latest'};
  static const Map<int, String> _oldestSkills = {0: 'Cũ nhất', 1: 'Oldest'};
  static const Map<int, String> _mostPerformancedSkills = {
    0: 'Hiệu suất cao nhất',
    1: 'Most performanced',
  };
  static const Map<int, String> _leastPerformancedSkills = {
    0: 'hiệu suất thấp nhất',
    1: 'Least performanced',
  };
  static const Map<int, String> _sortBy = {0: 'Sắp xếp theo', 1: 'Sort by'};
  static const Map<int, String> _male = {0: 'male', 1: 'male'};
  static const Map<int, String> _female = {0: 'female', 1: 'female'};
  static const Map<int, String> _other = {0: 'other', 1: 'other'};
  static const Map<int, String> _maleDisplayName = {0: 'male', 1: 'male'};
  static const Map<int, String> _femaleDisplayName = {0: 'Nữ', 1: 'Female'};
  static const Map<int, String> _otherDisplayName = {0: 'Khác', 1: 'Other'};

  // Information
  static const Map<int, String> _progress = {0: 'Tiến độ', 1: 'Progress'};
  static const Map<int, String> _domain = {0: 'Lĩnh vực', 1: 'Domain'};
  static const Map<int, String> _level = {0: 'Cấp độ', 1: 'Level'};
  static const Map<int, String> _standards = {0: 'Tiêu chuẩn', 1: 'Standards'};
  static const Map<int, String> _subStandard = {
    0: 'Tiêu chuẩn phụ',
    1: 'Substandard',
  };
  static const Map<int, String> _description = {0: 'Mô tả', 1: 'Description'};
  static const Map<int, String> _levelDetails = {
    0: 'Chi tiết cấp độ',
    1: 'Level details',
  };
  static const Map<int, String> _skillDetails = {
    0: 'Chi tiết kỹ năng',
    1: 'Skill details',
  };
  static const Map<int, String> _domainDetails = {
    0: 'Chi tiết lĩnh vực',
    1: 'Domain details',
  };
  static const Map<int, String> _standardDetails = {
    0: 'Chi tiết tiêu chuẩn',
    1: 'Standard details',
  };

  // Settings
  static const Map<int, String> _language = {0: 'Ngôn ngữ', 1: 'Language'};
}
