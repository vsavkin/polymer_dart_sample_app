import 'dart:html';
import 'dart:async';
import 'package:polymer/polymer.dart';
import '../app.dart';

@CustomTag("x-auction")
class AuctionView extends PolymerElement with ObservableMixin {
  @observable Auction auction;
  @observable String bid = "";
  @observable String timeLeft = "";

  Map errors = toObservable({});

  inserted() => runEvery(_updateTimeLeft, seconds: 1);

  makeBid() => eventBus.fire("makeBid", _makeBuildEvent(double.parse(bid)));
  buy()     => eventBus.fire("buy",     _makeBuyEvent());

  reset(){
    errors.clear();
    bid = "";
  }

  setErrors(err){
    errors.clear();
    errors.addAll(err);
  }

  _makeBuildEvent(amount) => {"bid" : amount, "auction" : auction, "view" : this};

  _makeBuyEvent() => {"auction" : auction};

  _updateTimeLeft() => timeLeft = diffInSec(auction.endingDate);

}
