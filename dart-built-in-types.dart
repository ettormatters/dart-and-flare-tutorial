/*

numbers
strings
booleans
lists (also known as arrays)
sets
maps
runes (for expressing Unicode characters in a string)
symbols

*/



void main() {
  
  // numbers : int, double
  
  var x = 1;
  var hex = 0xDEADBEEF;
  
  var y = 1.1;
  var exponents = 1.42e5;
  
  double z = 1; // Equivalent to double z = 1.0.
  
  // String -> int
  var one = int.parse('1');
  assert(one == 1);

  // String -> double
  var onePointOne = double.parse('1.1');
  assert(onePointOne == 1.1);

  // int -> String
  String oneAsString = 1.toString();
  assert(oneAsString == '1');

  // double -> String
  String piAsString = 3.14159.toStringAsFixed(2);
  assert(piAsString == '3.14');
  
  assert((3 << 1) == 6); // 0011 << 1 == 0110
  assert((3 >> 1) == 1); // 0011 >> 1 == 0001
  assert((3 | 4) == 7); // 0011 | 0100 == 0111
  
  const msPerSecond = 1000;
  const secondsUntilRetry = 5;
  const msUntilRetry = secondsUntilRetry * msPerSecond;
  
  // Strings
  var s1 = 'Single quotes work well for string literals.';
  var s2 = "Double quotes work just as well.";
  var s3 = 'It\'s easy to escape the string delimiter.';
  var s4 = "It's even easier to use the other delimiter.";

  var s = 'string interpolation';

  assert('Dart has $s, which is very handy.' ==
      'Dart has string interpolation, ' +
          'which is very handy.');
  assert('That deserves all caps. ' +
          '${s.toUpperCase()} is very handy!' ==
      'That deserves all caps. ' +
          'STRING INTERPOLATION is very handy!');
  
  var s1 = 'String '
    'concatenation'
    " works even over line breaks.";
  assert(s1 ==
      'String concatenation works even over '
          'line breaks.');

  var s2 = 'The + operator ' + 'works, as well.';
  assert(s2 == 'The + operator works, as well.');
  
  var s1 = '''
          You can create
          multi-line strings like this one.
          ''';

  var s2 = """This is also a
          multi-line string.""";
  
  var s = r'In a raw string, not even \n gets special treatment.';
  
  // These work in a const string.
  const aConstNum = 0;
  const aConstBool = true;
  const aConstString = 'a constant string';

  // These do NOT work in a const string.
  var aNum = 0;
  var aBool = true;
  var aString = 'a string';
  const aConstList = [1, 2, 3];

  const validConstString = '$aConstNum $aConstBool $aConstString';
  // const invalidConstString = '$aNum $aBool $aString $aConstList';
  
  // Booleans : true, false
  // Check for an empty string.
  var fullName = '';
  assert(fullName.isEmpty);

  // Check for zero.
  var hitPoints = 0;
  assert(hitPoints <= 0);

  // Check for null.
  var unicorn;
  assert(unicorn == null);

  // Check for NaN.
  var iMeantToDoThis = 0 / 0;
  assert(iMeantToDoThis.isNaN);
  
  // List
  var list = [1, 2, 3];
  
  var list = [1, 2, 3];
  assert(list.length == 3);
  assert(list[1] == 2);

  list[1] = 1;
  assert(list[1] == 1);

  var constantList = const [1, 2, 3];
  // constantList[1] = 1; // Uncommenting this causes an error.

   var list = [1, 2, 3];
  var list2 = [0, ...list];
  assert(list2.length == 4);
  
  var list;
  var list2 = [0, ...?list];
  assert(list2.length == 1);
  
  var nav = [
    'Home',
    'Furniture',
    'Plants',
    if (promoActive) 'Outlet'
  ];
  
  var listOfInts = [1, 2, 3];
  var listOfStrings = [
    '#0',
    for (var i in listOfInts) '#$i'
  ];
  assert(listOfStrings[1] == '#1');
  
   // Sets : A set in Dart is an unordered collection of unique items.
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  
  var names = <String>{};
  // Set<String> names = {}; // This works, too.
  // var names = {}; // Creates a map, not a set.
  
  var elements = <String>{};
  elements.add('fluorine');
  elements.addAll(halogens);
  
  var elements = <String>{};
  elements.add('fluorine');
  elements.addAll(halogens);
  assert(elements.length == 5);
  
  final constantSet = const {
    'fluorine',
    'chlorine',
    'bromine',
    'iodine',
    'astatine',
  };
  // constantSet.add('helium'); // Uncommenting this causes an error.
  
  // Maps : In general, a map is an object that associates keys and values.
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };
  
   var gifts = Map();
    gifts['first'] = 'partridge';
    gifts['second'] = 'turtledoves';
    gifts['fifth'] = 'golden rings';

    var nobleGases = Map();
    nobleGases[2] = 'helium';
    nobleGases[10] = 'neon';
    nobleGases[18] = 'argon';
  
  var gifts = {'first': 'partridge'};
  gifts['fourth'] = 'calling birds'; // Add a key-value pair
  
  var gifts = {'first': 'partridge'};
  assert(gifts['first'] == 'partridge');
  
  var gifts = {'first': 'partridge'};
  assert(gifts['fifth'] == null);
  
  var gifts = {'first': 'partridge'};
  gifts['fourth'] = 'calling birds';
  assert(gifts.length == 2);
  
  final constantMap = const {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

  // constantMap[2] = 'Helium'; // Uncommenting this causes an error.
  
  // Runes and grapheme clusters
  //import 'package:characters/characters.dart';

  var hi = 'Hi 🇩🇰';
  print(hi);
  print('The end of the string: ${hi.substring(hi.length - 1)}');
  print('The last character: ${hi.characters.last}\n');
  
  // Symbols
  #radix
  #bar
}

