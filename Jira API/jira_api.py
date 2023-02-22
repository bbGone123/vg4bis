from jira import JIRA
from datetime import *
from dateutil.parser import *

user = 'username@yourcompany.com'
apikey = 'cSXuw7jNlEGn6m1Mmr53AAAF'
server = 'https://yourcompany.atlassian.net'

options = {'server': server}

jira = JIRA(options, basic_auth=(user,apikey) )

class Project():
  def __init__(self,project_code):
    self.project = jira.project(project_code)

  def run_jql_query(self, query_str):     # return result of jql query
    pass


class Issue():
  def __init__(self,issue_id):
    self.issue_status_history = []
    self.issue = jira.issue(issue_id, expand='changelog')
    self.changelog = self.issue.changelog
    self.status_history()

  def _to_timestamp(self, timestr):      # convert time string into datetime timestamp, like datetime.datetime(2021, 2, 8, 17, 50, 13, 325000, tzinfo=tzoffset(None, -28800))
    return parse(timestr, yearfirst=True)

  def _to_timeperiod(self,start_timestamp,end_timestamp):     # return time period as a string
    elapsed_time =  start_timestamp - end_timestamp
    days      = elapsed_time.days
    hours     = elapsed_time.seconds / 3600
    minutes   = elapsed_time.seconds % 3600 / 60
    seconds   = elapsed_time.seconds % 3600 % 60
    return "%s days %s:%s:%s" % (days, hours, minutes, seconds)

  def type(self):
    # return a string like 'Epic', 'Bug', etc
    return self.issue.fields.issuetype

  def id(self):
    return self.issue.key

  def title(self):
    return self.issue.fields.summary

  def created(self):
    return self.issue.fields.created

  def creator(self):
    return self.issue.fields.creator

  def assignee(self):
    return self.issue.fields.assignee

  def status(self):
    return self.issue.fields.status

  def fix_versions(self):     # returns list of fix versions
    return self.issue.fields.fixVersions

  def labels(self):    # returns lest of labels
    return self.issue.fields.labels

  def last_updated(self):
    return self.issue.fields.updated

  def status_history(self):
    for history in self.changelog.histories:
      for item in history.items:
        if item.field == 'status':
          self.issue_status_history.append(
            {"updated_by"  :   history.author.displayName,
             "updated_time":   history.created,
             "from"        :   item.fromString,
             "to"          :   item.toString
             })
          #print   'By:' + history.author.displayName + ' Date:' + history.created + ' From:' + item.fromString + ' To:' + item.toString


  def last_status_update(self):       # return dictionary with details of the last status update
    return self.issue_status_history[0]


  def print_status_history(self):
    format_str = "|%25s|%32s|%30s|%30s|"
    title = format_str  %  ("Updated by","Time","From","To")
    print "-" * 122;  print title;    print "-" * 122         # print header

    for record in self.issue_status_history:
       print  format_str % (record["updated_by"],record["updated_time"],record["from"],record["to"])


  def get_elapsed_time(self,start_time,end_time):
      return self._to_timeperiod(self._to_timestamp(start_time),self._to_timestamp(end_time))

  def subtasks(self):
    # return list of subtasks with their status
    stasks = self.issue.fields.subtasks
    # TODO: return list of subtasks with statuses and last updated
    pass


if __name__ == '__main__':
    def print_all(id):
       b = Issue(id)
       print "%-15s%-15s%-70s%-20s" %  (b.type(), b.id(), b.title(), b.status())
       print b.created()
       print b.creator()
       print b.assignee()
       b.print_status_history()

       print "Elapsed time: " + b.get_elapsed_time(b.last_status_update()['updated_time'],b.created())



    for issue in ("BG-6843", "BG-8438", "BG-6803", "BG-8439", "BG-8626", "BG-4583", "BG-5137"):
       print_all(issue)
       print "=" * 122






"""
# ====================================================
TODO: BG-4583 doe not return the full history. It should start from Samantha Open -> Epic in Progress March 2, 2020, 5:56 PM



# ------ JQL ------------
# Search returns first 50 results, `maxResults` must be set to exceed this
issues_in_proj = jira.search_issues('project=BG')
OR jira.search_issues('project=BG', maxResults=5, expand='changelog')
all_proj_issues_but_mine = jira.search_issues('project=BG and assignee != currentUser()')

# my top 5 issues due by the end of the week, ordered by priority
oh_crap = jira.search_issues('assignee = currentUser() and due < endOfWeek() order by priority desc', maxResults=5)

# Summaries of my last 3 reported issues
for issue in jira.search_issues('reporter = currentUser() order by created desc', maxResults=3):
    print   '{}: {}'.format(issue.key, issue.fields.summary)

# transitions
issue = jira.issue('BG-11101')
transitions = jira.transitions(issue)

for t in transitions:
    print "%s: %s" % (t['id'], t['name'])

"""


"""
dir(jira)
Python 2.7.14 (default, Dec 15 2017, 16:31:45) [MSC v.1500 64 bit (AMD64)]
Out[1]:
['AGILE_BASE_URL', 'DEFAULT_OPTIONS', 'JIRA_BASE_URL', '__class__', '__del__', '__delattr__', '__dict__', '__doc__', '__format__', '__getattribute__', '__hash__', '__init__',
 '__module__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_check_for_html_error',
 '_check_update_', '_create_cookie_auth', '_create_http_basic_session', '_create_jwt_session', '_create_kerberos_session', '_create_oauth_session', '_fetch_pages', '_fields',
 '_find_for_resource', '_gain_sudo_session', '_get_items_from_page', '_get_json', '_get_mime_type', '_get_sprint_field_id', '_get_url', '_magic', '_options', '_rank', '_session',
 '_set_avatar', '_timestamp', '_try_magic', '_version',

 'add_attachment', 'add_comment', 'add_group', 'add_issues_to_epic', 'add_issues_to_sprint', 'add_remote_link', 'add_simple_link', 'add_user', 'add_user_to_group', 'add_vote',
 'add_watcher', 'add_worklog', 'application_properties', 'applicationlinks', 'assign_issue', 'async_do', 'attachment', 'attachment_meta', 'backup', 'backup_complete', 'backup_download',
 'backup_progress', 'boards', 'checked_version', 'client_info', 'close', 'comment', 'comments', 'component', 'component_count_related_issues', 'confirm_project_avatar', 'confirm_user_avatar',
 'create_board', 'create_component', 'create_customer', 'create_customer_request', 'create_filter', 'create_issue', 'create_issue_link', 'create_issues', 'create_project',
 'create_sprint', 'create_temp_project_avatar', 'create_temp_user_avatar', 'create_version', 'createmeta', 'current_user', 'custom_field_option', 'dashboard', 'dashboards', 'deactivate_user',
 'delete_attachment', 'delete_board', 'delete_component', 'delete_issue_link', 'delete_project', 'delete_project_avatar', 'delete_user', 'delete_user_avatar', 'deploymentType',
 'editmeta', 'favourite_filters', 'fields', 'filter', 'find', 'find_transitionid_by_name', 'get_igrid', 'group_members', 'groups', 'incompletedIssuesEstimateSum', 'issue', 'issue_link',
 'issue_link_type', 'issue_link_types', 'issue_type', 'issue_type_by_name', 'issue_types', 'kill_session', 'kill_websudo', 'logging', 'move_to_backlog', 'move_version', 'my_permissions',
 'myself', 'priorities', 'priority', 'project', 'project_avatars', 'project_components', 'project_role', 'project_roles', 'project_versions', 'projects', 'rank', 'reindex', 'remote_link',
 'remote_links', 'remove_group', 'remove_user_from_group', 'remove_vote', 'remove_watcher', 'removedIssuesEstimateSum', 'removed_issues', 'rename_user', 'request_type_by_name', 'request_types',
 'resolution', 'resolutions', 'search_allowed_users_for_issue', 'search_assignable_users_for_issues', 'search_assignable_users_for_projects', 'search_issues', 'search_users', 'security_level',
 'server_info', 'service_desk', 'service_desks', 'session', 'set_application_property', 'set_project_avatar', 'set_user_avatar', 'sprint', 'sprint_info', 'sprints', 'sprints_by_name',
 'status', 'statuses', 'supports_service_desk', 'sys_version_info', 'transition_issue', 'transitions', 'update_filter', 'update_sprint', 'user', 'user_avatars', 'version',
 'version_count_related_issues', 'version_count_unresolved_issues', 'votes', 'watchers', 'worklog', 'worklogs']
"""
