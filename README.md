<h1>Lightning Flow - Local Action Components</h1>

In this repository there is a mix of components that I've comed from
 the official <a href="https://github.com/forcedotcom/LightningFlowComponents/tree/master/flow_local_actions" target="_blank"> Force.com</a> github location and some components that I've written myself. 
 
<h2>Installation</h2>

In this Gibhub I give you the capability to push these components into your Salesforce environment, without using DX, by simply pressing the following button:

<a href="https://githubsfdeploy.herokuapp.com">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>

<h2>Lightning Flow Screen Components</h2>

Next to the official Local Action Components I've started to create Flow Screen Components that you can use in your Flow.

<h3>JVDYouTubeFSC</h3>

This components allows you to embed a YouTube movie in your flow. This component has four input parameters:
<ul>
  <li>videoId, this is the most important one. This is the code that determines which video is shown. If you look at an YouTube URL: https://www.youtube.com/watch?v=46Ph9BIZXxs then the VideoId is the code at the end (46Ph9BIZXxs)</li>
  <li>Title, if you want a title above the video</li>
  <li>Width, defaults to 100%</li>
  <li>Height, the height of the component</li>
  </ul>

<h3>JVDIBANInput</h3>

This component is using the new validate capability of Winter '19 and therefore only works in Winter '19 and beyond. 

This IBAN Input field allows you to capture an IBAN number during a flow and validate it to be correct. To check for a valid IBAN number I make used of <a href="https://github.com/arhs/iban.js" target="_blank">this Javascript library</a> that is provided under the MIT license:

<pre>
Copyright (c) 2013-2017 ARHS Developments SA

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
</pre>

If the IBAN Input field finds a non-valid IBAN number it will return an error message to the flow. The content of that error message is in a custom label called 'NoIBANErrorMsg'. If you want to update the error message, that's the place to do it.
