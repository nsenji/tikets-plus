



// getMovie(MovieNotifier movieNotifier) async {
//   QuerySnapshot snapshot =
//       await FirebaseFirestore.instance.collection('Movies').get();

//   List<Movie> movieList = [];

//   for (var document in snapshot.docs) {
//     Movie movie = Movie.fromMap(document);
//     movieList.add(movie);
//   }

//   movieNotifier.movieList = movieList;
// }



// getSeat(TakenSeat takenSeat) async {
//   QuerySnapshot snapshot =
//       await FirebaseFirestore.instance.collection('Seats').get();

//   List<SeatNumber> seatList = [];
//   dynamic value;

//   for (var element in snapshot.docs) {
//     {
//       SeatNumber seatNumber = SeatNumber.fromMap(element);
//       seatList.add(seatNumber);
//     }
//   }

//   takenSeat.seatList = seatList;
// }

// addSeat(int index) async {
//   final washingtonRef = FirebaseFirestore.instance
//       .collection("Seats")
//       .doc("82TvfV6vIksgjITayEy0");

// // Atomically add a new region to the "regions" array field.
//   washingtonRef.update({
//     "name": FieldValue.arrayUnion([index]),
//   });
// }

// removeSeat(int index) async {
//   final washingtonRef = FirebaseFirestore.instance
//       .collection("Seats")
//       .doc("82TvfV6vIksgjITayEy0");

//   washingtonRef.update({
//     "name": FieldValue.arrayRemove([index]),
//   });
// }


 




// final washingtonRef = FirebaseFirestore.instance.collection("cites").doc("DC");
//     washingtonRef.update({"capital": true}).then(
//     (value) => print("DocumentSnapshot successfully updated!"),
//     onError: (e) => print("Error updating document $e"));
