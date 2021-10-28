##About
**TinyCSS** — style description language,  has syntax similar to CSS. Support references, math operations with numbers,  can use functions and environment variables that are described in the interpreter.

##Basic syntax

You can leave comments in language,  just write it on new line with '#' character on the sides 
```CSS 
#comment#```

You can set the value of the fields using syntax below
```CSS
FieldName: FieldValue;```

You can init colors by RGB or ARGB constructor 
```CSS
#if call getfield("absoluteRed") we wil get #FF0000#
absoluteRed: Color(255, 0, 0);
absoluteRed_HalfTransparent: Color(128, 255, 0, 0);```

You can links to other fields using ref()
```CSS
greenColor: ref(lightGreen);
lightGreen: Color(144, 238, 144);```

You can refer to color channels [a, r, g, b]
```CSS
someNumber: Color(255, 255, 255).a;
#or#
greenInColorA: ref(colorA).g;
ColorA: #FFCCFFAA;
#or#
rChannel: #FFCCBB.r;
```

You can make simple math operations [/, *, +, -]with numbers using Math()
```CSS
tenPercentFromMinutesInWeek:  Math(Math(Math(Math(60 * 24) * 7) / 100) * 10);
#or#
A_and_B_mix: Color(Math(ref(A).r + ref(B).r), Math(ref(A).g + ref(B).g), Math(ref(A).b + ref(B).b));
a: Color(245, 58, 156);
b: Color(3, 64, 89);
```

You can use functions, for this moment only `min()` `max()` and `linear()`
```CSS
A: #000000;
B: #FFFFFF;
C: linear(ref(A), ref(B), 0.5);
```

You can set different field values depending on the environment variables that are set in the interpreter. For this moment exists only `theme', what can have value "dark" and "light"
```CSS
background(theme=dark): #000000;
background(theme=light): #FFFFFF;
```

##Other 
File extension is `.tscc`
T - mean tiny 
css -  mean CSS