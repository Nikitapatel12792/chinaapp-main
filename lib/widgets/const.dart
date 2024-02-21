

import 'package:chet/Modal/ChatListModal.dart';
import 'package:chet/Modal/ChatMessagesUserModal.dart';
import 'package:chet/Modal/CityIdeaModal.dart';
import 'package:chet/Modal/ComentdisplayModal.dart';
import 'package:chet/Modal/CommentsModal.dart';
import 'package:chet/Modal/CreteEventSteptwoModal.dart';
import 'package:chet/Modal/DetalisDataModal.dart';
import 'package:chet/Modal/EventCancelModal.dart';
import 'package:chet/Modal/EventDeleteModal.dart';
import 'package:chet/Modal/EventOneModal.dart';
import 'package:chet/Modal/EventSignupModal.dart';
import 'package:chet/Modal/EventSteptreeModal%20(1).dart';
import 'package:chet/Modal/Experincemodal.dart';
import 'package:chet/Modal/FollowedmeModal.dart';
import 'package:chet/Modal/FollowuserModal.dart';
import 'package:chet/Modal/IdeaListModal.dart';
import 'package:chet/Modal/IfollowModal.dart';
import 'package:chet/Modal/MapExplorationModal.dart';
import 'package:chet/Modal/MessageNotificationModal.dart';
import 'package:chet/Modal/NotificationFollowModal.dart';
import 'package:chet/Modal/ProfileEditModal.dart';
import 'package:chet/Modal/Ratingmodal.dart';
import 'package:chet/Modal/RecommendedFriendModal.dart';
import 'package:chet/Modal/SearchModal.dart';
import 'package:chet/Modal/SecondideaModel.dart';
import 'package:chet/Modal/SelfIdeaModal.dart';
import 'package:chet/Modal/SendMessageModal.dart';
import 'package:chet/Modal/SerchfirstIdModal.dart';
import 'package:chet/Modal/StatusModal.dart';
import 'package:chet/Modal/UnfollowuserModal.dart';
import 'package:chet/Modal/addsubcommentmodal.dart';
import 'package:chet/Modal/catagarymodal%20(1).dart';
import 'package:chet/Modal/catagarymodal.dart';
import 'package:chet/Modal/claimmodal.dart';
import 'package:chet/Modal/collectionModal.dart';
import 'package:chet/Modal/commentlike.dart';
import 'package:chet/Modal/signupmodal%20(1).dart';
import 'package:chet/Modal/usermodal.dart';
import 'package:connectivity/connectivity.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Modal/DispApiModal.dart';
import '../Modal/FilterideaModal.dart';


Future<bool> checkInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}
class GoogleSignInApi{
  static final _googleSignin = GoogleSignIn();

  static Future<GoogleSignInAccount?> login()=>_googleSignin.signIn();
}
UserModal? userdata;
SignupModal?  signupdata;
SecondIdea? secondideamodal;
SearchModal? searchmodal;
IdeaListModal? idealistmodal;
ExperinceModal? experincemodal;
CollectionModal? collectionmodal;
DetalisDataModal? detaildatamodal;
SerchfirstIdModal? serchfirstidmodal;
CatgaryModal? catagrymodal;
CommentsModal? commentsmodal;
CommentdisplayModal? commentdisplaymodal;
EventSteptreeModal? eventsteptreemodal;
CreteEventSteptwoModal? creteeventsteptwomodal;

EventOne? eventonemodal;
AddcommentlikeModal? addcommentlike;
AddsubcommentModal? addsubcomment;
Ifollowmodal? ifollowmodal;
FollowedmeModal? followmemodal;
UnfollowuserModal? unfollowusermodal;
FollowuserModal? followusermodal;
MapExplorationModal? mapexplorationmodal;
ChatListModal? chatlistmodal;
SendMessageModal? sendmessagemodal;
ChatMessagesUserModal? chatmessagesusermodal;
EventSignupModal? eventsignupmodal;
RecommendedFriendModal? recommendedfriendmodal;
EventCancelModal? eventcancelmodal;
StatusModal? statusmodal;
MessageNotificationModal? messagenotificationmodal;
CityIdeaModal? cityideamodal;
ProfileEditModal? profileeditmodal;
Ratingmodal? ratingmodal;
SelfIdeaModal? selfideamodal;
ClaimModal? claimmodal1;
DispApiModal? display;
FilterIdeaModal? filter;
NotificationFollowModal? notificationfollowmodal;
EventDeleteModal? eventdeletemodal;


const String baseUrl = 'https://suppchat.fableadtechnolabs.com/api';

Future<bool> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    serviceEnabled = false;
    return false;
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      serviceEnabled = false;
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    serviceEnabled = false;
    return false;
  }
  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return serviceEnabled;
}
