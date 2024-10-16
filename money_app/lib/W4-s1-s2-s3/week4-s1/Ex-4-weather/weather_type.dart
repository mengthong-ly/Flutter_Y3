enum WeatherType {
  sunrise("Sunrise", "🌅", "15°", "25°"),
  rain("Rain", "🌧️", "10°", "20°"),
  rainfall("Rainfall", "🌦️", "12°", "22°"),
  snow("Snow", "❄️", "-5°", "0°"),
  cloud("Cloudy", "☁️", "18°", "28°"),
  thunderstorm("Thunderstorm", "⛈️", "15°", "25°");

  final String label;
  final String icon;
  final String higestCelsius;
  final String lowestCelsius;

  const WeatherType(
      this.label, this.icon, this.lowestCelsius, this.higestCelsius);
}
