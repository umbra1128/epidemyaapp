import 'package:epidemyacaps/devdrawer.dart';
import 'package:flutter/services.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import './crud.dart';
import './home.dart';

CrudMethods crudObj = new CrudMethods();

TextEditingController _patientNumController = new TextEditingController();
TextEditingController _firstNameController = new TextEditingController();
TextEditingController _lastNameController = new TextEditingController();
int _ageController = 0;
int _sexController = -1;
TextEditingController _diseaseController = new TextEditingController();
TextEditingController _middleNameController = new TextEditingController();
String sex;
//final items = List<String>.generate(897, (i) => "$i");
List _district = ['1', '2', '3', '4', '5', '6',];
List _disease = ['Acute Flaccid Paralysis', 'Adverse Event Following Immunization (AEFI)', 'Anthrax', 'Human Aviain Influenzas', 'Measles', 'Meningococcal Disease', 'Neonatal Tetanus', 'Paralytic Shellfish Poisoning', 'Rabies', 'Sever Acute Respiratory Syndrome (SARS)', 'Acute Bloody Diarrhea', 'Acute Encephalitis Syndrome', 'Acute Hemorrhagic Fever Syndrome', 'Acute Viral Hepatitis', 'Bacterial Meningitis', 'Cholera', 'Dengue', 'Diphtheria', 'Hand, Foot and Mouth Disease (HFMD)', 'Influenza-like illness', 'Leptospirosis', 'Malaria', 'Non-neonatal Tetanus', 'Pertussis', 'Typhoid and Paratyphoid Fever'];
List _zone = [''];
List _barangay = [''];

List<DropdownMenuItem<String>> _dropDownBarangayItems;
List<DropdownMenuItem<String>> _dropDownDistrictItems;
List<DropdownMenuItem<String>> _dropDownZoneItems;
List<DropdownMenuItem<String>> _dropDownDiseaseItems;
String _currentBarangay;
String _currentDistrict;
String _currentZone;
String _currentDisease;

class Report extends StatefulWidget {
  final Widget child;
  Report({Key key, this.child}) : super(key: key);

  _Report createState() => _Report();
}

class _Report extends State<Report> {
  int _currentAgeValue = 0;
  NumberPicker integerNumberPicker;
  DateTime dateNow = DateTime.now();
  DateTime _dobController = new DateTime(1900, 1, 1);
  DateTime _dorController = new DateTime(2019, 1, 1);
  final dateFormat = DateFormat("yyyy-MM-dd");
  final timeFormat = DateFormat("yyyy-MM-dd hh:mm aaa");

  void _handleSubmit() {
    if (_patientNumController.text == '') {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Report Incomplete'),
              content: new Text('Please complete all required datails.'),
              actions: <Widget>[
                new FlatButton(
                  child: new Text('Try again'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text(''),
              content: new Text('Report will be Submitted'),
              actions: <Widget>[
                new FlatButton(
                  child: new Text('OK'),
                  onPressed: () {
                    setState(() => _dorController = DateTime.now());
                    if (_sexController == 1) {
                      sex = 'male';
                    } else if (_sexController == 2) {
                      sex = 'female';
                    }
                    Map<String, String> reportData = {
                      'uid': '10001',
                      'patientnum': _patientNumController.text,
                      'fname': _firstNameController.text,
                      'mname': _middleNameController.text,
                      'lname': _lastNameController.text,
                      'age': _ageController.toString(),
                      'gender': sex,
                      'dob': dateFormat.format(_dobController),
                      'disease': _currentDisease.toString(),
                      'district': _currentDistrict.toString(),
                      'zone': _currentZone.toString(),
                      'barangay': _currentBarangay.toString(),
                      'dor': timeFormat.format(_dorController)
                    };
                    crudObj.addData(reportData);
                    resetState();
                    Navigator.of(context).pop();
                  },
                ),
                new FlatButton(
                  child: new Text('Cancel'),
                  onPressed: () {Navigator.of(context).pop();resetState();},
                )
              ],
            );
          });
    }
  }

  _handleGenderChanged(int value) {
    if (value != null) {
      //`setState` will notify the framework that the internal state of this object has changed.
    }
    if (value is int) {
      setState(() => _sexController = value);
    }
  }

  _handleDateChange(DateTime value) {
    if (value != null) {
      //`setState` will notify the framework that the internal state of this object has changed.
    }
    if (value is DateTime) {
      setState(() => _dobController = value);
      

      setState(() => _ageController = dateNow.difference(_dobController).inDays ~/ 365);
    }
  }

  void resetState() {
    _patientNumController.clear();
    _firstNameController.clear();
    _middleNameController.clear();
    _lastNameController.clear();
    _diseaseController.clear();
    setState(() {
      _sexController = 0;
      _currentDistrict = _dropDownDistrictItems[0].value;
      _currentZone = _dropDownZoneItems[0].value;
      _currentBarangay = _dropDownBarangayItems[0].value;
    });
  }

  @override
  void initState() {
    _dropDownDistrictItems = getDropDownDistrictItems();
    _currentDistrict = _dropDownDistrictItems[0].value;
    _dropDownZoneItems = getDropDownZoneItems();
    _currentZone = _dropDownZoneItems[0].value;
    _dropDownBarangayItems = getDropDownBarangayItems();
    _currentBarangay = _dropDownBarangayItems[0].value;
    _dropDownDiseaseItems = getDropDownDiseaseItems();

    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownDiseaseItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String disease in _disease) {
      items.add(
          new DropdownMenuItem(value: disease, child: new Text(disease)));
    }
    return items;
  }

  // here we are creating the list needed for the DropDownButton
  List<DropdownMenuItem<String>> getDropDownDistrictItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String district in _district) {
      // here we are creating the drop down menu items, you can customize the item right here
      // but I'll just use a simple text for this
      items.add(
          new DropdownMenuItem(value: district, child: new Text(district)));
    }
    return items;
  }

  // here we are creating the list needed for the DropDownButton
  List<DropdownMenuItem<String>> getDropDownZoneItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String zone in _zone) {
      // here we are creating the drop down menu items, you can customize the item right here
      // but I'll just use a simple text for this
      items.add(new DropdownMenuItem(value: zone, child: new Text(zone)));
    }
    return items;
  }

  // here we are creating the list needed for the DropDownButton
  List<DropdownMenuItem<String>> getDropDownBarangayItems() {
    List<DropdownMenuItem<String>> items = new List();
for (String barangay in _barangay) {
      // here we are creating the drop down menu items, you can customize the item right here
      // but I'll just use a simple text for this
      items.add(
          new DropdownMenuItem(value: barangay, child: new Text(barangay)));
    }
    return items;
  }

    void changedDiseaseItem(String selectedDisease) {
    print(
        "Selected disease $selectedDisease, we are going to refresh the UI");
    setState(() {
      _currentDisease = selectedDisease;
    });
  }

  void changedDistrictItem(String selectedDistrict) {
    print(
        "Selected district $selectedDistrict, we are going to refresh the UI");
    setState(() {
      _currentDistrict = selectedDistrict;
    });

    if (_currentDistrict == '1') {
      _zone = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'];
    } else if (_currentDistrict == '2') {
      _zone = ['13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'];
    } else if (_currentDistrict == '3') {
      _zone = ['25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40'];
    } else if (_currentDistrict == '4') {
      _zone = ['41', '42', '43', '44', '45', '46', '47', '48', '49', '50', '51', '52', '53', '54', '55', '56', '57'];
    } else if (_currentDistrict == '5') {
      _zone = ['68', '69', '70', '71', '72', '73', '74', '75', '76', '77', '78', '79', '80', '81', '82', '83', '84', '85', '86', '87', '88', '89'];
    } else if (_currentDistrict == '6') {
      _zone = ['58', '59', '60', '61', '62', '63', '64', '65', '66', '67', '89', '90', '91', '92', '93', '94', '95', '96', '97', '98', '99', '100'];
    }
    _dropDownZoneItems = getDropDownZoneItems();
    _currentZone = _dropDownZoneItems[0].value;
  }

  void changedZoneItem(String selectedZone) {
    print("Selected zone $selectedZone, we are going to refresh the UI");
    setState(() {
      _currentZone = selectedZone;
    });

    if (_currentZone == "1") {
      _barangay = ['1','2','3','4','5','6','7','8','9'];
    } else if (_currentZone == "2") {
      _barangay = ['10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32'];
    } else if (_currentZone == "3") {
      _barangay = ['33','34','35','36','37','38','39','40','41','42','43','44','45','46','47'];
    } else if (_currentZone == "4") {
      _barangay = ['48','49','50','51','52','53','54','55'];
    } else if (_currentZone == "5") {
      _barangay = ['56','57','58','59','60','61'];
    } else if (_currentZone == "6") {
      _barangay = ['62','63','64','65','66','67','68','69','70','71','72','73','74','75'];
    } else if (_currentZone == "7") {
      _barangay = ['76','77','78','79','80','81','82','83','84','85','86','87','88','89','90'];
    } else if (_currentZone == "8") {
      _barangay = ['91', '92', '93', '94','95','96','97','98','99','100','101','102','103','104','105','106'];
    } else if (_currentZone == "9") {
      _barangay = ['107','108','109','110','111','112','113','114','115','116','117','118','119','120','121','122','123'];
    } else if (_currentZone == "10") {
      _barangay = ['124','125','126','127','128'];
    } else if (_currentZone == "11") {
      _barangay = ['129','130','131','132','134'];
    } else if (_currentZone == "12"){
      _barangay = ['135','136','137','138','139','140','141','142','143','144','145','146'];
    } else if (_currentZone == "13"){
      _barangay = ['147','148','149','150','151','152'];
    } else if (_currentZone == "14"){
      _barangay = ['153','154','155','156','157','158','159','160','161','162','163','164','165'];
    } else if (_currentZone == "15"){
      _barangay = ['166','167','168','169','170','171','172','173','174','175','176'];
    } else if (_currentZone == "16"){
      _barangay = ['177','178','179','180','181','182','183','184','185','186'];
    } else if (_currentZone == "17"){
      _barangay = ['187','188','189','190','191','192','193','194','195','196'];
    } else if (_currentZone == "18"){
      _barangay = ['197','198','199','200','201','202','202','202-A','203','204','205'];
    } else if (_currentZone == "19"){
      _barangay = ['206','207','208','209','210','211','212'];
    } else if (_currentZone == "20"){
      _barangay = ['213','214','215','216','217','218','219','220'];
    } else if (_currentZone == "21"){
      _barangay = ['221','222','223','224','225','226','227','228','229','230','231','232','233'];
    } else if (_currentZone == "22"){
      _barangay = ['234','235','236','237','238','239','240','241','242','243','244','245','246'];
    } else if (_currentZone == "23"){
      _barangay = ['247','248','249','250','251','252','253','254','255','256','257','258','259'];
    } else if (_currentZone == "24"){
      _barangay = ['260','261','262','263','264','265','266','267'];
    } else if (_currentZone == "25"){
      _barangay = ['268','269','270','271','272','273','274','275','276'];
    } else if (_currentZone == "26"){
      _barangay = ['281','282','283','284','285','286'];
    } else if (_currentZone == "29"){
      _barangay = ['297','298','299','300','301','302','303','304','305'];
    } else if (_currentZone == "30"){
      _barangay = ['306','307','308','309'];
    } else if (_currentZone == "31"){
      _barangay = ['310','311','312','313','314'];
    } else if (_currentZone == "32"){
      _barangay = ['315','316','317','318','319','320','322','323','324','325'];
    } else if (_currentZone == "33"){
      _barangay = ['326','327','328','329','330','331','332','333','334','335'];
    } else if (_currentZone == "34"){
      _barangay = ['336','337','338','339','340','341','342','343','344'];
    } else if (_currentZone == "35"){
      _barangay = ['345','346','347','348','349','350','351','352'];
    } else if (_currentZone == "36"){
      _barangay = ['353','354','355','356','357','358','359','360','361','362'];
    } else if (_currentZone == "37"){
      _barangay = ['363','364','365','366','367','368','369','370','371','372'];
    } else if (_currentZone == "38"){
      _barangay = ['373','374','375','376','377','378','379','380','381','382'];
    } else if (_currentZone == "39"){
      _barangay = ['383','384','385','386','387','388'];
    } else if (_currentZone == "40"){
      _barangay = ['389','390','391','392','393','394'];
    } else if (_currentZone == "41"){
      _barangay = ['395','396','397','398','399','340','400','401','402','403','404'];
    } else if (_currentZone == "42"){
      _barangay = ['405','406','407','408','409','410','411','412','413','414','415','416'];
    } else if (_currentZone == "43"){
      _barangay = ['417','418','419','420','421','422','423','424','425','426','427','428'];
    } else if (_currentZone == "44"){
      _barangay = ['429','430','431','432','433','434','435','436','437','438','439','440','441','442','443','444','445','446','447','448','449'];
    } else if (_currentZone == "45"){
      _barangay = ['450','451','452','453','454','456','457','458','459','460','461','462'];
    } else if (_currentZone == "46"){
      _barangay = ['463','464','465','466','467','468','469','470','471'];
    } else if (_currentZone == "47"){
      _barangay = ['472','473','474','475','476','477','478','479','480','481'];
    } else if (_currentZone == "48"){
      _barangay = ['482','483','484','485','486','487','488','489','490','491','492'];
    } else if (_currentZone == "49"){
      _barangay = ['493','494','495','496','497','498','499','500','501'];
    } else if (_currentZone == "50"){
      _barangay = ['502','503','504','505','506','507','508','509','510','511','512'];
    } else if (_currentZone == "51"){
      _barangay = ['513','514','515','516','517','518','519','520'];
    } else if (_currentZone == "52"){
      _barangay = ['521','522','523','524','525','526','527','528','529','530','531'];
    } else if (_currentZone == "53"){
      _barangay = ['532','533','534','536','537','538','539','540','541'];
    } else if (_currentZone == "54"){
      _barangay = ['542','543','544','546','547','548','549','550','551','552','553','554'];
    } else if (_currentZone == "55"){
      _barangay = ['555','556','557','558','559','560','561','562','563','564','565','566','567','568'];
    } else if (_currentZone == "56"){
      _barangay = ['569','570','571','572','573','574','575','576','577','578','579','580'];
    } else if (_currentZone == "57"){
      _barangay = ['581','582','583','584','585','586'];
    } else if (_currentZone == "58"){
      _barangay = ['587','587-A','588','589','590','591','592','593'];
    } else if (_currentZone == "59"){
      _barangay = ['594','595','596','597','598','599','600','601'];
    } else if (_currentZone == "60"){
      _barangay = ['602','603','604','605','606','610','611','612','613'];
    } else if (_currentZone == "61"){
      _barangay = ['607','608','609','614','615','616', '617','618'];
    } else if (_currentZone == "62"){
      _barangay = ['619','620','621','622','623','624','625'];
    } else if (_currentZone == "63"){
      _barangay = ['626','627','628','629','630'];
    } else if (_currentZone == "64"){
      _barangay = ['631','632','633','634','635','636'];
    } else if (_currentZone == "65"){
      _barangay = ['637','638','639','640'];
    } else if (_currentZone == "66"){
      _barangay = ['641','642','643','644'];
    } else if (_currentZone == "67"){
      _barangay = ['645','646','647','648'];
    } else if (_currentZone == "68"){
      _barangay = ['649','650','651','652','653'];
    } else if (_currentZone == "69"){
      _barangay = ['654','655','656'];
    } else if (_currentZone == "70"){
      _barangay = ['657','658'];
    } else if (_currentZone == "71"){
      _barangay = ['659','659-A','660','660-A','661','662','663','663-A','664','664-A'];
    } else if (_currentZone == "72"){
      _barangay = ['666','667','668','669','670'];
    } else if (_currentZone == "73"){
      _barangay = ['671','672','673','674','675','676'];
    } else if (_currentZone == "74"){
      _barangay = ['677','678','679','680','681','682','683','684','685'];
    } else if (_currentZone == "75"){
      _barangay = ['686','687','688','689','690','691','692','693','694','695'];
    } else if (_currentZone == "76"){
      _barangay = ['696','697','698','699'];
    } else if (_currentZone == "77"){
      _barangay = ['700','701','702','703','704','705','706'];
    } else if (_currentZone == "78"){
      _barangay = ['707','708','709','710','711','712','713','714','715','716','717','718','719','720','721'];
    } else if (_currentZone == "79"){
      _barangay = ['722','723','724','725','726','727','728','729','730'];
    } else if (_currentZone == "80"){
      _barangay = ['731','732','733','734','735','736','737','738','739','740','741','742','743','744'];
    } else if (_currentZone == "81"){
      _barangay = ['745','746','747','748','749','750','751','752','753','754'];
    } else if (_currentZone == "82"){
      _barangay = ['755','756','757','758','759','760','761','762'];
    } else if (_currentZone == "83"){
      _barangay = ['763','764','765','766','767','768','769'];
    } else if (_currentZone == "84"){
      _barangay = ['770','771','772','773','774','775'];
    } else if (_currentZone == "85"){
      _barangay = ['776','777','778','779','780','781','782','783'];
    } else if (_currentZone == "86"){
      _barangay = ['784','785','786','787','788','789','790','791','792','793'];
    } else if (_currentZone == "87"){
      _barangay = ['794','795','796','797','798','799','800','801','802','803','804','805','806','807'];
    } else if (_currentZone == "88"){
      _barangay = ['808','809','810','811','812','813','814','815','816','817','818','818-A','819','820'];
    } else if (_currentZone == "89"){
      _barangay = ['821','822','823','824','825','826','827','828','829','830','831','832'];
    } else if (_currentZone == "90"){
      _barangay = ['830','831','832','833','834','835','836'];
    } else if (_currentZone == "91"){
      _barangay = ['837','838','839','840'];
    } else if (_currentZone == "92"){
      _barangay = ['841','842','843','844','845','846','847','848'];
    } else if (_currentZone == "93"){
      _barangay = ['849','850','851','852','853','854','855','856','857','858','859'];
    } else if (_currentZone == "94"){
      _barangay = ['860','861','862','863','864','865','869'];
    } else if (_currentZone == "95"){
      _barangay = ['866','867','868','870','871','872'];
    } else if (_currentZone == "96"){
      _barangay = ['873','874','875','876','877','878','879','880'];
    } else if (_currentZone == "97"){
      _barangay = ['881','882','883','884','885'];
    } else if (_currentZone == "98"){
      _barangay = ['886','887','888','889','890','891'];
    } else if (_currentZone == "99"){
      _barangay = ['892','893','894','895','896','897'];
    } else if (_currentZone == "100"){
      _barangay = ['898','899','900','901','902','903','904','905'];
    }
    _dropDownBarangayItems = getDropDownBarangayItems();
    _currentBarangay = _dropDownBarangayItems[0].value;
  }

  void changedBarangayItem(String selectedBarangay) {
    print(
        "Selected barangay $selectedBarangay, we are going to refresh the UI");
    setState(() {
      _currentBarangay = selectedBarangay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: true,
        appBar: new AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text('Submit Report'),
          actions: <Widget>[
            new IconButton(
                icon: Icon(
                  Icons.map,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                })
          ],
        ),
        drawer: DevDrawer(),
        body: Container(
          padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
          child: ListView(children: <Widget>[
            TextField(
              controller: _patientNumController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Patient No.',
                  labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlue))),
            ),
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(
                  labelText: 'Firstname',
                  labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  hintText: 'Juan',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlue))),
            ),
            TextField(
              controller: _middleNameController,
              decoration: InputDecoration(
                  labelText: 'Middle name',
                  labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  hintText: 'Santos',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlue))),
            ),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(
                  labelText: 'Lastname',
                  labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  hintText: 'Dela Cruz',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlue))),
            ),
            ListTile(
              title: Text(
                'Gender',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: <Widget>[
                RadioListTile<int>(
                    title: Text('Male'),
                    value: 1,
                    groupValue: _sexController,
                    onChanged: _handleGenderChanged),
                RadioListTile<int>(
                    title: Text('Female'),
                    value: 2,
                    groupValue: _sexController,
                    onChanged: _handleGenderChanged),
              ],
            ),
            // TODO: Date of Birth = Checked
            ListTile(
              title: Text(
                'Birthdate: ${dateFormat.format(_dobController)}\n' +
                    'Age: ' +
                    _ageController.toString(),
                //style: TextStyle(fontSize: 20.0),
              ),
            ),
            RaisedButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                  side: BorderSide(width: 2.0, color: Colors.grey)),
              onPressed: () {
                DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  minTime: DateTime(1900, 1, 1),
                  maxTime: dateNow,
                  onChanged: _handleDateChange,
                );
              },
              child: Text(
                'Pick date of birth',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            Text('Disease', style: TextStyle(fontWeight: FontWeight.bold),),

            new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DropdownButton(
                  value: _currentDisease,
                  items: _dropDownDiseaseItems,
                  onChanged: changedDiseaseItem,
                )
              ],
            ),
            /* TextField(
              controller: _diseaseController,
              decoration: InputDecoration(
                  labelText: 'Disease',
                  labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  hintText: 'Deague',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlue))),
            ), */
            SizedBox(
              height: 7.0,
            ),
            Text('Address:', style: TextStyle(fontWeight: FontWeight.bold),),
            new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Text("District:"),
                DropdownButton(
                  value: _currentDistrict,
                  items: _dropDownDistrictItems,
                  onChanged: changedDistrictItem,
                ),
                new Text("Zone:"),
                DropdownButton(
                  value: _currentZone,
                  items: _dropDownZoneItems,
                  onChanged: changedZoneItem,
                ),
                new Text("Barangay No.:"),
                DropdownButton(
                  value: _currentBarangay,
                  items: _dropDownBarangayItems,
                  onChanged: changedBarangayItem,
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(70.0, 0.0, 70.0, 0.0),
                  height: 40.0,
                  child: GestureDetector(
                    onTap: () {
                      _handleSubmit();
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.blue,
                      elevation: 5.0,
                      child: Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                )
              ],
            ),
          ]),
        ));
  }
}
