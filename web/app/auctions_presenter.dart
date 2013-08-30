part of auctions;

class AuctionsPresenter {
  MakingBid makingBid;
  Buying buying;
  User user;

  makeBid(event){
    var view = event["view"];

    makingBid.
      execute(user, event["auction"], event["bid"]).
      then(_.anyArgs(view.reset)).
      catchError(view.setErrors);
  }

  buy(event) =>
    buying.execute(user, event["auction"]);
}
