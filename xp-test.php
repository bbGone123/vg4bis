<html>
<head>
<title> XPath test </title>
<style>
body {background-color:#ffe;}
th {background-color: lightblue;}
table {background-color: aqua; border-color:black;}
table, th, td{ border: 1px solid black; border-spacing: 0;}
td {text-align:center; }
input[type=text]  {width: 650px;position: absolute; left: 600px; font-weight: bold; color: purple;}
input[type=submit] {position: absolute; left: 200px;}
div.forma   {margin:40px 40px 40px 40px;background-color: #ddd;width:700px;}
div.output  {}
div.ans {background-color: #afc;width: 500px;font-weight: bold; color: blue;}
ul {list-style-type:none;}
</style>
</head>

<body>


<?php
# process submitted 
if ($_SERVER["REQUEST_METHOD"] == "POST" && $_POST['submit'] == 'Submit test')
  {
    $xp1 = $_POST['t1'];
    $xp2 = $_POST['t2'];
    $xp3 = $_POST['t3'];
    $xp4 = $_POST['t4'];
    $xp5 = $_POST['t5'];
    $xp6 = $_POST['t6'];
    $xp7 = $_POST['t7'];
 }
else {$xp1=$xp2=$xp3=$xp4=$xp5=$xp6=$xp7="/";}

# table rows
$array = array(
    array('Name'=>'Todd Sexton', 'Cups per day'=>'10', 'Type of Coffee'=>'Espresso', 'Sugar?'=>'No'),
    array('Name'=>'Justin Dinnen', 'Cups per day'=>'5', 'Type of Coffee'=>'Decaf', 'Sugar?'=>'Yes'),
    array('Name'=>'John Fuller', 'Cups per day'=>'2', 'Type of Coffee'=>'Zorro', 'Sugar?'=>'No'),
    array('Name'=>'Martin Black', 'Cups per day'=>'4', 'Type of Coffee'=>'Americano', 'Sugar?'=>'Yes'),
    array('Name'=>'Patricia M. Rates', 'Cups per day'=>'15', 'Type of Coffee'=>'Guillermo', 'Sugar?'=>'Yes'),
    array('Name'=>'Joe Anderssen', 'Cups per day'=>'7', 'Type of Coffee'=>'Espresso', 'Sugar?'=>'Yes'),
);

shuffle($array);
echo build_table($array);
# update xpath file
$file = fopen("xp-test.html","w");
fwrite($file,"<html><body>");
fwrite($file,build_table($array));
fwrite($file,"</body></html>");
fclose($file);
?>


<div class="forma">
<form NAME ="form1" METHOD ="POST" ACTION ="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
<ul>
 <li>total number of managers<input type="text" name="t1" value='<?php echo $xp1;?>' />
 <li>total cups per day     <input type="text" name="t2" value='<?php echo $xp2;?>' />
 <li>which coffee Martin Black prefers<input type="text" name="t3" value='<?php echo $xp3;?>' />
 <li>how many managers drink Espresso<input type="text" name="t4" value='<?php echo $xp4;?>' />
 <li>which managers drink coffee without sugar<input type="text" name="t5" value='<?php echo $xp5;?>' />
 <li>how many caps of coffee Joe Anderssen and Justin Dinnen drink per day<input type="text" name="t6" value='<?php echo $xp6;?>' />
 <li>does John Fuller drink coffee Zorro? <input type="text" name="t7" value='<?php echo $xp7;?>' />
 <p><input name="submit" type="submit" value="Submit test"  /> </p>
</ul>

</form>
</div>



<div class="output">
<ul>
 <li>total number of managers: <div class="ans"><?php process_xpath($xp1);   ?></div>
 <li>total cups per day:     <div class="ans"><?php   process_xpath($xp2); ?></div>
 <li>which coffee Martin Black prefers: <div class="ans"><?php   process_xpath($xp3); ?></div>
 <li>how many managers drink Espresso: <div class="ans"><?php   process_xpath($xp4); ?></div>
 <li>which managers drink coffee without sugar: <div class="ans"><?php  process_xpath($xp5);  ?></div>
 <li>how many caps of coffee Joe Anderssen and Justin Dinnen drink per day: <div class="ans"><?php  process_xpath($xp6);  ?></div>
 <li>does John Fuller drink coffee Zorro?: <div class="ans"><?php  process_xpath($xp7);  ?></div>
</ul>
</div>





<?php
/*
<ul>
<li> total numer of managers: count(//tr)-1</li>
<li> total cups per day: sum(//tr/td[2])</li>
<li> which coffee Martin Black prefers: //td[(text()="Martin Black")]/following-sibling::td[2]/text() </li>
<li> how many managers drink espresso: count(//td[contains(text(),"Espresso")])  </li>
<li> which managers drink coffee without sugar: //td[(text()="No")]/preceding-sibling::td[3]/text() </li>
<li> how many total caps of coffee Joe Anderssen and Justin Dinnen drink per day (12): sum(//td[(text()="Joe Anderssen") or (text()="Justin Dinnen")]/following-sibling::td[1]) </li>
<li> does John Fuller dring coffee Zorro?: boolean(//td[text()="John Fuller"]/following-sibling::td[2][text()="Zorro"])
</ul>
*/
?>

</body>

</html>

<?php 
  # verify Xpath
   #$xp_pattern  = '//td[(text()="No")]/preceding-sibling::td[3]/text()';
   #$xp_pattern = 'count(//tr)-1';
   #$xp_pattern  = '//td[(text()="Martin Black")]/following-sibling::td[2]/text()';
   #$xp_pattern = 'sum(//tr/td[2])';
   #$xp_pattern = 'count(//td[contains(text(),"Espresso")])';
   #$xp_pattern = 'sum(//td[(text()="Joe Anderssen") or (text()="Justin Dinnen")]/following-sibling::td[1])';
   #$xp_pattern = 'count(//td[contains(text),"Espresso")])';   # invalid syntax


function process_xpath($xp_pattern){
  $dom = new DOMDocument;
  $dom->loadHTMLFile("xp-test.html"); 
  $xpath = new DOMXPath($dom);
 
  $out = "";
  try {
    $nodes = $xpath->evaluate($xp_pattern);   # error is reported here
  }
  catch(Exception $e) { $out = 'Incorrect XPath syntax'; echo $out; return; }
  #print_r($nodes);
  if     (is_numeric($nodes)) {$out = $nodes;}      # works for number
  elseif (is_bool($nodes))    {$out = boolval($nodes)? 'True' : 'False';}
  else  {   # if array returned
     foreach ($nodes as $i => $node) {$out .= "$node->nodeValue <br />"; }
   }
  # report invalid XPath syntax: does not work
  #if (strpos($out, 'Warning') !== false) { $out = 'Incorrect XPath syntax'; }
  echo $out;    
 }


function build_table($array){
    // start table
    $html = '<table summary="This table charts the number of cups of coffee consumed by each manager, the type 
                of coffee (decaf or regular), and whether taken with sugar.">';
    $html .= "\n<CAPTION>Cups of coffee consumed by each manager per day</CAPTION>\n";
    // header row
    $html .= '<tr>';
    foreach($array[0] as $key=>$value){ $html .= '<th>' . $key . '</th>'; }
    $html .= "</tr>\n";

    // data rows
    foreach( $array as $key=>$value){
        $html .= '<tr>';
        foreach($value as $key2=>$value2){ $html .= '<td>' . $value2 . '</td>'; }
        $html .= "</tr>\n";
    }

    // finish table and return it
    $html .= '</table>';
    return $html;
}







 /*
 TODO:
 1. create xpath evaluate function (done)
 2. evaluate all xpath expressions, put the answer next to the quiery or below the form as a table (done)
 3. proper handle invalid xpath syntax
 4. shaffle table rows (done)
 */  

?> 