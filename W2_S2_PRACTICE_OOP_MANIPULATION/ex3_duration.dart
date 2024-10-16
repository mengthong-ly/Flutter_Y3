class CustomDuration {
  final int _miliseconds;

  int get getMilisecond => _miliseconds;

  CustomDuration({required int miliseconds})
      : this._miliseconds = miliseconds.abs();

  CustomDuration.fromHour({required int Hour})
      : this._miliseconds = (Hour * 3600000).abs();
  CustomDuration.fromMinute({required int Minute})
      : this._miliseconds = (Minute * 60000).abs();
  CustomDuration.fromSecond({required int Second})
      : this._miliseconds = (Second * 1000).abs();

  bool operator >(CustomDuration temp) {
    return this.getMilisecond > temp.getMilisecond;
  }

  CustomDuration operator +(CustomDuration temp) {
    return CustomDuration(miliseconds: this.getMilisecond + temp.getMilisecond);
  }

  // the tricky thing here is to think that would be making sense to you
  // if the miliseconds is - then it is mean that it's already passed
  // but as the exercise instruction we will make it throw exception if it is negative
  CustomDuration operator -(CustomDuration temp) {
    return (this > temp)
        ? CustomDuration(miliseconds: this.getMilisecond - temp.getMilisecond)
        : throw Exception('🙉 invalid time naa kmeng toch');
  }
}

void main() {
  final CustomDuration oneHour = CustomDuration.fromHour(Hour: 1);
  final CustomDuration twoMinutes = CustomDuration.fromMinute(Minute: 2);

  // this line will make everything error
  // var oneHourAndTwoMinutes =   twoMinutes - oneHour;

  // this line will find peace for us
  var oneHourAndTwoMinutes = oneHour - twoMinutes;

  print('Duration: ${oneHourAndTwoMinutes.getMilisecond}ms');

  print(oneHour > twoMinutes);
}