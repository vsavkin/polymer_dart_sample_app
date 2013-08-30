import 'package:polymer/polymer.dart';
import '../app.dart';

@CustomTag("x-auctions")
class AuctionsView extends PolymerElement with ObservableMixin {
  @observable AuctionList auctionList;
}
