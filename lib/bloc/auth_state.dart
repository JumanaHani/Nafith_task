class Auth_state
{
  List<Object> get prob=>[];
}
class InitLoginState extends Auth_state
{

}
class LoginLoadingState extends Auth_state{}
class UserLoginSuccess extends Auth_state
{

}
class UserLoginFaild extends Auth_state
{
  final String errorMsg;
UserLoginFaild(this.errorMsg);
}