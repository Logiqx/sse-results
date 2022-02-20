## Reporting

PLEASE NOTE: THIS DOCUMENT IS ONLY A SKELETON AND YET TO BE WRITTEN.



### Overview

TODO



#### Report Definitions

TODO - high-level description of how the reports are configured each year.

- Weekly reports; Craft, Status, Fastest (fastest from craft and status), groups, entrants
- Daily reports; same as weekly (albeit with course + time) + verification report + all runs (by name and course)
- Groupings - do not need to worry about bad case in entrants.csv
- Make a note about odd reports like "eligible" (2014 + 2015)
- Youths - weekend filter
- Course lengths in 2000 + 2001
- Explain the need to sort when using run filters; e.g. course length and youths
- "Duplicate" runs
  - Prior to 2010 there were runs with matching start times but different end times. Possibly issue in matching starts + ends?
  - Prior to 2010 there were runs which occurred too soon after the previous one. Possible sail identification issues?
  - 2010 onwards had genuine duplicate runs; SPB + SBN (Patrick Van Hoof) or multiple units (Alastair Nicholls)



#### Layout and Styling

TODO - Explain the use of CSS



#### Report Configuration

TODO - low-level description of how the reports, trophies and prixes are configured each year.

Reports can have the following details in the JSON:

| Name       | Mandatory |   Values   | Comment                                                      |
| ---------- | :-------: | :--------: | ------------------------------------------------------------ |
| Comment    |           |    text    | Optional comment for the report                             |
| Fields     |     Y     |    text    | List of fields to be output                                  |
| Filter     |           |    text    | Filter conditions                                            |
| HideFields |           |    text    | List of fields to be hidden from output                                  |
| Limit      |           |  integer   | The maximum number of people to list in the report. Default is unlimited |
| Period     | Y |   "Session", "Event" or "Round"   | Default is "Session" (i.e. single day), whereas "Event" is the whole week. "Round" is for UKWA and ISWC scoring / reporting. |
| Periods     |          |   JSON dict   | Templating function to re-use report definitions (e.g. session and event) |
| Profile     |          | true or false | Whether to include position in daily / weekly profiles. Default is false |
| Rank       |           | true or false | Whether the results should be ranked. Default is true         |
| Reports   | Y |   JSON list   | List of JSON report definitions |
| Runs       |           | true or false | Whether runs should be listed. Default is true         |
| Series     |           |    text    | Used to lookup time limits and scoring for UKWA / ISWC sessions |
| ShowSpeeds |           |  integer   | Can be used to report up to the 10 best speeds (e.g. verification report) |
| Sort       |           |    text    | Specify custom sort specification. Typically used for "all runs" reports |
| Suptitle   |           |    text    | Title for the set of reports; h2 element in html |
| Title      |     Y     |    text    | Title for the individual report; h3 element in html |
| Warning    |           | true or false | Whether a warning should be output to the console. Default is false |

N.B. There is a system of object orientation / inheritance so that properties can be shared by multiple reports.
