part of auctions;

secondsAgo(s) =>
  new DateTime.now().subtract(new Duration(seconds: s));

secondsFromNow(s) =>
  new DateTime.now().add(new Duration(seconds: s));

createAuctionList(){
  var jim = new User("Jim");
  var john = new User("John");

  createAuction1(){
    var bids = toObservable([
        new Bid(11.0, jim, secondsAgo(200)),
        new Bid(15.0, john, secondsAgo(100))
    ]);

    return new Auction(
        "MacBook Air",
        bids,
        secondsFromNow(60),

        startingPrice: 10,
        buyItNowPricePrice: 100);
  }

  createAuction2(){
    var bids = toObservable([
        new Bid(5, jim, secondsAgo(200))
    ]);

    return new Auction(
        "MacBook Air",
        bids,
        secondsFromNow(10),

        startingPrice: 5);
  }

  return new AuctionList(toObservable([
      createAuction1(),
      createAuction2()
  ]));
}

createCurrentUser() => new User("Sammy");