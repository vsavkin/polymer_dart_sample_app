part of auctions;

class MakingBid {
  Future<Bid> execute(User bidder, Auction auction, num amount){
    if(_lessThanStartingPrice(auction, amount))
      return _error("must be greater or equal to than the starting price");

    if(_lessThanLastBid(auction, amount))
      return _error("must be greater than the last bid");

    var bid = new Bid(amount, bidder, new DateTime.now());

    return _makeBid(amount, bidder).then(auction.addBid);
  }

  _lessThanStartingPrice(auction, amount) => amount < auction.startingPrice;

  _lessThanLastBid(auction, amount) => auction.hasBids && amount <= auction.lastBid.amount;

  //In the real app it will probably talk to the server
  _makeBid(amount, bidder) =>
    new Future.value(new Bid(amount, bidder, new DateTime.now()));

  _error(msg) => new Future.error({"bid" : msg});
}