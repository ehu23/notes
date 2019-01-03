# Custom CSS Fonts

## Steps:

1. Download a font from say, Google Fonts. (.ttf or some sort of file type)
2. Use a font face generator (http://www.fontsquirrel.com/tools/webfont-generator) to change that font file into all types for cross browsing.
3. In your css file, have font-face support a new font-family and tell it where it can find the files. It should look like: 

```
@font-face {
font-family: "Harabara Bold";
src: url("css/fonts/Harabara.eot");
src: 
url("css/fonts/Harabara.woff") format("woff"),
url("css/fonts/Harabara.otf") format("opentype"),
url("css/fonts/Harabara.svg#filename") format("svg");
}
```

If you used the font face generator from font squirrel, this css should be in stylesheet.css.

4. Tell which element to use that font specifically and probably have some backup fonts too, i.e: 

```
h1 {
font-family: 'Harabara Bold', Arial, sans-serif;
font-weight:normal;
font-style:normal;
}
```

5. Done. FYI .woff and .woff2 are good enough for cross browser compatibility, if you really want to be safe, you can add .ttf as well, but it's probably good enough with just the latter 2.


