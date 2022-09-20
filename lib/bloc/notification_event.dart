class notification_event
{
  List<Object> get prob=>[];
}
class switchPressed extends notification_event
{
  final bool value;
  switchPressed(this.value);
}