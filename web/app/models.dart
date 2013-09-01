part of auctions;

class User {
  String name;

  User(this.name);
}

class Bid {
  num amount;
  User bidder;
  DateTime createdAt;

  Bid(this.amount, this.bidder, this.createdAt);
}

class Auction extends Object with ObservableMixin {
  String itemDescription;
  String image;
  num startingPrice = 0;
  num buyItNowPricePrice;
  DateTime endingDate;

  @observable User winner;
  @observable bool active = true;

  List<Bid> bids;

  Auction(this.itemDescription, this.image, this.bids, this.endingDate, {this.startingPrice, this.buyItNowPricePrice});

  addBid(Bid bid) => bids.add(bid);
  get lastBid => bids.last;
  get hasBids => !bids.isEmpty;
}

class AuctionList {
  List<Auction> auctions;

  AuctionList(this.auctions);

  activeAuctionsEndingBefore(DateTime date) =>
    auctions.where((_) => _.endingDate.isBefore(date) && _.active);
}