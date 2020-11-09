import 'package:beplay/model/reviews/data.dart';
import 'package:beplay/repositories/class_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


part 'reviews_event.dart';
part 'reviews_state.dart';

ClassRepository repo = new ClassRepository();
class ReviewsBloc extends Bloc<ReviewsEvent,ReviewsState>{
  ReviewsBloc(ReviewsState initialState) : super(initialState);

  @override
  Stream<ReviewsState> mapEventToState(ReviewsEvent event) async*{
    if (event is GetReviews) {

      try {
        print('GETTING');
        var response = await repo.getReviews(event.id);
        var list = response.data;
        print('REVIEWS FOUND');

        print("INI RESPONSE $list");

        yield ReviewsSuccess(models: list);
      } catch (e) {

  }
  }
  }


}