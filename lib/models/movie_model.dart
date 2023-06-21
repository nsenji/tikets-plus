

class Movie {
   String name= '';
   String id='';
   String description='';
   String image='';

    Movie.fromMap( things) {
    description = things['description'];
    id = things['id'];
    image = things['image'];
    name = things['name'];
    
    
  }
}
