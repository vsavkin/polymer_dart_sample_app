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
        "Old Vase",
        "http://www.extravaganzi.com/wp-content/uploads/2010/11/Familys-Old-Chinese-Vase-Fetches-83-Million-1.jpg",
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
        "Old Chair",
        "http://betterdecoratingbible.com/wp-content/uploads/2013/03/Upholstery-Makeover-Chair-Suzy-q-better-decorating-bible-blog-how-to-reupholster-a-chair-Louis-xvi-piping-damask-velvet-fabric-strip-re-do-flea-market-re-make-bring-back-to-life-tufted.jpg",
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