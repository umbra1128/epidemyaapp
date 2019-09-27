import 'package:epidemyacaps/list.dart';
import 'package:flutter/material.dart';

class DisplaySelected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (selectedDisease == 'Acute Flaccid Paralysis') {
      return Container(
        height: 450,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Text(
              'Acute Flaccid Paralysis',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            Text(
              'Polio and acute flaccid myelitis (AFM) are illnesses that cause muscle weakness and paralysis (when you’re not able to move). They both typically affect children. Polio is a viral infection that paralyzed more than 15,000 people in the U.S. each year -- mostly children -- in the early 1950s. It’s been wiped out in this country thanks to a vaccine, but it’s still a problem in some places, including Nigeria, New Guinea, and Somalia. Doctors don’t know exactly what causes AFM, but many cases seem to be brought on by a viral infection, too.',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 12.0),
            ),
            Divider(
              height: 15,
            ),
            Text(
              'Symptoms:',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              'AFM causes sudden weakness in your arms and legs, along with a loss of muscle tone and sometimes pain. Your face may also feel weak.',
            ),
            SizedBox(
              height: 14.0,
            ),
            Dot(
              radius: 5.0,
              color: Colors.blue,
              decs: 'Drooping eyelids and trouble moving your eyes',
            ),
            SizedBox(height: 7),
            Dot(
              radius: 5.0,
              color: Colors.blue,
              decs: 'Hard time swallowing or speaking',
            ),
            SizedBox(height: 7),
            Dot(
              radius: 5.0,
              color: Colors.blue,
              decs: 'Slurred speech',
            ),
            SizedBox(height: 7),
            Dot(
              radius: 5.0,
              color: Colors.blue,
              decs: 'Trouble breathing',
            ),
            SizedBox(height: 7),
            Divider(
              height: 15,
            ),
          ],
        ),
      );
    } else if (selectedDisease == 'Adverse Event Following Immunization (AEFI)') {
      return Container(
        height: 450,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Text(
              'Adverse Event Following Immunization (AEFI)',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            Text(
              'As vaccine-preventable infectious diseases continue to decline, people have become increasingly concerned about the risks associated with vaccines. Furthermore, technological advances and continuously increased knowledge about vaccines have led to investigations focused on the safety of existing vaccines which have sometimes created a climate of concern.\n\nAdverse event following immunization is any untoward medical occurrence which follows immunization and which does not necessarily have a causal relationship with the usage of the vaccine. If not rapidly and effectively dealt with, can undermine confidence in a vaccine and ultimately have dramatic consequences for immunization coverage and disease incidence.\n\nAlternatively, vaccine-associated adverse events may affect healthy individuals and should be promptly identified to allow additional research and appropriate action to take place. In order to respond promptly, efficiently, and with scientific rigour to vaccine safety issues, WHO has established a Global Advisory Committee on Vaccine Safety.',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 12.0),
            ),
            Divider(
              height: 15,
            ),
            Text(
              'Symptoms:',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 14.0,
            ),
            Dot(
              radius: 5.0,
              color: Colors.black,
              decs: 'Drooping eyelids and trouble moving your eyes',
            ),
            SizedBox(height: 7),
            Dot(
              radius: 5.0,
              color: Colors.black,
              decs: 'Hard time swallowing or speaking',
            ),
            SizedBox(height: 7),
            Dot(
              radius: 5.0,
              color: Colors.black,
              decs: 'Slurred speech',
            ),
            SizedBox(height: 7),
            Dot(
              radius: 5.0,
              color: Colors.black,
              decs: 'Trouble breathing',
            ),
            SizedBox(height: 7),
            Divider(
              height: 15,
            ),
          ],
        ),
      );
    } else if (selectedDisease == 'Anthrax') {
      return Container(
        height: 450,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Text(
              'Anthrax',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            Text(
              'Anthrax is a serious infectious disease caused by gram-positive, rod-shaped bacteria known as Bacillus anthracis. Anthrax can be found naturally in soil and commonly affects domestic and wild animals around the world. Although it is rare in the United       States, people can get sick with anthrax if they come in contact with infected animals or contaminated animal products. Contact with anthrax can cause severe illness in both humans and animals.\n\nAnthrax is not contagious, which means you can’t catch it like the cold or flu.\n\nHow do animals get infected with anthrax?\nDomestic and wild animals such as cattle, sheep, goats, antelope, and deer can become infected when they breathe in or ingest spores in contaminated soil, plants, or water. In areas where domestic animals have had anthrax in the past, routine vaccination can help prevent outbreaks.\n\nHow do people get infected with anthrax?\nPeople get infected with anthrax when spores get into the body. When anthrax spores get inside the body, they can be “activated.” When they become active, the bacteria can multiply, spread out in the body, produce toxins (poisons), and cause severe illness.',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 12.0),
            ),
            Divider(
              height: 15,
            ),
            Text(
              'Symptoms:',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 14.0,
            ),
            Dot(
              radius: 5.0,
              color: Colors.black,
              decs: 'Drooping eyelids and trouble moving your eyes',
            ),
            SizedBox(height: 7),
            Dot(
              radius: 5.0,
              color: Colors.black,
              decs: 'Hard time swallowing or speaking',
            ),
            SizedBox(height: 7),
            Dot(
              radius: 5.0,
              color: Colors.black,
              decs: 'Slurred speech',
            ),
            SizedBox(height: 7),
            Dot(
              radius: 5.0,
              color: Colors.black,
              decs: 'Trouble breathing',
            ),
            SizedBox(height: 7),
            Divider(
              height: 15,
            ),
          ],
        ),
      );
    } else if (selectedDisease == 'Human Avian Influenzas') {
      return Container(
        height: 450,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Text(
              'Human Avian Influenzas',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            Text(
              'Avian influenza refers to the disease caused by infection with avian (bird) influenza (flu) Type A viruses. These viruses occur naturally among wild aquatic birds worldwide and can infect domestic poultry and other bird and animal species. Avian flu viruses do not normally infect humans. However, sporadic human infections with avian flu viruses have occurred. The links below offer more information about avian influenza.',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 12.0),
            ),
            Divider(
              height: 15,
            ),
            Text(
              'Symptoms:',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'The reported signs and symptoms of avian influenza A virus infections in humans have ranged from mild to severe and included  conjunctivitis, influenza-like illness (e.g., fever, cough, sore throat, muscle aches) sometimes accompanied by nausea, abdominal pain, diarrhea, and vomiting, severe respiratory illness (e.g., shortness of breath, difficulty breathing, pneumonia, acute respiratory distress, viral pneumonia, respiratory failure), neurologic changes (altered mental status, seizures), and the involvement of other organ systems. Asian lineage H7N9 and HPAI Asian lineage H5N1 viruses have been responsible for most human illness worldwide to date, including most serious illnesses and highest mortality.',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 12.0),
            ),
            Divider(
              height: 15,
            ),
          ],
        ),
      );
    }
  }
}

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 5.0,
      height: 5.0,
      decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle),
    );
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;
  final String decs;

  Dot({this.radius, this.color, this.decs});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: this.radius,
          height: this.radius,
          decoration: BoxDecoration(color: this.color, shape: BoxShape.circle),
        ),
        Text('  ' + this.decs),
      ],
    );
  }
}
