// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:cached_network_image/cached_network_image.dart';

import '../models/events.dart';

class EventDetailsPage extends StatelessWidget {
  const EventDetailsPage({
    Key? key,
    required this.event,
  }) : super(key: key);
  final Events event;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          // appBar: SliverAppBar(),
          body: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    const SliverAppBar(
                      floating: true,
                    )
                  ],
              body: Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, bottom: 54, top: 8),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 8, bottom: 16),
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(240, 221, 245, 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            event.eventLabel,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(30, 29, 29, 0.8)),
                          ),
                        ),
                      ),
                      Text(
                        event.eventTitle,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 28,
                            color: Color.fromARGB(255, 30, 29, 29)),
                      ),
                      //start
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                                backgroundImage:
                                    NetworkImage(event.senderProfilePic)),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: event.senderRole,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: " @${event.senderName}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.watch_later_outlined,
                                      size: 16,
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Text(timeago.format(event.dateOfcreation)),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Hero(
                        tag: Key(event.eventId.toString()),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            child: CachedNetworkImage(
                              imageUrl: event.imageUrl,
                              placeholder: (context, url) {
                                return Image.asset(
                                  "assets/images/placeholder.png",
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          event.eventDesc,
                          textAlign: TextAlign.left,
                          style: const TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
              ))),
    );
  }
}
