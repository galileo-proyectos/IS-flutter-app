import 'package:multi_screen_app/src/providers/ProviderUser.dart';
import 'package:multi_screen_app/src/models/ModelUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DefaultProvider extends ChangeNotifier {
  bool _loading = false;

  @protected
  final ModelUser user;

  DefaultProvider(BuildContext ctx):
        user = Provider.of<ProviderUser>(ctx, listen: false).user
  {
    if (!user.isLoggedIn()) {
      throw ArgumentError.notNull('user');
    }
  }

  bool isLoading () => _loading;

  @protected
  void onLoading () {
    _loading = true;
  }
  void offLoading () {
    _loading = false;
  }
}