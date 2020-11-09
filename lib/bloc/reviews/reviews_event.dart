

part of 'reviews_bloc.dart';
abstract class ReviewsEvent extends Equatable {
  const ReviewsEvent();

  @override
  List<Object> get props => [];
}
class GetReviews extends ReviewsEvent {
GetReviews({this.id});
final int id;
}