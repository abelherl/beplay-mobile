

part of 'reviews_bloc.dart';
abstract class ReviewsState extends Equatable {
  const ReviewsState();

  @override
  List<Object> get props => [];

  int get id => null;
}
class ReviewsSuccess extends ReviewsState {
  final List<Data> models;
  ReviewsSuccess({this.models});
}