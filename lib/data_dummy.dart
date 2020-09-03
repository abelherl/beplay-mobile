import 'package:beplay/model/orders_model.dart';
import 'package:beplay/model/schendule.dart';

import 'model/dancemodel.dart';
import 'model/reviews.dart';

List<DanceModel> danceData = [
  DanceModel(
      rating: 4.0,
      title: 'Zumba Dance',
      author: 'Trainer Silvi',
      time: '19.00',
      date: '10/10/2020',
      description: '',
      place: 'Via JITSI',
      skill: 'Beginner',
      images:
          'https://www.verywellfit.com/thmb/WtaRzGOCbJdVYFlWr_7VOfwn_Ow=/3000x2002/filters:no_upscale():max_bytes(150000):strip_icc()/zumba-fatcamera-c9d4ee824a0f4fda883484f878abc8ae.jpg',
      reviewDances: [reviewsDance]),
  DanceModel(
      rating: 4.5,
      title: 'Aerobic Dance',
      author: 'Trainer Marina',
      time: '19.00',
      date: '10/10/2020',
      description: '',
      place: 'Via JITSI',
      skill: 'Intermediete',
      images:
          'http://aerobicdancevitalcampus.weebly.com/uploads/1/9/7/6/19762999/3260219_orig.jpg',
      reviewDances: [reviewsDance]),
  DanceModel(
      rating: 4.0,
      title: 'Malang Ballet Course',
      author: 'Trainer Karin',
      time: '15.00',
      date: '10/10/2020',
      description: '',
      place: 'Via JITSI',
      skill: 'Advanced',
      images:
          'https://images.pexels.com/photos/209948/pexels-photo-209948.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      reviewDances: [reviewsDance])
];
List<ReviewsDance> reviewsDance = [
  ReviewsDance(
      rating: 5.0,
      description: 'Trainer sangat bagus dalam penyampaian',
      name: 'Reynaldi',
      imageProfile:
          'https://cdn1-production-images-kly.akamaized.net/uz9LMvdLp-evgh1lUgBSIfwHwUo=/640x853/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/3077424/original/083391900_1584333352-Reynold_Poernomo_1.jpg'),
  ReviewsDance(
      rating: 4.5,
      description: 'Streching awal sangat bagus',
      name: 'Karin mommi',
      imageProfile:
          'https://cdn0-production-images-kly.akamaized.net/96I0QlCXv0U_XkUly3zLqGepN9E=/640x640/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/1598027/original/045809800_1495097716-DIN-2.JPG'),
  ReviewsDance(
      rating: 4.0,
      description:
          'Sebenarnya menyenangkan namun banyak yang kurang enak dalam penyampaian',
      name: 'Bariies Mulyani',
      imageProfile:
          'https://upload.wikimedia.org/wikipedia/commons/8/8f/Barbaros_%C5%9Eansal.png')
];

List<OrderModel> orders = [
  OrderModel(
      rating: 3.0,
      title: 'Meditation',
      author: 'Trainer Steven',
      time: '15.00',
      date: '10/10/2020',
      description: '',
      place: 'Via Zoom',
      skill: 'Advanced',
      images:
          'https://images.pexels.com/photos/209948/pexels-photo-209948.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      reviewDances: [reviewsDance]),
  OrderModel(
      rating: 3.0,
      title: 'Meditation',
      author: 'Trainer Steven',
      time: '15.00',
      date: '10/10/2020',
      description: '',
      place: 'Via Zoom',
      skill: 'Advanced',
      images:
          'https://images.pexels.com/photos/209948/pexels-photo-209948.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      reviewDances: [reviewsDance]),
  OrderModel(
      rating: 3.0,
      title: 'Meditation',
      author: 'Trainer Steven',
      time: '15.00',
      date: '10/10/2020',
      description: '',
      place: 'Via Zoom',
      skill: 'Advanced',
      images:
          'https://images.pexels.com/photos/209948/pexels-photo-209948.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      reviewDances: [reviewsDance]),
  OrderModel(
      rating: 3.0,
      title: 'Meditation',
      author: 'Trainer Steven',
      time: '15.00',
      date: '10/10/2020',
      description: '',
      place: 'Via Zoom',
      skill: 'Advanced',
      images:
          'https://images.pexels.com/photos/209948/pexels-photo-209948.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      reviewDances: [reviewsDance]),
];
List<Schedule> schedule = [];
List<DanceModel> myvideos = [];
