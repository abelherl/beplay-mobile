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
      reviewDances: [reviewsDance],
      onPressed: null),
  DanceModel(
      rating: 4.5,
      title: 'Aerobic Dance',
      author: 'Trainer Marina',
      time: '19.00',
      date: '10/10/2020',
      description: '',
      place: 'Via JITSI',
      skill: 'Intermediate',
      images:
          'http://aerobicdancevitalcampus.weebly.com/uploads/1/9/7/6/19762999/3260219_orig.jpg',
      reviewDances: [reviewsDance],
      onPressed: null),
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
      reviewDances: [reviewsDance],
      onPressed: null),
  DanceModel(
      rating: 3.2,
      title: 'Meditation',
      author: 'Trainer Steven',
      time: '15.00',
      date: '10/10/2020',
      description: '',
      place: 'Via Zoom',
      skill: 'Advanced',
      images:
          'https://images.pexels.com/photos/3094215/pexels-photo-3094215.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      reviewDances: [reviewsDance],
      onPressed: null),
  DanceModel(
      rating: 3.7,
      title: 'Yoga',
      author: 'Trainer Steven',
      time: '15.00',
      date: '10/10/2020',
      description: '',
      place: 'Via Zoom',
      skill: 'Advanced',
      images:
          'https://images.pexels.com/photos/2035066/pexels-photo-2035066.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      reviewDances: [reviewsDance],
      onPressed: null),
  DanceModel(
      rating: 3.8,
      title: 'Yoga',
      author: 'Trainer Steven',
      time: '15.00',
      date: '10/10/2020',
      description: '',
      place: 'Via Zoom',
      skill: 'Advanced',
      images:
          'https://images.pexels.com/photos/3735472/pexels-photo-3735472.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      reviewDances: [reviewsDance],
      onPressed: null),
  DanceModel(
      rating: 3.3,
      title: 'Dance',
      author: 'Trainer Billy',
      time: '11.00',
      date: '01/10/2020',
      description: '',
      place: 'Via Zoom',
      skill: 'Advanced',
      images:
          'https://images.pexels.com/photos/1638051/pexels-photo-1638051.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      reviewDances: [reviewsDance],
      onPressed: null),
  DanceModel(
      rating: 2.5,
      title: 'Outdoors',
      author: 'Trainer Steven',
      time: '07.00',
      date: '10/10/2020',
      description: '',
      place: 'Resort Dieng',
      skill: 'Advanced',
      images:
          'https://images.pexels.com/photos/532803/pexels-photo-532803.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      reviewDances: [reviewsDance],
      onPressed: null),
  DanceModel(
      rating: 3.5,
      title: 'Cardio',
      author: 'Trainer Steven',
      time: '15.00',
      date: '10/10/2020',
      description: '',
      place: 'Via Zoom',
      skill: 'Advanced',
      images:
          'https://images.pexels.com/photos/3768916/pexels-photo-3768916.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      reviewDances: [reviewsDance],
      onPressed: null),
  DanceModel(
      rating: 4.0,
      title: 'Cardio',
      author: 'Trainer Steven',
      time: '15.00',
      date: '10/10/2020',
      description: '',
      place: 'Via Zoom',
      skill: 'Advanced',
      images:
          'https://images.pexels.com/photos/3771809/pexels-photo-3771809.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      reviewDances: [reviewsDance],
      onPressed: null),
  DanceModel(
      rating: 4.0,
      title: 'Boxing',
      author: 'Trainer Steven',
      time: '15.00',
      date: '10/10/2020',
      description: '',
      place: 'Via Zoom',
      skill: 'Advanced',
      images:
          'https://images.pexels.com/photos/1608099/pexels-photo-1608099.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      reviewDances: [reviewsDance],
      onPressed: null),
  DanceModel(
      rating: 4.1,
      title: 'Strength',
      author: 'Trainer Steven',
      time: '15.00',
      date: '10/10/2020',
      description: '',
      place: 'Via Zoom',
      skill: 'Advanced',
      images:
          'https://images.pexels.com/photos/38630/bodybuilder-weight-training-stress-38630.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      reviewDances: [reviewsDance],
      onPressed: null),
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
      name: 'Karin Mommi',
      imageProfile:
          'https://cdn0-production-images-kly.akamaized.net/96I0QlCXv0U_XkUly3zLqGepN9E=/640x640/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/1598027/original/045809800_1495097716-DIN-2.JPG'),
  ReviewsDance(
      rating: 4.0,
      description:
          'Sebenarnya menyenangkan namun banyak yang kurang enak dalam penyampaian',
      name: 'Baries Mulyani',
      imageProfile:
          'https://upload.wikimedia.org/wikipedia/commons/8/8f/Barbaros_%C5%9Eansal.png')
];

List<DanceModel> order = [
  DanceModel(
      rating: 4.0,
      title: 'Boxing',
      author: 'Trainer Steven',
      time: '15.00',
      date: '10/10/2020',
      description: '',
      place: 'Via Zoom',
      skill: 'Advanced',
      images:
          'https://images.pexels.com/photos/1608099/pexels-photo-1608099.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      reviewDances: [reviewsDance],
      onPressed: null),
  DanceModel(
      rating: 4.1,
      title: 'Strength',
      author: 'Trainer Steven',
      time: '15.00',
      date: '10/10/2020',
      description: '',
      place: 'Via Zoom',
      skill: 'Advanced',
      images:
          'https://images.pexels.com/photos/38630/bodybuilder-weight-training-stress-38630.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      reviewDances: [reviewsDance],
      onPressed: null),
];

List<DanceModel> historyOrders = [
  DanceModel(
      rating: 3.5,
      title: 'Cardio',
      author: 'Trainer Steven',
      time: '15.00',
      date: '10/10/2020',
      description: '',
      place: 'Via Zoom',
      skill: 'Advanced',
      images:
          'https://images.pexels.com/photos/3768916/pexels-photo-3768916.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      reviewDances: [reviewsDance],
      onPressed: null),
];

List<DanceModel> agenda = [
  DanceModel(
      rating: 3.5,
      title: 'Cardio',
      author: 'Trainer Steven',
      time: '15.00',
      date: '10/10/2020',
      description: '',
      place: 'Via Zoom',
      skill: 'Advanced',
      images:
          'https://images.pexels.com/photos/3768916/pexels-photo-3768916.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      reviewDances: [reviewsDance],
      onPressed: null),
];

List<Schedule> schedule = [];
List<DanceModel> myvideos = [];
