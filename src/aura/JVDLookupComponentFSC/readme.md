<h1>Instructions</h1>

This flow components allows you to mimic the behavior of a Lookup field in a flow screen.

<h2>Input Attributes</h2>

<h3>Required Input Attributes</h3>
<dl>
<dt>objectName (Object Name)</dt>
<dd>The object you want to show data from, for example Account</dd>
<dt>fieldName (Display Field)</dt>
<dd>The name of the field to show in the result list</dd>
<dt>iconName (Icon)</dt>
<dd>Referenced to an slds icon to use, see here for the full list: 
<a href="https://www.lightningdesignsystem.com/icons/">https://www.lightningdesignsystem.com/icons/</a>. An example is: action:add_contact
</dd>
</dl>

<h3>Optional Input Attributes</h3>
<dl>
<dt>Label (Field Label)</dt>
<dd>The label to show with the field</dd>
<dt>required (Show required)</td>
<dd>True/False, if the lookup field should be a required field or not. Default is false</dd>
<dt>LoadingText (Show Loading Indicator)</dt>
<dd>True/False, if the loading indicator should be show when fetching data. Default is false</dd>
</dl>

<h2>Output Attributes</h2>
<dl>
<dt>selectRecordId (Selected Id)</dt>
<dd>The id of the selected record</dd>
<dt>selectRecordName (Selected Record Name)</dt>
<dd>The value of the display field that was selected in the inputs for the selected record</dd>
</dl>
