part of auctions;

runEvery(callback, {seconds}){
  callback();
  new Timer.periodic(
      new Duration(seconds: seconds),
      _.anyArgs(callback));
}

diffInSec(DateTime date){
  var diff = date.difference(new DateTime.now());
  return "${diff.inSeconds.toString()} seconds";
}