import 'package:polymer/polymer.dart';
import '../app.dart';

@CustomTag("x-user-info")
class UserInfoView extends PolymerElement with ObservableMixin {
  @observable User user;
}
