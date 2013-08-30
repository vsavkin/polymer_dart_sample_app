library auctions;

import 'dart:html';
import 'dart:async';
import 'package:polymer/polymer.dart';
import 'package:fp/fp.dart' as _;

part 'helpers/event_bus.dart';
part 'helpers/time_utils.dart';

part 'app/models.dart';
part 'app/making_bid.dart';
part 'app/buying.dart';
part 'app/ending_auctions.dart';
part 'app/auctions_presenter.dart';

part 'fixtures.dart';

//have to define a global cause of a partial-implementation of web-components
EventBus eventBus = new EventBus();

main(){
  var auctionList = createAuctionList();
  var currentUser = createCurrentUser();


  bindModelToDom(){
    query("#temp").model = _.symbolize({
        "auctionList" : auctionList,
        "user" : currentUser
    });
  }

  setupAuctionsPresenter(){
    var presenter = new AuctionsPresenter()
                    ..user = currentUser
                    ..makingBid = new MakingBid()
                    ..buying = new Buying();

    eventBus.listen("makeBid", presenter.makeBid);
    eventBus.listen("buy", presenter.buy);
  }

  endingAuctions(){
    new EndingAuctions(auctionList)..startTimer();
  }


  bindModelToDom();
  setupAuctionsPresenter();
  endingAuctions();
}