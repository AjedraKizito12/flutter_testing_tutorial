//TODO 1: Write a main() method to execute yourr tests
//TODO 2: Create a group with the name of the class

//TODO 3.1: Write a test that the Timehelper should return Morning
//TODO 3.2: Write a test that the Timehelper should return Afternoon
//TODO 3.3: Write a test that the Timehelper should return Evening
//TODO 3.4: Write a test that the Timehelper should return Night

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_tutorial/util/time_helper.dart';

void main() {
  group("TimeHelper", () {
    group("Get time of the day", () {
      test('Timehelper should return Night', () {
        //Arrange
        DateTime currentTime = DateTime(2020, 1, 1, 5);

        //Act

        //Assert
        expect(TimeHelper.getTimeOfTheDay(currentTime), "Night");
      });
      test('Timehelper should return Afternoon', () {
        //Arrange
        DateTime currentTime = DateTime(2020, 1, 1, 15);

        //Act

        //Assert
        expect(TimeHelper.getTimeOfTheDay(currentTime), "Afternoon");
      });
      test('Timehelper should return Evening', () {
        //Arrange
        DateTime currentTime = DateTime(2020, 1, 1, 18);

        //Act

        //Assert
        expect(TimeHelper.getTimeOfTheDay(currentTime), "Evening");
      });
      test('Timehelper should return Morning', () {
        //Arrange
        DateTime currentTime = DateTime(2020, 1, 1, 9);

        //Act

        //Assert
        expect(TimeHelper.getTimeOfTheDay(currentTime), "Morning");
      });
    });
  });
}
