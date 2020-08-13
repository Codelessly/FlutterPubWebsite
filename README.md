[![Pub.dev Cover](screenshots/Pub%20Website%20Cover.png)](https://gallery.codelessly.com/flutterwebsites/pub?utm_medium=image&utm_campaign=cover)
# [Pub.dev Website - Rebuilt in Flutter](https://gallery.codelessly.com/flutterwebsites/pub)
[![Flutter Responsive](https://img.shields.io/badge/flutter-responsive-brightgreen.svg?style=flat-square)](https://github.com/Codelessly/ResponsiveFramework) [![GitHub release](https://img.shields.io/github/release/Codelessly/FlutterPubWebsite.svg?style=flat-square)](https://github.com/Codelessly/FlutterPubWebsite/releases) [![GitHub Release Date](https://img.shields.io/github/release-date/Codelessly/FlutterPubWebsite.svg?style=flat-square)](https://github.com/Codelessly/FlutterPubWebsite/releases) [![GitHub issues](https://img.shields.io/github/issues/Codelessly/FlutterPubWebsite.svg?style=flat-square)](https://github.com/Codelessly/FlutterPubWebsite/issues) [![GitHub top language](https://img.shields.io/github/languages/top/Codelessly/FlutterPubWebsite.svg?style=flat-square)](https://github.com/Codelessly/FlutterPubWebsite) [![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/Codelessly/FlutterPubWebsite.svg?style=flat-square)](https://github.com/Codelessly/FlutterPubWebsite) [![Libraries.io for GitHub](https://img.shields.io/librariesio/github/Codelessly/FlutterPubWebsite.svg?style=flat-square)](https://libraries.io/github/Codelessly/FlutterPubWebsite) [![License](https://img.shields.io/badge/License-BSD%200--Clause-orange.svg?style=flat-square)](https://opensource.org/licenses/0BSD)

<a href="https://gallery.codelessly.com/flutterwebsites/pub?utm_medium=image&utm_campaign=logo"><img src="web/icons/Icon-192.png" width="128"></a>

> ### The pub.dev website, rebuilt in Flutter with 💙!

[View Pub.dev Website](https://gallery.codelessly.com/flutterwebsites/pub)

[Skia Version](https://gallery.codelessly.com/flutterwebsites/pub/skia)

## Screenshots

|Desktop|Tablet|Mobile| 
|--|--|--|
|![Screenshots](screenshots/Pub%20Website%20Desktop.png)|![Screenshots](screenshots/Pub%20Website%20Tablet.png)|![Screenshots](screenshots/Pub%20Website%20Mobile.png)|

## The Concept

Pub.dev was recreated in Flutter for 3 primary reasons:

1. Iteratively develop the [Responsive Framework](https://github.com/Codelessly/ResponsiveFramework) and scenario test the library by creating real world websites. The way to make the Responsive Framework the best Flutter web framework is by building actual Flutter websites!
2. Investigate the need for a [Flutter App UI and Website Builder](https://codelessly.com). Does Flutter make web development so easy that Codelessly becomes redundant?
3. Promote Flutter Web and convince more developers to start building Flutter Web components!

## The Build

![Screenshots](screenshots/Pub%20Packages%20Resize.gif)

I envisioned this build as a weekend project and estimated that it would take less than 20 hours. Unfortunately, replicating some web behavior took a bit longer than I expected (see above) and the build ended up taking 27 hours.

I thought my experience building Flutter websites would make development much faster but that was not the case. Fortunately, many of the base essential Flutter web challenges were already solved with the Responsive Framework. Using the Responsive Framework saved at least a dozen hours.

Build breakdown:

- **Website elements (14h)**
  - New project setup and icons (1.5h)
  - Stylesheet creation (1h)
  - Collecting UI images and icons (1h)
  - Pub package data and links (2h)
  - UI elements (8.5h)
- **Responsive Framework (13h)**
  - General website responsiveness (0.5h)
    - Thanks Responsive Framework!!
  - ResponsiveGridView creation (10h)
  - Other responsive elements (2.5h)
- **Publishing (7h)**
  - Code cleanup and testing (2h)
  - Writeup and screenshots (5h)
  
## ResponsiveGridView

ResponsiveGridView is a GridView with responsive capabilities and the newest addition to the Responsive Framework.

ResponsiveGridView extends 'GridView' with the following capabilities:

- Fixed item size.
- Max or min item size.
- Fixed row count.
- Alignment controls.



```dart
ResponsiveGridView.builder(
  gridDelegate: ResponsiveGridDelegate(
      crossAxisExtent: 260,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.37),
  maxRowCount: 1,
  itemCount: favoritePackages.length,
  alignment: Alignment.center,
  itemBuilder: (context, index) {
    return PackageCard(package: favoritePackages[index]);
  },
)
```

ResponsiveGridView provides more fine-grained control over item positioning than a regular GridView.

## Final Thoughts

![Screenshots](screenshots/Pub%20Search.gif)

Flutter Web is not an out of the box solution that lets anyone create a website easily. Flutter widgets are obviously built for mobile and replicating simple web behavior requires creative thinking or writing custom widgets. Writing custom widgets such as reimplementing a GridView takes  time and requires a level of familiarity with Flutter.

However, building websites with Flutter has many advantages over traditional web development such as dramatically lower maintenance costs and high visual fidelity. In the early days, the lack of off-the-shelf Flutter Web components necessitates writing components ourselves which takes a long time. At the time of this writing, at least 500 hours have been spent on developing the Responsive Framework.

As for Codelessly, this experiment has demonstrated there is an opportunity to make Flutter web development simpler and dramatically decrease development time. Instead of a website build taking over 20 hours, building a production-level frontend should take less than 20 minutes.

[Signup for the Codelessly Beta](https://codelessly.com/?utm_medium=link&utm_campaign=beta_signup)

## About

We love pub.dev which we visit everyday. The packages created by the Flutter community save people many hours. Here at Codelessly, we're building a Flutter app UI and website builder to increase productivity and save people even more hours! If that sounds interesting, you'll want to subscribe to updates below 😎

The Pub.dev Template is licensed under Zero-Clause BSD and released as Emailware. If you like this project or it helped you, please subscribe to updates. Although it is not required, you might miss the goodies we share!

<a href="https://codelessly.com/?utm_medium=banner&utm_campaign=newsletter_subscribe" target="_blank"><img src="https://raw.githubusercontent.com/Codelessly/ResponsiveFramework/master/packages/Email%20Newsletter%20Signup.png"></a>

## Acknowledgements ❤️

**Development:** 
* [Ray Li](https://github.com/searchy2)

**Sponsor:** [Codelessly - Flutter App UI and Website Builder](https://codelessly.com/?utm_medium=link&utm_campaign=direct)

<a href="mailto:ray@codelessly.com">
  <img alt="Codelessly Email"
       src="https://lh3.googleusercontent.com/yN_m90WN_HSCohXdgC2k91uSTk9dnYfoxTYwG_mv_l5_05dV2CzkQ1B6rEqH4uqdgjA=w96" />
</a>
<a href="https://codelessly.com/?utm_medium=icon&utm_campaign=direct">
  <img alt="Codelessly Website"
       src="https://lh3.googleusercontent.com/YmMGcgeO7Km9-J9vFRByov5sb7OUKetnKs8pTi0JZMDj3GVJ61GMTcTlHB7u9uHDHag=w96" />
</a>
<a href="https://twitter.com/BuildCodelessly">
  <img alt="Codelessly Twitter"
       src="https://lh3.ggpht.com/lSLM0xhCA1RZOwaQcjhlwmsvaIQYaP3c5qbDKCgLALhydrgExnaSKZdGa8S3YtRuVA=w96" />
</a>
<a href="https://github.com/Codelessly">
  <img alt="Codelessly GitHub"
       src="https://lh3.googleusercontent.com/L15QqmKK7Vl-Ag1ZxaBqNQlXVEw58JT2BDb-ef5t2eboDh0pPSLjDgi3-aQ3Opdhhyk=w96" />
</a>
<br></br>
<a href="https://github.com/Codelessly/ResponsiveFramework">
  <img alt="Built with Responsive Framework"
       src="https://raw.githubusercontent.com/Codelessly/ResponsiveFramework/master/packages/Built%20with%20Responsive%20Badge.png" />
</a>


## License
### Website Template

    BSD Zero Clause License

    Copyright © 2020 Codelessly

    Permission to use, copy, modify, and/or distribute this software for any
    purpose with or without fee is hereby granted.

    THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
    REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
    AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
    INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
    LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
    OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
    PERFORMANCE OF THIS SOFTWARE.

### pub.dev

    Except as otherwise noted, the content of this repository is licensed under the
    Creative Commons Attribution 3.0 License [1], and code samples are licensed
    under the BSD License:

    Copyright 2012, the project authors. All rights reserved. Redistribution and use
    in source and binary forms, with or without modification, are permitted provided
    that the following conditions are met:

        * Redistributions of source code must retain the above copyright
          notice, this list of conditions and the following disclaimer.
        * Redistributions in binary form must reproduce the above
          copyright notice, this list of conditions and the following
          disclaimer in the documentation and/or other materials provided
          with the distribution.
        * Neither the name of Google Inc. nor the names of its
          contributors may be used to endorse or promote products derived
          from this software without specific prior written permission.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
    A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
    OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
    SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
    LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
    DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
    THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
    OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

    [1] http://creativecommons.org/licenses/by/3.0/
