# AutoHotKeys Scripts

### Set Scripts to Run on Windows Start Up

1. Create a Shortcut

- Locate the Launcher script file (e.g., StartUp.ahk) in this folder.
- Right-click the file and select Show more options > Create shortcut.

2. Open the Windows Startup Folder

- Press <kbd>Win</kbd> + <kbd>R</kbd> on your keyboard to open the Run dialog.
- Type the following command into the text box:
  **shell:startup**
- Press <kbd>Enter</kbd> or click OK.
  (A File Explorer window will open displaying the Startup directory).

3. Move the Shortcut here

---

## Visual Studio Scripts

Note: You can perform action by pressing one of the following ending keys: <kbd>Enter</kbd> , <kbd>Space</kbd> , or <kbd>Tab</kbd>

### XAML Grid Utility

<table border="1" cellpadding="10" cellspacing="0">
  <thead>
    <tr>
      <th>Feature</th>
      <th>Trigger Command</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Column Definitions</strong></td>
      <td><kbd>grid.col</kbd> + <kbd>{number}</kbd></td>
      <td>Generates <code>{number}</code> of columns.</td>
    </tr>
    <tr>
      <td><strong>Row Definitions</strong></td>
      <td><kbd>grid.row</kbd> + <kbd>{number}</kbd></td>
      <td>Generates <code>{number}</code> of rows.</td>
    </tr>
  </tbody>
</table>

#### Usage Example

<p><strong>1. Columns</strong><br>
To create a grid with <strong>3 columns</strong>, type <kbd>grid.col3</kbd> and press ending key.</p>

<p><strong>Generated Output:</strong></p>
<pre><code class="language-xml">&lt;Grid&gt;
    &lt;Grid.ColumnDefinitions&gt;
        &lt;ColumnDefinition /&gt;
        &lt;ColumnDefinition /&gt;
        &lt;ColumnDefinition /&gt;
    &lt;/Grid.ColumnDefinitions&gt;
&lt;/Grid&gt;
</code></pre>

<p><strong>2. Rows</strong><br>
To create a grid with <strong>2 rows</strong>, type <kbd>grid.row2</kbd> and press ending key.</p>

<p><strong>Generated Output:</strong></p>
<pre><code class="language-xml">&lt;Grid&gt;
    &lt;Grid.RowDefinitions&gt;
        &lt;RowDefinition /&gt;
        &lt;RowDefinition /&gt;
    &lt;/Grid.RowDefinitions&gt;
&lt;/Grid&gt;
</code></pre>

---

### XAML Interaction Trigger

<table border="1" cellpadding="10" cellspacing="0">
  <thead>
    <tr>
      <th>Feature</th>
      <th>Trigger Command</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Event Trigger Snippet</strong></td>
      <td><kbd>i</kbd> + <kbd>{event type}</kbd> + <kbd>{method name}</kbd></td>
      <td>Generates event trigger snippet with EventName as <code>{event type}</code> and MethodName as <code>{method name}</code>.</td>
    </tr>
  </tbody>
</table>

#### Usage Example

Type <kbd>i.Click.Save</kbd> and press ending key.

<p><strong>Output:</strong></p>
<pre><code class="language-xml">&lt;i:Interaction.Triggers&gt;
    &lt;i:EventTrigger EventName="Click"&gt;
        &lt;cal:ActionMessage MethodName="Save" /&gt;
    &lt;/i:EventTrigger&gt;
&lt;/i:Interaction.Triggers&gt;
</code></pre>

---

### Lorem Ipsum Generator

<table border="1" cellpadding="10" cellspacing="0">
  <thead>
    <tr>
      <th>Feature</th>
      <th>Trigger Command</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Word Generator</strong></td>
      <td><kbd>lorem</kbd> + <kbd>{number}</kbd></td>
      <td>Generates <code>{number}</code> of placeholder words.</td>
    </tr>
  </tbody>
</table>

#### Usage Example

<p><strong>1. Short Phrase</strong><br>
Type <kbd>lorem5</kbd> and press ending key.

<p><strong>Output:</strong></p>
<blockquote>
Lorem ipsum dolor sit amet.
</blockquote>

<p><strong>2. Long Paragraph</strong><br>
Type <kbd>lorem20</kbd> and press ending key.

<p><strong>Output:</strong></p>
<blockquote>
Lorem ipsum dolor sit amet consectetur adipiscing elit sed, do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim.
</blockquote>
