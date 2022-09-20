class Auth_event
{
  List<Object> get prob=>[];
}
class LoginButtonPressed extends Auth_event
{
  final String UserName;
  final String Password;
  LoginButtonPressed(this.UserName,this.Password);
}