# This code sample uses the 'requests' library:
# http://docs.python-requests.org

from jira_api_classes import *

lana_scrum_stories = ["Lana's scrum stories",  "BG-4583", "BG-6843", "BG-8438", "BG-6803", "BG-8439", "BG-8626", "BG-5137"]
olga_stories       = ["Olga's stories",        "BG-9393","BG-8445","BG-7652","BG-7112","BG-6753","BG-6752","BG-6295","BG-6037","BG-5889","BG-3724","BG-3168","BG-1883","BG-1799","BG-1450","BG-506","BG-104"]
lana_stories       = ["Lana's stories",        "BG-11004","BG-10379","BG-9395","BG-7652","BG-7570","BG-5606","BG-5239","BG-4885","BG-4561","BG-3894","BG-3499","BG-3086","BG-2807","BG-2626","BG-2426","BG-1915","BG-1907","BG-1415","BG-1117","BG-506","BG-112","BG-100"]
maria_all_stories  = ["Maria's all stories",   "BG-8632","BG-7549","BG-6662","BG-6166","BG-6138","BG-5506","BG-3808","BG-3800","BG-3769","BG-3401","BG-2955","BG-2055","BG-1802","BG-340","BG-311","BG-79","BG-58","BG-33"]
prod_releases      = ["Production releases",   "CMPRDEP-509","CMPRDEP-490","CMPRDEP-471","CMPRDEP-450","CMPRDEP-431","CMPRDEP-411","CMPRDEP-390","CMPRDEP-371","CMPRDEP-351","CMPRDEP-331","CMPRDEP-310","CMPRDEP-293","CMPRDEP-275","CMPRDEP-257","CMPRDEP-238","CMPRDEP-220","CMPRDEP-191","CMPRDEP-158","CMPRDEP-124","CMPRDEP-108","CMPRDEP-88","CMPRDEP-70","CMPRDEP-53","CMPRDEP-36","CMPRDEP-17","CMPRDEP-15","CMPRDEP-7"]


def print_all(id):
   b = Issue(id)
   print "%-15s%-15s%-70s%-20s" % (b.type(), b.id(), b.title(), b.status())
   print b.created()
   print b.creator()
   print b.assignee()
   b.print_status_history()

   print "Feature delivery time: " + b.get_time_period(b.first_status_update(), b.last_status_update())
   #print "Last updated: " + b.last_updated()

if __name__ == '__main__':


    for epic_set in ( prod_releases,
            # lana_stories,
            # lana_scrum_stories,olga_stories,maria_all_stories
                    ):
       for issue in  epic_set:
          if not "-" in issue:
             print "=" * 20 + issue + "=" * 20
             continue
          print_all(issue)
          print "=" * 163 + "\n\n"
       print "x" * 163 + "\n\n\n"
