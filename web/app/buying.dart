part of auctions;

class Buying {
  Future execute(User buyer, Auction auction){
    auction.winner = buyer;
    auction.active = false;

    //In the real app it will probably talk to the server
    return new Future.value();
  }
}