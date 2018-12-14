import ButtonExample from '../components/Buttons/ButtonExample'


# MDX Syntax Guide
## By Eddie Hu

---

# HEADERS

# Header 1
## Header 2
### Header 3
#### Header 4
##### Header 5
###### Header 6

Header 1 Alternative
===========================
Header 2 Alternative
------------

---

# Paragraphs \<p\> written like this:

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis imperdiet vitae metus nec molestie. Fusce convallis, tellus vel tincidunt fringilla, sem tellus aliquam ligula, nec cursus justo orci vitae elit. Morbi accumsan lacus sed dignissim eleifend. Etiam vehicula mauris id purus congue, sit amet pharetra ante condimentum. Phasellus faucibus enim ac sapien lobortis sagittis. Nulla a elit et orci fringilla feugiat.

Separate paragraphs by a blank line.
Or end that line with at least 2 space characters at the end. But make sure your spaces are not being trimmed off on each save automatically.

---

# Emphasis

**bolding** is __like__ this

And *italics* in _this_ fashion

_**BOTH**_ __*AT*__ ___THE___ ***SAME*** **_TIME_**

---

# Block Quote

> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis imperdiet vitae metus nec molestie. Fusce convallis, tellus vel tincidunt fringilla, sem tellus aliquam ligula, nec cursus justo orci vitae elit. Morbi accumsan lacus sed dignissim eleifend. Etiam vehicula mauris id purus congue, sit amet pharetra ante condimentum. Phasellus faucibus enim ac sapien lobortis sagittis. Nulla a elit et orci fringilla feugiat. Maecenas fermentum urna non neque bibendum, a feugiat orci posuere. Donec at augue bibendum, porttitor sem eu, placerat quam. Vivamus turpis ex, laoreet sit amet lectus ac, maximus dapibus eros.
> Curabitur finibus nibh non convallis sagittis. Etiam egestas sed sem in bibendum.
>> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis imperdiet vitae metus nec molestie. Fusce convallis, tellus vel tincidunt fringilla, sem tellus aliquam ligula, nec cursus justo orci vitae elit. Morbi accumsan lacus sed dignissim eleifend. Etiam vehicula mauris id purus congue, sit amet pharetra ante condimentum. Phasellus faucibus enim ac sapien lobortis sagittis. Nulla a elit et orci fringilla feugiat. Maecenas fermentum urna non neque bibendum, a feugiat orci posuere. Donec at augue bibendum, porttitor sem eu, placerat quam. Vivamus turpis ex, laoreet sit amet lectus ac, maximus dapibus eros. Curabitur finibus nibh non convallis sagittis. Etiam egestas sed sem in bibendum.

---

# Lists
1. One
2. Two
3. Three, etc
    8. Indented (tabbed)

+ First item
* Second item
- Third item
    + Indented Fourth item

        To insert elements within a list, must indent (tab or 4 spaces). This is a Paragraph
        > Block Quote

    + Continuing

---

# Denoting code

Must be indented or put in fencing tick marks.

```
let x = 5.5;
const y = [ 1, 2, 4 ];
```

    int arr[100];
    arr[1] = 5;

Or if within another, say line, just use single ticks: `double* dptr = nullptr`

If it includes tick marks, escape with double tick marks: ``tick tick ` tick ` tock ``

---

# Horizontal Rules

---

***

___

---

# Links

Go to Google [here. Try mouse hovering over this](https://www.google.com "text to appear when your mouse hovers over the link")

To quickly link whatever text, just: <https://www.google.com>

<someone@email.com>

Can also bold the **[links](https://www.google.com)**
and italicize them *[using the same rules](https://www.google.com)*
Or **_[both](https://www.google.com)_**

Can reference links in order to make markdown more readable (essentially labelling the links).
[link][label1] and
[another link][2]

[label1]: https://www.google.com "ladadada"
[2]: <https://www.google.com> (hover info of link)

---

# Images

can hover over it as well for text.

![the alt text](/assets/images/branding/hcla.svg "text appear when hovering")

Link images by enclosing image in brackets and append a url in parentheses after:

[![the alt text](/assets/images/branding/hcla.svg "text appear when hovering")](https://www.google.com)

---

# Escaping characters

\* use backslash. This should have been a bullet point


Escapable characters: \`\*\_\{\}\[\]\(\)\#\+\-\.\! and backslash (but mdx is weird and has problems doing this)


---

# JSX Components

\import at the top of file like this: `import ButtonExample from '../components/Buttons/ButtonExample'`

which you can then render like so:

<ButtonExample />


---
