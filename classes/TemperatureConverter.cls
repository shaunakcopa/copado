public class TemperatureConverter {
    // Takes a Fahrenheit temperature and returns the Celsius equivalent.
    public static Decimal FahrenheitToCelsius(Decimal fh) {
    String s;
    String a;
    String b;
        Decimal cs = (fh - 32) * 5/9;
        return cs.setScale(2);
    }
}