/* -------------------------------- Packages -------------------------------- */
import 'package:flutter/material.dart';
/* -------------------------------------------------------------------------- */

/* --------------------------------- Models --------------------------------- */
import '../models/client_model.dart';
/* -------------------------------------------------------------------------- */

class Clients with ChangeNotifier {
  List<Client> _clients = [
    Client(
      '1',
      'Freddy - Enquiry',
      '125 Balshan Road, Harpswell',
      'United Kingdom',
    ),
    Client(
      '2',
      'Hampshire - My Builder',
      '125 Balshan Road, Harpswell',
      'United Kingdom',
    ),
    Client(
      '3',
      'Rated People',
      '125 Balshan Road, Harpswell',
      'United Kingdom',
    ),
    Client(
      '4',
      'Online Enquiry - Contact Made',
      '125 Balshan Road, Harpswell',
      'United Kingdom',
    ),
    Client(
      '5',
      'Appointment - Hampshire',
      '125 Balshan Road, Harpswell',
      'United Kingdom',
    ),
  ];

  List<Client> get clients {
    return [..._clients];
  }

  Client findById(String id) {
    return _clients.firstWhere((client) => client.id == id);
  }
}
