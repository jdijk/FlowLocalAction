<h1>Lightning Flow - Local Action Components</h1>

These components are only a copy of the components that are in the official <a href="https://github.com/forcedotcom/LightningFlowComponents/tree/master/flow_local_actions"> Force.com</a> github location.

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

