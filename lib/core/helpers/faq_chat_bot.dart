import 'package:sntegpito/core/cache/cache_helper.dart';
import 'package:sntegpito/core/utils/constant.dart';

final List<Map<String, String>> faq = [
  {
    "question": "How do I book?",
    "answer": "What do you want to book? A hotel, an activity, or both?"
  },
  {
    "question": "hotel",
    "answer":
        "You can choose the type of tourism you want, in addition to that, then you can search for the city and choose the hotel you want with the specifications that suit you, then book the room and pay."
  },
  {
    "question": "Activity?",
    "answer":
        "In our application you can see the available activities according to your preference for the area and cities and see the different activities available in each city and you can book them and plan for you"
  },
  {
    "question": "How do I book the activity?",
    "answer":
        "You choose the type of tourism, then choose the city you want, book the number of activities, specify the number of people, and you can specify your plane."
  },
  {
    "question": "How can I make a plan?",
    "answer":
        "First, you can make a plan for yourself through the icon on the main page that displays all the activities you have added, and you can plan your plan. If you have booked a hotel in the same city as the activities, then it will display the same days that you will spend in the city. Second, if not, you can specify the days, make the plan, and finally pay. "
  },
  {
    "question": "I can't understand at all",
    "answer": "Ask again and I will try to help you",
  },
  {
    "question": "thank you",
    "answer": "You're welcome, if you need anything else, I'm here."
  },
  {
    "question": "Hello chat",
    "answer":
        "Hello! How can I help you today ${CacheHelper().getData(key: Constants.usernamechat)}? 😊",
  },
  {
    "question": "hey",
    "answer":
        "Hey How can i help ${CacheHelper().getData(key: Constants.usernamechat)}😊?"
  },
  {
    "question": "welcom",
    "answer":
        " Welcome,  How can i help ${CacheHelper().getData(key: Constants.usernamechat)}😊?"
  },
  {
    "question": "How can change password?",
    "answer":
        "You can change password from profile and then edit profile you cav change password"
  },
  {
    "question": "How can modify password?",
    "answer":
        "You can change password from profile and then edit profile you cav change password"
  },
  {
    "question": "chat help me i forget my password",
    "answer":
        " Ok, Relax ...You can change password from profile and then edit profile you cav change password"
  },
  {
    "question": "How are you chat?",
    "answer":
        "Fine How can i help ${CacheHelper().getData(key: Constants.usernamechat)}😊?",
  },
  {
    "question": "what tell me about you chat ",
    "answer":
        "I'm chat bot to help you if you have a problem in app or any question about app",
  },
  {
    "question": "what are you chat ",
    "answer":
        "I'm chat bot to help you if you have a problem in app or any question about app",
  },
  {
    "question": "OK ",
    "answer": "OK, if you need anything else, I'm here.",
  }
];
