part of auctions;

class EndingAuctions {
  AuctionList auctionList;
  EndingAuctions(this.auctionList);

  startTimer() =>
    new Timer.periodic(
          const Duration(seconds: 1),
          _.anyArgs(_checkAuctions));

  _checkAuctions(){
    auctionList.activeAuctionsEndingBefore(_now).forEach(_checkAuction);
  }

  _checkAuction(Auction auction){
    auction.active = false;
    if(! auction.bids.isEmpty){
      auction.winner = auction.lastBid.bidder;
    }
  }

  get _now => new DateTime.now();
}
