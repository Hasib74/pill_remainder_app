import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:gsheets/gsheets.dart';

class GoogleSheetInputScreen extends StatefulWidget {
  const GoogleSheetInputScreen({super.key});

  @override
  State<GoogleSheetInputScreen> createState() => _GoogleSheetInputScreenState();
}

class _GoogleSheetInputScreenState extends State<GoogleSheetInputScreen> {
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();

  final TextEditingController _phoneTextEditingController =
      TextEditingController();

  final TextEditingController _inTimeTextEditingController =
      TextEditingController();

  final TextEditingController _outTimeTextEditingController =
      TextEditingController();

  Spreadsheet? sheet;

  Worksheet? worksheet;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _int();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _nameTextEditingController,
                decoration: const InputDecoration(
                  hintText: "Name",
                ),
              ),
              TextField(
                controller: _emailTextEditingController,
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
              ),
              TextField(
                controller: _phoneTextEditingController,
                decoration: const InputDecoration(
                  hintText: "Phone",
                ),
              ),
              TextField(
                controller: _inTimeTextEditingController,
                decoration: const InputDecoration(
                  hintText: "In Time",
                ),
              ),
              TextField(
                controller: _outTimeTextEditingController,
                decoration: const InputDecoration(
                  hintText: "Out Time",
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    _subMitData();
                  },
                  child: const Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }

  // AIzaSyCXRWFvFxfM-VgUB4sLah7IaAZWZsbcMec

  setUpGoogleSheet() async {
    String _spreadsheetId = "1QQpYVgWZmIjGW79OGJwNNfhrftz_SzYQIu4fuYm-zIw";

    const _credentials = r'''
{
  "type": "service_account",
  "project_id": "sharp-imprint-412111",
  "private_key_id": "43d8d380a5657bdeec307e1cafbb58f71ec4a1d5",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCZF8/3SnHL6rL7\nSMb75sXS+ztWDx/22yL5VY2GCDm/DAN1QABn4YaeFEiAICfcyno6DO7WW5JYdatt\nuj9j6QbME79/LgEhtcuV9YaKkrCelUQ6b5fTB2EC4Ly0Aj/NDClMDt5SYeLuWqrv\nm3PlpVvhEnx+8bdJjtd0cKT7bx1i70jC4jh3BxP+i9huNNMjFQIhfQVJMzLkHDec\ntQNSMk40j2Mk0YozCATnrnd4Fi+N4BUiup4rOARLgbCuBf6SruL2z4akmfPTNtXU\nSQ5pAugx72rZxvENOnCKwqFC8/OknKfeaIEerZEazdVqxhJxPMJTaVB3gcp2T5yT\neD68b4ifAgMBAAECggEAAR0zL6gZ63ssfrkS0hxvIsKuBv6Z471FTjzTOmxn2gB8\nV5DuF6F7NQxJQDFwyNI1T4Sp6qsBgras45oTjPe2CfbBgjMwWGg/YKsfWtNoxFS2\nvqweRLwZURRGvZv436RNV+aII9yT70rpWSrbUrlirztbcFpFZAAxXKCYr9R0D7gH\nu35xGDCx/9pKtl/oguoOHcYCdyNFZsV34ZsiAQh6kCIcEhITCvOYfw08bNxQNSvG\nj2jCURhboxIpi31FbdTvwO2h4eNz8wCcZjsuhF81OoiJhMqOLj3vjg1O3tutIKaW\n9kGLELwFcKlGl2665NwuvoBi+OmBjXINqsNxMKwF8QKBgQDOQtUQImdRC7gWnwwI\nHunViyD9FDMshjk+UhMZdQOwbc7vYHiB5NhCHRCtxsvNNJur1HBaHze7qTektcM8\nKTL95WtcR9YMh7ClrAnE1O+Uo2LKeNFRATK2wPi8/9niYu+SqrGHE/8kn8lAvwyJ\n0xSMDty5EiQfXw1ANm75LXG1TwKBgQC+Ar5IDDtYvN/njM1Ctaa3WKWZrm9d5gtX\nKaHhcr6XysAbbaAOX3P13tZJcpMpBqhF5Y6ksZ93TowlfYcWB5EhZdNhoHZTwX/K\n/Hm49Vx/YMy2Ic1B02wQEq51hgEkDuslLcmoN2kUEzsURIdnn2fS5Y2qeYbKX+q7\njQ8cD2rDsQKBgC88rRD54BF2jp1XpWjCs6i9KTvsgV/ECZ4VK9ybqNGiBE9cF50f\n7MsPXv99VLVVRAWRLH3nQltPALhPDDxd7xiojvLeXM4X0UPP55jVb1zqIjjefImB\nrbye6xhVu++V2uoK/4dA9CDOG0ghuNxjpAQDb1dPKUip+x3mmXmlh7IPAoGAeED6\nNlTvdmDLABufiJm4co8690FroCzIfpiNqEZbk2uxG2rNAmus0y39xqwpsKxS8TGw\njlEQEIz4q31/chTF6DIujrnkSWvMOiaBzuoSaVdVF+vaoM9ys9Vu7lgp/q0mavhI\niRrQePEW0ePxIkbDibjYaMzS3t/Hin1i06p6MnECgYBH8hkM9I9ltNak6xjGsBQg\n6KSpCxySzvLHq1lMIQDrmSqdYS3BrHrjdlaKzKef6GtKALDE6eLz28P2gh2EQx9B\nz/cLBfu5KQdy33/DWXW/5RF5FiolcH+5ptiy4pw+WkUke0cOAUaOnnebila9ESt+\n06z1oAZQZjmmOH2jfpnEag==\n-----END PRIVATE KEY-----\n",
  "client_email": "googlesheet@sharp-imprint-412111.iam.gserviceaccount.com",
  "client_id": "107975995917727009174",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/googlesheet%40sharp-imprint-412111.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}

''';

    final gsheets = GSheets(_credentials);

    sheet = await gsheets.spreadsheet(_spreadsheetId);

    worksheet = await getWorkSheet(sheet, "Attendance");

    // print("Sheet ${sheet?.dat}");
  }

  void _subMitData() async {
    print("Title ${worksheet}");

    Future.delayed(Duration(seconds: 2)).then((value) {});

    print("worksheet ${worksheet?.title}");

    final _name = _nameTextEditingController.value.text;
    final _email = _emailTextEditingController.value.text;
    final _phone = _phoneTextEditingController.value.text;
    final _inTime = _inTimeTextEditingController.value.text;
    final _outTime = _outTimeTextEditingController.value.text;

    List<String> rowData = [
      DateTime.now().toString(),
      _name,
      _email,
      _phone,
      _inTime,
      _outTime,
    ];
    var _row = await worksheet?.rowCount;

    print("Row ${_row}");

    await worksheet?.values
        .appendRow(rowData)
        .then((value) => print(value))
        .onError((error, stackTrace) => print(error));

    //var values = await worksheet?.values.value(column: 1, row: 1);

    print("Data Inserted  $worksheet");

    // _nameTextEditingController.clear();
    // _emailTextEditingController.clear();
    // _phoneTextEditingController.clear();
    // _inTimeTextEditingController.clear();
    // _outTimeTextEditingController.clear();
  }

  void _int() async {
    await setUpGoogleSheet();

    _nameTextEditingController.text = "Hasib Akon";
    _emailTextEditingController.text = "hasibakon74@gmail.com";
    _phoneTextEditingController.text = "01700000000";
    _inTimeTextEditingController.text = "10:00 AM";
    _outTimeTextEditingController.text = "10:00 PM";
  }

  Future<Worksheet?> getWorkSheet(Spreadsheet? sheet, String name) async {
    try {
      return await sheet?.addWorksheet(name);
    } catch (e) {
      print("Error $e");

      return sheet?.worksheetByTitle(name);
    }
  }
}
