# This code sample uses the 'requests' library:
# http://docs.python-requests.org

from jira_api_classes import *


prod_releases      = ["Production releases",
                      "CMPRDEP-509","CMPRDEP-490","CMPRDEP-471","CMPRDEP-450",
                      "CMPRDEP-431","CMPRDEP-411","CMPRDEP-390","CMPRDEP-371",
                      "CMPRDEP-351","CMPRDEP-331","CMPRDEP-310","CMPRDEP-293",
                      "CMPRDEP-275","CMPRDEP-257","CMPRDEP-238","CMPRDEP-220",
                      "CMPRDEP-191","CMPRDEP-158","CMPRDEP-124","CMPRDEP-108",
                      "CMPRDEP-88","CMPRDEP-70","CMPRDEP-53","CMPRDEP-36",
                      "CMPRDEP-17","CMPRDEP-15","CMPRDEP-7"]

prod_releases_Q32020_Q22021      = ["Production releases from Q3.2021 to Q2.2021",
                      "CMPRDEP-531","CMPRDEP-510","CMPRDEP-490","CMPRDEP-471","CMPRDEP-450",
                      "CMPRDEP-431","CMPRDEP-411","CMPRDEP-390","CMPRDEP-371",
                      "CMPRDEP-351","CMPRDEP-331"]

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


    for release_set in (
            #prod_releases,
            prod_releases_Q32020_Q22021,

                    ):
       for issue in  release_set:
          if not "-" in issue:
             print "=" * 20 + issue + "=" * 20
             continue
          print_all(issue)
          print "=" * 163 + "\n\n"
       print "x" * 163 + "\n\n\n"
