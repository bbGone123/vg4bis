# This code sample uses the 'requests' library:
# http://docs.python-requests.org

from jira_api_classes import *

lana_scrum_bugs = ["Lana's scrum stories",  "BG-4583", "BG-6843", "BG-8438", "BG-6803", "BG-8439", "BG-8626", "BG-5137"]
olga_stories       = ["Olga's stories",        "BG-9393","BG-8445","BG-7652","BG-7112","BG-6753","BG-6752","BG-6295","BG-6037","BG-5889","BG-3724","BG-3168","BG-1883","BG-1799","BG-1450","BG-506","BG-104"]
lana_stories       = ["Lana's stories",        "BG-11004","BG-10379","BG-9395","BG-7652","BG-7570","BG-5606","BG-5239","BG-4885","BG-4561","BG-3894","BG-3499","BG-3086","BG-2807","BG-2626","BG-2426","BG-1915","BG-1907","BG-1415","BG-1117","BG-506","BG-112","BG-100"]
maria_bugs  = ["Maria's all stories",   "BG-8632","BG-7549","BG-6662","BG-6166","BG-6138","BG-5506","BG-3808","BG-3800","BG-3769","BG-3401","BG-2955","BG-2055","BG-1802","BG-340","BG-311","BG-79","BG-58","BG-33"]
prod_bugs      = ["Production bugs",   "BG-11786","BG-11777","BG-11775","BG-11774","BG-11773","BG-11772","BG-11759","BG-11758","BG-11743","BG-11715","BG-11699","BG-11698","BG-11697","BG-11681","BG-11669","BG-11657","BG-11646","BG-11633","BG-11627","BG-11623","BG-11614","BG-11610","BG-11609","BG-11604","BG-11587","BG-11581","BG-11563","BG-11556","BG-11536","BG-11534","BG-11533","BG-11525"]
prod_bugs_ii   = ["Production bugs II","BG-11508","BG-11499","BG-11498","BG-11495","BG-11489","BG-11487","BG-11481","BG-11458","BG-11457","BG-11456","BG-11446","BG-11445","BG-11440","BG-11431","BG-11429","BG-11426","BG-11424","BG-11418","BG-11381","BG-11380","BG-11379","BG-11376","BG-11358","BG-11349","BG-11348","BG-11347","BG-11316","BG-11312","BG-11309","BG-11307","BG-11304","BG-11300","BG-11296","BG-11288","BG-11280","BG-11279","BG-11267","BG-11255","BG-11230","BG-11227","BG-11223","BG-11218","BG-11188","BG-11181","BG-11176","BG-11164","BG-11140","BG-11137","BG-11134","BG-11131","BG-11126","BG-11112","BG-11103","BG-11102","BG-11099","BG-11095","BG-11094","BG-11086","BG-11085","BG-11076","BG-11062","BG-11061","BG-11058","BG-11057","BG-11055","BG-11054","BG-11053","BG-11052","BG-11046","BG-11033","BG-11029","BG-11024","BG-11023","BG-11020","BG-11014","BG-11007","BG-11006","BG-11005","BG-11003","BG-11002","BG-10999","BG-10995","BG-10981","BG-10973","BG-10958","BG-10948","BG-10937","BG-10934","BG-10928","BG-10922","BG-10921","BG-10907","BG-10895","BG-10892","BG-10889","BG-10883","BG-10878","BG-10875","BG-10869","BG-10866","BG-10865","BG-10858","BG-10857","BG-10838","BG-10827","BG-10826","BG-10818","BG-10811","BG-10803","BG-10793","BG-10791","BG-10790","BG-10787","BG-10786","BG-10785","BG-10772","BG-10738","BG-10727","BG-10721","BG-10700","BG-10699","BG-10697","BG-10696","BG-10689","BG-10684","BG-10680","BG-10675","BG-10668","BG-10658","BG-10653","BG-10652","BG-10646","BG-10606","BG-10600","BG-10579","BG-10570","BG-10566","BG-10564","BG-10556","BG-10550","BG-10548","BG-10540","BG-10530","BG-10526","BG-10524","BG-10520","BG-10470","BG-10462","BG-10438","BG-10426","BG-10424","BG-10420","BG-10418","BG-10417","BG-10415","BG-10410","BG-10409","BG-10408","BG-10406","BG-10394","BG-10392","BG-10376","BG-10369","BG-10367","BG-10366","BG-10356","BG-10355","BG-10351","BG-10347","BG-10322","BG-10290","BG-10268","BG-10259","BG-10254","BG-10252","BG-10247","BG-10237","BG-10234","BG-10215","BG-10201","BG-10200","BG-10178","BG-10173","BG-10166","BG-10160","BG-10156","BG-10145","BG-10132","BG-10111","BG-10102","BG-10094","BG-10087","BG-10083","BG-10076","BG-10067","BG-10060","BG-10059","BG-10047","BG-10045","BG-10039","BG-10027","BG-10015"]
customer_prod_bugs_s1 = ["Customer Prod bugs S1", "BG-14346","BG-13563","BG-13479","BG-12341","BG-11681","BG-11676","BG-11525","BG-11029","BG-15526","BG-13478","BG-12477","BG-11853","BG-10907"]
customer_prod_bugs_s2 = ["Customer Prod bugs S2", "BG-15301","BG-15130","BG-14635","BG-14615","BG-14506","BG-13705","BG-12439",	"BG-12395","BG-12135","BG-11758","BG-11674",	"BG-11610",	"BG-11137",	"BG-15520",	"BG-15476",	"BG-15195",	"BG-14928",	"BG-14885",	"BG-14839",	"BG-14798",	"BG-14709",	"BG-14648",	"BG-14587",	"BG-14536",	"BG-14532",	"BG-14412",	"BG-14319",	"BG-14199",	"BG-13930",	"BG-13841",	"BG-13803",	"BG-13793",	"BG-13567",	"BG-13491",	"BG-13468",	"BG-13439",	"BG-13414",	"BG-13271",	"BG-13270",	"BG-13206",	"BG-13189",	"BG-12962",	"BG-12687",	"BG-12626",	"BG-12599",	"BG-12549",	"BG-12516",	"BG-12434",	"BG-12329",	"BG-12197",	"BG-12162",	"BG-12146",	"BG-12120",	"BG-11937",	"BG-11825",	"BG-11534",	"BG-11267",	"BG-11094",	"BG-10865"]


def print_all(id):
   b = Issue(id)
   print "%-15s%-15s%-70s%-20s" % (b.type(), b.id(), b.title(), b.status())
   print "Priority: ",  b.priority()
   print "Created: ",   b.created()
   print "Reporter: ",  b.creator()
   print "Assignee: ",  b.assignee()
   print "Affected environment: ", b.affected_env()
   print "Affected versions: ",    b.affected_versions()
   print "Fix version: ",          b.fix_versions()
   b.print_status_history()

   print "Bug was processed in: " + b.get_time_period(b.created(), b.last_status_update())
   #print "Last updated: " + b.last_updated()

if __name__ == '__main__':


    for bug_set in (
            customer_prod_bugs_s2,
            # customer_prod_bugs_s1,
            # prod_bugs,
            # prod_bugs_ii,
            # lana_scrum_bugs,
            # maria_bugs
            # ,olga_stories,maria_all_stories
                    ):
       for issue in  bug_set:
          if not "-" in issue:
             print "=" * 20 + issue + "=" * 20
             continue
          print_all(issue)
          print "=" * 163 + "\n\n"
       print "x" * 163 + "\n\n\n"
